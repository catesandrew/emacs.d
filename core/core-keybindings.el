;;; core-keybindings.el --- Spacemacs Core File
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(require 'core-vars)
(require 'core-funcs)

(defvar dotemacs/prefix-titles nil
  "A `alist` for mapping command prefixes to long names.")

(defvar dotemacs-default-map (make-sparse-keymap)
  "Base keymap for all dotemacs leader key commands.")

(defun dotemacs/translate-C-i (_)
  "If `dotemacs-distinguish-gui-tab' is non nil, the raw key
sequence does not include <tab> or <kp-tab>, and we are in the
gui, translate to [C-i]. Otherwise, [9] (TAB)."
  (interactive)
  (if (and (not (cl-position 'tab (this-single-command-raw-keys)))
           (not (cl-position 'kp-tab (this-single-command-raw-keys)))
           dotemacs-distinguish-gui-tab
           (display-graphic-p))
      [C-i] [?\C-i]))
(define-key key-translation-map [?\C-i] 'dotemacs/translate-C-i)

(defun dotemacs-declare-prefix (prefix name &optional long-name)
  "Declare a prefix PREFIX. PREFIX is a string describing a key
sequence. NAME is a string used as the prefix command.
LONG-NAME if given is stored in `dotemacs/prefix-titles'."
  (let* ((command name)
        (full-prefix (concat dotemacs-leader-key " " prefix))
        (full-prefix-emacs (concat dotemacs-emacs-leader-key " " prefix))
        (full-prefix-lst (listify-key-sequence (kbd full-prefix)))
        (full-prefix-emacs-lst (listify-key-sequence
                                (kbd full-prefix-emacs))))
   ;; define the prefix command only if it does not already exist
   (unless long-name (setq long-name name))
   (which-key-declare-prefixes
     full-prefix-emacs (cons name long-name)
     full-prefix (cons name long-name))))

(defun dotemacs-declare-prefix-for-mode (mode prefix name &optional long-name)
  "Declare a prefix PREFIX. MODE is the mode in which this prefix command should
be added. PREFIX is a string describing a key sequence. NAME is a symbol name
used as the prefix command."
  (let  ((command (intern (concat (symbol-name mode) name)))
         (full-prefix (concat dotemacs-leader-key " " prefix))
         (full-prefix-emacs (concat dotemacs-emacs-leader-key " " prefix))
         (is-major-mode-prefix (string-prefix-p "m" prefix))
         (major-mode-prefix (concat dotemacs-major-mode-leader-key
                                    " " (substring prefix 1)))
         (major-mode-prefix-emacs
          (concat dotemacs-major-mode-emacs-leader-key
                  " " (substring prefix 1))))
    (unless long-name (setq long-name name))
    (let ((prefix-name (cons name long-name)))
      (which-key-declare-prefixes-for-mode mode
        full-prefix-emacs prefix-name
        full-prefix prefix-name)
      (when (and is-major-mode-prefix dotemacs-major-mode-leader-key)
        (which-key-declare-prefixes-for-mode mode major-mode-prefix prefix-name))
      (when (and is-major-mode-prefix dotemacs-major-mode-emacs-leader-key)
        (which-key-declare-prefixes-for-mode
          mode major-mode-prefix-emacs prefix-name)))))

(defun dotemacs-set-leader-keys (key def &rest bindings)
  "Add KEY and DEF as key bindings under
`dotemacs-leader-key' and `dotemacs-emacs-leader-key'.
KEY should be a string suitable for passing to `kbd', and it
should not include the leaders. DEF is most likely a quoted
command. See `define-key' for more information about the possible
choices for DEF. This function simply uses `define-key' to add
the bindings.

For convenience, this function will accept additional KEY DEF
pairs. For example,

\(dotemacs-set-leader-keys
   \"a\" 'command1
   \"C-c\" 'command2
   \"bb\" 'command3\)"
  (while key
    (define-key dotemacs-default-map (kbd key) def)
    (setq key (pop bindings) def (pop bindings))))
(put 'dotemacs-set-leader-keys 'lisp-indent-function 'defun)

(defalias 'evil-leader/set-key 'dotemacs-set-leader-keys)

(defun dotemacs//acceptable-leader-p (key)
  "Return t if key is a string and non-empty."
  (and (stringp key) (not (string= key ""))))

(defun dotemacs//init-leader-mode-map (mode map &optional minor)
  "Check for MAP-prefix. If it doesn't exist yet, use `bind-map'
to create it and bind it to `dotemacs-major-mode-leader-key'
and `dotemacs-major-mode-emacs-leader-key'. If MODE is a
minor-mode, the third argument should be non nil."
  (let* ((prefix (intern (format "%s-prefix" map)))
         (leader1 (when (dotemacs//acceptable-leader-p
                         dotemacs-major-mode-leader-key)
                    dotemacs-major-mode-leader-key))
         (leader2 (when (dotemacs//acceptable-leader-p
                         dotemacs-leader-key)
                    (concat dotemacs-leader-key
                            (unless minor " m"))))
         (emacs-leader1 (when (dotemacs//acceptable-leader-p
                               dotemacs-major-mode-emacs-leader-key)
                          dotemacs-major-mode-emacs-leader-key))
         (emacs-leader2 (when (dotemacs//acceptable-leader-p
                               dotemacs-emacs-leader-key)
                          (concat dotemacs-emacs-leader-key
                                  (unless minor " m"))))
         (leaders (delq nil (list leader1 leader2)))
         (emacs-leaders (delq nil (list emacs-leader1 emacs-leader2))))
    (or (boundp prefix)
        (progn
          (eval
           `(bind-map ,map
              :prefix-cmd ,prefix
              ,(if minor :minor-modes :major-modes) (,mode)
              :keys ,emacs-leaders
              :evil-keys ,leaders
              :evil-states (normal motion visual evilified)))
          (boundp prefix)))))

(defun dotemacs-set-leader-keys-for-major-mode (mode key def &rest bindings)
  "Add KEY and DEF as key bindings under
`dotemacs-major-mode-leader-key' and
`dotemacs-major-mode-emacs-leader-key' for the major-mode
MODE. MODE should be a quoted symbol corresponding to a valid
major mode. The rest of the arguments are treated exactly like
they are in `dotemacs-set-leader-keys'."
  (let* ((map (intern (format "dotemacs-%s-map" mode))))
    (when (dotemacs//init-leader-mode-map mode map)
      (while key
        (define-key (symbol-value map) (kbd key) def)
        (setq key (pop bindings) def (pop bindings))))))
(put 'dotemacs-set-leader-keys-for-major-mode 'lisp-indent-function 'defun)

(defalias
  'evil-leader/set-key-for-mode
  'dotemacs-set-leader-keys-for-major-mode)

(defun dotemacs-set-leader-keys-for-minor-mode (mode key def &rest bindings)
  "Add KEY and DEF as key bindings under
`dotemacs-major-mode-leader-key' and
`dotemacs-major-mode-emacs-leader-key' for the minor-mode
MODE. MODE should be a quoted symbol corresponding to a valid
minor mode. The rest of the arguments are treated exactly like
they are in `dotemacs-set-leader-keys'."
  (let* ((map (intern (format "dotemacs-%s-map" mode))))
    (when (dotemacs//init-leader-mode-map mode map t)
      (while key
        (define-key (symbol-value map) (kbd key) def)
        (setq key (pop bindings) def (pop bindings))))))
(put 'dotemacs-set-leader-keys-for-minor-mode 'lisp-indent-function 'defun)

(provide 'core-keybindings)
;;; core-keybindings.el ends here
