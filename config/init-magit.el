;; TODO to be deleted
(setq magit-last-seen-setup-instructions "1.4.0")

(require 'magit)
  (with-eval-after-load 'magit

    (defun my-magit-mode-defaults ()
      ; (if (boundp 'yas-minor-mode)
      ;     (yas-minor-mode))
      ; (run-hooks 'my-prog-mode-hook)
      (message "my-magit-mode-defaults"))
    (setq my-magit-mode-hook 'my-magit-mode-defaults)
    (add-hook 'magit-mode-hook (lambda ()
                               (run-hooks 'my-magit-mode-hook)))

    (setq magit-diff-options '("--histogram"))
    (setq magit-stage-all-confirm nil)
    (setq magit-unstage-all-confirm nil)
    (setq magit-status-buffer-switch-function 'switch-to-buffer)
    (setq magit-show-child-count t)

    ;; Subtler highlight
    (set-face-background 'magit-item-highlight "#121212")
    (set-face-background 'diff-file-header "#121212")
    (set-face-foreground 'diff-context "#666666")
    (set-face-foreground 'diff-added "#00cc33")
    (set-face-foreground 'diff-removed "#ff0000"))

;; Load git configurations
;; For instance, to run magit-svn-mode in a project, do:
;;
;;     git config --add magit.extension svn
;;
(add-hook 'magit-mode-hook 'magit-load-config-extensions)

(defun magit-save-and-exit-commit-mode ()
  (interactive)
  (save-buffer)
  (server-edit)
  (delete-window))

(defun magit-exit-commit-mode ()
  (interactive)
  (kill-buffer)
  (delete-window))

; (eval-after-load "git-commit-mode"
;   '(define-key git-commit-mode-map (kbd "C-c C-k") 'magit-exit-commit-mode))

;; C-c C-a to amend without any prompt

(defun magit-just-amend ()
  (interactive)
  (save-window-excursion
    (magit-with-refresh
      (shell-command "git --no-pager commit --amend --reuse-message=HEAD"))))

; (eval-after-load 'magit
;   '(define-key magit-status-mode-map (kbd "C-c C-a") 'magit-just-amend))

;; C-x C-k to kill file on line

(defun magit-kill-file-on-line ()
  "Show file on current magit line and prompt for deletion."
  (interactive)
  (magit-visit-item)
  (delete-current-buffer-file)
  (magit-refresh))

; (define-key magit-status-mode-map (kbd "C-x C-k") 'magit-kill-file-on-line)

;; full screen magit-status

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

;; full screen vc-annotate

(defun vc-annotate-quit ()
  "Restores the previous window configuration and kills the vc-annotate buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :vc-annotate-fullscreen))

(eval-after-load "vc-annotate"
  '(progn
     (defadvice vc-annotate (around fullscreen activate)
       (window-configuration-to-register :vc-annotate-fullscreen)
       ad-do-it
       (delete-other-windows))

     ; (define-key vc-annotate-mode-map (kbd "q") 'vc-annotate-quit)
  ))

;; ignore whitespace

(defun magit-toggle-whitespace ()
  (interactive)
  (if (member "-w" magit-diff-options)
      (magit-dont-ignore-whitespace)
    (magit-ignore-whitespace)))

(defun magit-ignore-whitespace ()
  (interactive)
  (add-to-list 'magit-diff-options "-w")
  (magit-refresh))

(defun magit-dont-ignore-whitespace ()
  (interactive)
  (setq magit-diff-options (remove "-w" magit-diff-options))
  (magit-refresh))

; (define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace)

;; Show blame for current line

(require 'git-messenger)
; (global-set-key (kbd "C-x v p") #'git-messenger:popup-message)

(provide 'init-magit)
