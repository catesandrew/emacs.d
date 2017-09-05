;;; module-ranger.el --- Ranger Module
;;
;; This file is NOT part of GNU Emacs.
;;
;;; License:
;;
;;; Commentary:
;;
(require 'use-package)
(require 'core-vars)
(require 'core-funcs)
(require 'core-keybindings)
(require 'core-display-init)
(require 'core-use-package-ext)
(require 'module-vars)
(require 'module-common)
;; (require 'module-core)
;; (require 'module-utils)

;;; Code:

(use-package ranger
  :defer t
  :ensure t
  :init
  (progn
    (dotemacs-set-leader-keys
      "ar" 'ranger
      "ad" 'deer)

    ;; set up image-dired to allow picture resize
    (setq image-dired-dir (concat dotemacs-cache-directory "image-dir"))
    (unless (file-directory-p image-dired-dir)
      (make-directory image-dired-dir))

    (setq ranger-show-literal nil
          ranger-preview-file t
          ranger-width-parents 0.15
          ranger-width-preview 0.65
          ranger-show-preview t
          ranger-parent-depth 1
          ranger-max-preview-size 10))
  :config
  (define-key ranger-mode-map (kbd "-") 'ranger-up-directory))

(dotemacs-use-package-add-hook evil-snipe
  :post-init
  (when evil-snipe-enable-alternate-f-and-t-behaviors
      (add-hook 'ranger-mode-hook 'turn-off-evil-snipe-override-mode)
    ;; (add-hook 'ranger-mode-hook 'turn-off-evil-snipe-mode)
    ))


(provide 'module-ranger)
;;; module-ranger.el ends here
