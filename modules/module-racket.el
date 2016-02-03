;;; Racket
(require 'module-global)

(defun dotemacs-racket-test-with-coverage ()
  "Call `racket-test' with universal argument."
  (interactive)
  (racket-test t))

(defun dotemacs-racket-run-and-switch-to-repl ()
  "Call `racket-run-and-switch-to-repl' and enable
`insert state'."
  (interactive)
  (racket-run-and-switch-to-repl)
  (evil-insert-state))

(defun dotemacs-racket-send-last-sexp-focus ()
  "Call `racket-send-last-sexp' and switch to REPL buffer in
`insert state'."
  (interactive)
  (racket-send-last-sexp)
  (racket-repl)
  (evil-insert-state))

(defun dotemacs-racket-send-definition-focus ()
  "Call `racket-send-definition' and switch to REPL buffer in
`insert state'."
  (interactive)
  (racket-send-definition)
  (racket-repl)
  (evil-insert-state))

(defun dotemacs-racket-send-region-focus (start end)
  "Call `racket-send-region' and switch to REPL buffer in
`insert state'."
  (interactive "r")
  (racket-send-region start end)
  (racket-repl)
  (evil-insert-state))


(when (eq dotemacs-completion-engine 'company)
  ;; this is the only thing to do to enable company in racket-mode
  ;; because racket-mode handle everything for us when company
  ;; is loaded.
  (dotemacs-use-package-add-hook company
    :post-init
    (progn
      (add-hook 'racket-mode-hook 'company-mode)))

  ;; Bug exists in Racket company backend that opens docs in new window when
  ;; company-quickhelp calls it. Note hook is appended for proper ordering.
  (dotemacs-use-package-add-hook company-quickhelp
    :post-init
    (progn
      (add-hook 'company-mode-hook
          '(lambda ()
             (when (equal major-mode 'racket-mode)
               (company-quickhelp-mode -1))) t))))

(use-package racket-mode
  :defer t
  :ensure t
  :config
  (progn
    (dotemacs-set-leader-keys-for-major-mode 'racket-mode
      ;; navigation
      "g`" 'racket-unvisit
      "gg" 'racket-visit-definition
      "gm" 'racket-visit-module
      "gr" 'racket-open-require-path
      ;; doc
      "hd" 'racket-describe
      "hh" 'racket-doc
      ;; insert
      "il" 'racket-insert-lambda
      ;; REPL
      "sb" 'racket-run
      "sB" 'dotemacs-racket-run-and-switch-to-repl
      "se" 'racket-send-last-sexp
      "sE" 'dotemacs-racket-send-last-sexp-focus
      "sf" 'racket-send-definition
      "sF" 'dotemacs-racket-send-definition-focus
      "si" 'racket-repl
      "sr" 'racket-send-region
      "sR" 'dotemacs-racket-send-region-focus
      "ss" 'racket-repl
      ;; Tests
      "tb" 'racket-test
      "tB" 'dotemacs-racket-test-with-coverage)
    (define-key racket-mode-map (kbd "H-r") 'racket-run)
    ;; remove racket auto-insert of closing delimiter
    ;; see https://github.com/greghendershott/racket-mode/issues/140
    (define-key racket-mode-map ")" 'self-insert-command)
    (define-key racket-mode-map "]" 'self-insert-command)
    (define-key racket-mode-map "}" 'self-insert-command)))

(dotemacs-use-package-add-hook flycheck
  :post-init
  (dotemacs/add-flycheck-hook 'racket-mode))

(provide 'module-racket)
;;; module-racket.el ends here