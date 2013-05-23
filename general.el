(message "general.el")

(desktop-save-mode 1)
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
(setq-default tab-width 4)

(setq-default ispell-program-name "aspell")

(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(message "end general.el")
