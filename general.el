(message "general.el")

(desktop-save-mode 1)
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
(setq-default tab-width 4)
(setq js-indent-level 4)

(setq-default ispell-program-name "aspell")

(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (setq c-default-style "bsd")
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; jslint

(when (load "flymake" t)
  (defun flymake-jslint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "jslint" (list "--terse" local-file))))
  
  (setq flymake-err-line-patterns
        (cons '("^\\(.*\\)(\\([[:digit:]]+\\)):\\(.*\\)$"
                1 2 nil 3)
              flymake-err-line-patterns))
  
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.js\\'" flymake-jslint-init))
  
  (require 'flymake-cursor))

(add-hook 'js2-mode-hook
	  (lambda ()
      (flymake-mode 1)
      (define-key js2-mode-map "\C-c\C-n" 'flymake-goto-next-error)))

(message "end general.el")
