;;; funcs.el --- cats: Programming

;;; Commentary:

;; Personal functions

;;; Code:


;; funcs
(defun cats//locate-node-from-projectile (&optional dir)
  "Use local node from `./node_modules` if available."
  (when (empty-string-p dir)
    (setq dir default-directory))

  (let ((default-directory dir))
    (async-start
     `(lambda ()
        (executable-find "node"))
     (lambda (result)
       (when result
         (cats/set-executable-node result))))))

(defun cats//locate-jshint-from-projectile (&optional dir)
  "Use local jshint from `./node_modules` if available."
  (when (empty-string-p dir)
    (setq dir default-directory))

  (let ((default-directory dir))
    (async-start
     `(lambda ()
        (executable-find "jshint"))
     (lambda (result)
       (when result
         (cats/set-executable-jshint result))))))

(defun cats//locate-jscs-from-projectile (&optional dir)
  "Use local jscs from `./node_modules` if available."
  (when (empty-string-p dir)
    (setq dir default-directory))

  (let ((default-directory dir))
    (async-start
     `(lambda ()
        (executable-find "jscs"))
     (lambda (result)
       (when result
         (cats/set-executable-jscs result))))))

(defun cats//locate-eslint-from-projectile (&optional dir)
  "Use local eslint from `./node_modules` if available."
  (when (empty-string-p dir)
    (setq dir default-directory))

  (let ((default-directory dir))
    (async-start
     `(lambda ()
        (executable-find "eslint"))
     (lambda (result)
       (when result
         (cats/set-executable-eslint result))))))

(defun cats//locate-tsserver-from-projectile (&optional dir)
  "Use local tsserver from `./node_modules` if available."
  (when (empty-string-p dir)
    (setq dir default-directory))

  (let ((default-directory dir))
    (async-start
     `(lambda ()
        (executable-find "tsserver"))
     (lambda (result)
       (when result
         (cats/set-executable-tsserver result))))))


;; babel

(defun cats//locate-babel-node-from-projectile (&optional dir)
  "Use local babel-node from DIR."
  (when (empty-string-p dir)
    (setq dir default-directory))

  (let ((default-directory dir))
    (async-start
     `(lambda ()
        (executable-find "babel-node"))
     (lambda (result)
       (when result
         (cats/set-executable-babel-node result))))))

(defun cats//set-babel-node-executable (babel-node)
  "Set the `babel-repl-cli-program' setting in `babel-mode' with `BABEL-NODE'."
  (setq babel-repl-cli-program babel-node))

(defun babel-repl-check ()
  (unless (comint-check-proc "*babel-shell*")
    (with-selected-window (selected-window)
      (babel-repl))))

(defun babel-start-repl ()
  "Execute whole buffer in browser and switch to REPL in insert state."
  (interactive)
  (babel-repl-check)
  (babel-repl)
  (evil-insert-state))

(defun babel-send-region-or-buffer ()
  (interactive)
  (babel-repl-check)
  (let ((babel-repl-pop-to-buffer t))
    (babel-repl-send-region-or-buffer)
    (evil-insert-state)))

(defun babel-send-region ()
  (interactive)
  (babel-repl-check)
  (let ((babel-repl-pop-to-buffer t))
    (babel-repl-send-current-region)
    (evil-insert-state)))

(defun babel-send-buffer ()
  (interactive)
  (babel-repl-check)
  (let ((babel-repl-pop-to-buffer t))
    (babel-repl-send-buffer)
    (evil-insert-state)))

(defun babel-send-paragraph ()
  (interactive)
  (babel-repl-check)
  (let ((babel-repl-pop-to-buffer t))
    (babel-repl-send-paragraph)
    (evil-insert-state)))

(defun babel-send-dwim ()
  (interactive)
  (babel-repl-check)
  (let ((babel-repl-pop-to-buffer t))
    (babel-repl-send-dwim)
    (evil-insert-state)))


;; eslint
(defun cats//esilnt-set-eslint-executable (eslint)
  "Set the `flycheck-javascript-eslint-executable' setting in `flycheck-mode' with `ESLINT'."
  (setq flycheck-javascript-eslint-executable eslint))


;; coffee

(defun cats//locate-coffeelint-from-projectile (&optional dir)
  "Use local coffeelint from DIR."
  (when (empty-string-p dir)
    (setq dir default-directory))

  (let ((default-directory dir))
    (async-start
     `(lambda ()
        (executable-find "coffeelint"))
     (lambda (result)
       (when result
         (cats/set-executable-coffeelint result))))))

(defun cats//set-coffeelint-executable (coffeelint)
  "Set the `babel-repl-cli-program' setting in `coffee-mode' with `COFFEELINT'."
  (setq flycheck-coffee-coffeelint-executable coffeelint))


;; js2

(defun cats/add-builtin-externs()
  (interactive)
  (dolist (s '("Array" "ArrayBuffer" "Boolean" "constructor"
               "DataView" "Date" "decodeURI" "decodeURIComponent"
               "encodeURI" "encodeURIComponent" "Error"
               "escape" "eval" "EvalError" "Float32Array"
               "Float64Array" "Function" "hasOwnProperty" "Infinity"
               "Int16Array" "Int32Array" "Int8Array" "isFinite"
               "isNaN" "isPrototypeOf" "JSON" "Map" "Math"
               "NaN" "Number" "Object" "parseFloat" "parseInt"
               "Promise" "propertyIsEnumerable" "Proxy" "RangeError"
               "ReferenceError" "Reflect" "RegExp" "Set" "String"
               "Symbol" "SyntaxError" "System" "toLocaleString"
               "toString" "TypeError" "Uint16Array" "Uint32Array"
               "Uint8Array" "Uint8ClampedArray" "undefined" "unescape"
               "URIError" "valueOf" "WeakMap" "WeakSet"))
    (add-to-list 'js2-additional-externs s)))

(defun cats/add-es5-externs()
  (interactive)
  (dolist (s '("Array" "Boolean" "constructor" "Date" "decodeURI"
               "decodeURIComponent" "encodeURI" "encodeURIComponent"
               "Error" "escape" "eval" "EvalError" "Function"
               "hasOwnProperty" "Infinity" "isFinite" "isNaN"
               "isPrototypeOf" "JSON" "Math" "NaN" "Number" "Object"
               "parseFloat" "parseInt" "propertyIsEnumerable"
               "RangeError" "ReferenceError" "RegExp" "String"
               "SyntaxError" "toLocaleString" "toString" "TypeError"
               "undefined" "unescape" "URIError" "valueOf"))
    (add-to-list 'js2-additional-externs s)))

(defun cats/add-es6-externs()
  (interactive)
  (dolist (s '("Array" "ArrayBuffer" "Boolean" "constructor"
               "DataView" "Date" "decodeURI" "decodeURIComponent"
               "encodeURI" "encodeURIComponent" "Error" "escape"
               "eval" "EvalError" "Float32Array" "Float64Array"
               "Function" "hasOwnProperty" "Infinity" "Int16Array"
               "Int32Array" "Int8Array" "isFinite" "isNaN" "isPrototypeOf"
               "JSON" "Map" "Math" "NaN" "Number" "Object" "parseFloat"
               "parseInt" "Promise" "propertyIsEnumerable" "Proxy"
               "RangeError" "ReferenceError" "Reflect" "RegExp"
               "Set" "String" "Symbol" "SyntaxError" "System"
               "toLocaleString" "toString" "TypeError" "Uint16Array"
               "Uint32Array" "Uint8Array" "Uint8ClampedArray"
               "undefined" "unescape" "URIError" "valueOf"
               "WeakMap" "WeakSet"))
    (add-to-list 'js2-additional-externs s)))

(defun cats/add-node-externs()
  (interactive)
  (dolist (s '("__dirname" "__filename" "arguments" "Buffer"
               "clearImmediate" "clearInterval" "clearTimeout"
               "console" "exports" "GLOBAL" "global" "module"
               "process" "require" "root" "setImmediate"
               "setInterval" "setTimeout"))
    (add-to-list 'js2-additional-externs s)))

(defun cats/add-commonjs-externs()
  (interactive)
  (dolist (s '("exports" "module" "require" "global"))
    (add-to-list 'js2-additional-externs s)))

(defun cats/add-amd-externs()
  (interactive)
  (dolist (s '("define" "require"))
    (add-to-list 'js2-additional-externs s)))

(defun cats/add-mocha-externs()
  (interactive)
  (dolist (s '("after" "afterEach" "before" "beforeEach" "context"
               "describe" "it" "mocha" "setup" "specify" "suite"
               "suiteSetup" "suiteTeardown" "teardown" "test" "xcontext"
               "xdescribe" "xit" "xspecify"))
    (add-to-list 'js2-additional-externs s)))

(defun cats/add-chai-externs()
  (interactive)
  (dolist (s '("assert" "expect"))
    (add-to-list 'js2-additional-externs s)))

(defun cats/add-phantomjs-externs()
  (interactive)
  (dolist (s '("console" "exports" "phantom" "require" "WebPage"))
    (add-to-list 'js2-additional-externs s)))

(defun cats/add-jquery-externs()
  (interactive)
  (dolist (s '("$" "jQuery"))
    (add-to-list 'js2-additional-externs s)))

(defun cats/add-shelljs-externs()
  (interactive)
  (dolist (s '("cat" "cd" "chmod" "config" "cp" "dirs" "echo"
               "env" "error" "exec" "exit" "find" "grep" "ls"
               "ln" "mkdir" "mv" "popd" "pushd" "pwd" "rm"
               "sed" "target" "tempdir" "test" "which"))
    (add-to-list 'js2-additional-externs s)))

(defun cats/add-embertest-externs()
  (interactive)
  (dolist (s '("andThen" "click" "currentPath" "currentRouteName"
               "currentURL" "fillIn" "find" "findWithAssert"
               "keyEvent" "pauseTest" "triggerEvent" "visit"))
    (add-to-list 'js2-additional-externs s)))

(defun cats/add-jasmine-externs()
  (interactive)
  (when (string-match "_spec.js" (buffer-file-name))
    (dolist (s '("afterAll" "afterEach" "beforeAll" "beforeEach"
                 "describe" "expect" "fail" "fdescribe" "fit"
                 "it" "jasmine" "pending" "runs" "spyOn" "waits"
                 "waitsFor" "xdescribe" "xit"))
      (add-to-list 'js2-additional-externs s))))

(defun cats/disable-js2-checks-if-flycheck-active ()
  (unless (flycheck-get-checker-for-buffer)
    (set (make-local-variable 'js2-mode-show-parse-errors) t)
    (set (make-local-variable 'js2-mode-show-strict-warnings) t)
    (when js2-highlight-unused-variables-mode
      (remove-hook 'js2-post-parse-callbacks
                   #'js2-highlight-unused-variables t))))


;; js2-menu-extras
(defun js2-imenu-make-index ()
  (save-excursion
    (imenu--generic-function
     '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
       ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
       ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
       ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
       ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)))))


;; mocha
(defun cats//locate-mocha-from-projectile (&optional dir)
  "Use local mocha from `./node_modules` if available."
  (when (empty-string-p dir)
    (setq dir default-directory))

  (let ((default-directory dir))
    (async-start
     `(lambda ()
        (executable-find "mocha"))
     (lambda (result)
       (when result
         (cats/set-executable-mocha result))))))

(defun cats//set-mocha-executable (mocha)
  "Set the `mocha-command' setting in `mocha-mode' with `MOCHA'."
  (setq mocha-command mocha))

(defun cats//mocha-set-node-executable (node)
  "Set the `mocha-which-node' setting in `mocha-mode' with `NODE'."
  (setq mocha-which-node node))


;; nodejs-repl
(defun cats//nodejs-set-node-executable (node)
  "Set the `nodejs-repl-command' setting in `nodejs-repl-mode' with `NODE'."
  (setq nodejs-repl-command node))

(defun nodejs-start-repl ()
  "Attach a browser to Emacs and start a skewer REPL."
  (interactive)
  (nodejs-repl--get-or-create-process)
  (nodejs-repl-switch-to-repl)
  (evil-insert-state))

(defun nodejs-load-file ()
  "Attach a browser to Emacs and start a skewer REPL."
  (interactive)
  (let ((file (expand-file-name (buffer-file-name))))
    (nodejs-repl-load-file file)
    (nodejs-repl-switch-to-repl)
    (evil-insert-state)))

(defun nodejs-send-line ()
  "Attach a browser to Emacs and start a skewer REPL."
  (interactive)
  (nodejs-repl-send-line)
  (nodejs-repl-switch-to-repl)
  (evil-insert-state))

(defun nodejs-send-region (start end)
  "Attach a browser to Emacs and start a skewer REPL."
  (interactive "r")
  (nodejs-repl-send-region start end)
  (nodejs-repl-switch-to-repl)
  (evil-insert-state))

(defun nodejs-send-buffer ()
  "Attach a browser to Emacs and start a skewer REPL."
  (interactive)
  (nodejs-repl-send-buffer)
  (nodejs-repl-switch-to-repl)
  (evil-insert-state))


;; tide
(defun cats//tide-set-node-executable (node)
  "Set the `tide-node-executable' setting in `tide-mode' with `NODE'."
  (setq tide-node-executable node))

(defun cats//tide-set-tsserver-executable (tsserver)
  "Set the `tide-tsserver-executable' setting in `tide-mode' with `TSSERVER'."
  (setq tide-tsserver-executable tsserver))

(defun setup-tide-mode ()
  (tide-setup)
  (spacemacs/toggle-tide-mode-on)
  (spacemacs/toggle-tide-hl-identifier-mode-on))

(defun tide-flycheck-setup ()
  (with-eval-after-load 'flycheck
    (cats//flycheck-add-next-checker 'javascript-eslint 'jsx-tide)
    (cats//flycheck-add-next-checker 'javascript-eslint 'javascript-tide)))

(defun tide-flycheck-teardown ()
  (cats//flycheck-remove-next-checker 'javascript-eslint 'javascript-tide)
  (cats//flycheck-remove-next-checker 'javascript-eslint 'jsx-tide))


;; skewer mode
(defun cats//locate-phantomjs-from-projectile (&optional dir)
  "Use local phantomjs from `DIR'."
  (when (empty-string-p dir)
    (setq dir default-directory))

  (let ((default-directory dir))
    (async-start
     `(lambda ()
        (executable-find "phantomjs"))
     (lambda (result)
       (when result
         (cats/set-executable-phantomjs result))))))

(defun cats//skewer-set-phantomjs-executable (phantomjs)
  "Set the `phantomjs-program-name' setting in `skewer-mode' with `PHANTOMJS'."
  (setq phantomjs-program-name phantomjs))


;; xref-js2
(defun xref-resume-last-search ()
  "Open last xref-js2 buffer."
  (interactive)
  (cond ((get-buffer "*xref*")
         (switch-to-buffer-other-window "*xref*"))
        (t
         (message "No previous search buffer found"))))


;; rjsx
(defun cats//js-jsx-indent-line-align-closing-bracket ()
  "Workaround `sgml-mode` and align closing bracket with opening bracket.
Inspired by http://blog.binchen.org/posts/indent-jsx-in-emacs.html."
  (save-excursion
    (beginning-of-line)
    (when (looking-at-p "^ +\/?> *$")
      (delete-char sgml-basic-offset))))

(defun cats//rjsx-delete-creates-full-tag-with-insert (args)
  (interactive "p")
  (rjsx-delete-creates-full-tag args)
  (evil-insert args))

(defun cats//setup-emmet-mode-for-react ()
  (emmet-mode 0)
  (setq-local emmet-expand-jsx-className? t))


;; javascript mode defaults
(defun cats/javascript-mode-defaults ()
  "Default javascript hook."
  (spacemacs/toggle-rainbow-identifier-off))

(add-hook 'cats/javascript-mode-hook 'cats/javascript-mode-defaults)


;; indium
(defun cats/indium-start-repl ()
  "Attach a browser to Emacs and start a indium REPL."
  (interactive)
  (let ((cb (current-buffer))   ;; save current-buffer
        (origin-buffer-file-name (buffer-file-name)))

    (unless (indium-repl-get-buffer)
      (call-interactively 'indium-run-node)
      ;; (switch-to-buffer cb)
      ;; (switch-to-buffer-other-window "*JS REPL*")
      (pop-to-buffer cb t)
      (spacemacs/toggle-indium-interaction-mode-on))

    ;; (indium-switch-to-repl-buffer)
    (if-let ((buf (indium-repl-get-buffer)))
        (progn
          (setq indium-repl-switch-from-buffer cb)
          (pop-to-buffer buf t)))))

(defun cats/indium-eval-buffer-and-focus ()
  "Execute whole buffer in browser and switch to REPL in insert state."
  (interactive)
  (indium-eval-buffer)
  (indium-switch-to-repl-buffer)
  (evil-insert-state))

(defun cats/indium-eval-defun-and-focus ()
  "Execute function at point in browser and switch to REPL in insert state."
  (interactive)
  (indium-eval-defun)
  (indium-switch-to-repl-buffer)
  (evil-insert-state))

(defun cats/indium-eval-region (beg end)
  "Execute the region as JavaScript code in the attached browser."
  (interactive "r")
  (indium-eval (buffer-substring-no-properties beg end)))

(defun cats/indium-eval-region-and-focus (beg end)
  "Execute the region in browser and swith to REPL in insert state."
  (interactive "r")
  (cats/indium-eval-region beg end)
  (indium-switch-to-repl-buffer)
  (evil-insert-state))


;;; funcs.el ends here
