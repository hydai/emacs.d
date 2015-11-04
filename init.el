; Binding left option to meta key
(set-keyboard-coding-system nil)

; Setting for melpa and org
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

; Line number
(global-linum-mode 1)
(setq linum-format "%4d ")

(require 'calfw)
(require 'calfw-org)

(require 'calfw-ical)

(defun open-my-ical ()
  (interactive)
  (cfw:open-ical-calendar "https://www.google.com/calendar/ical/z54981220%40gmail.com/public/basic.ics"))


; Haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(require 'hi2)
(add-hook 'haskell-mode-hook 'turn-on-hi2)
(add-hook 'haskell-mode-hook #'hindent-mode)

; Theme
(load-theme 'monokai t)

; smtp setting for gnus
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.googlemail.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; magit setting
(global-set-key (kbd "C-x g") 'magit-status)

; Calendar
(add-to-list 'org-modules 'org-mac-iCal)
(setq org-agenda-include-diary t)


(setq org-agenda-custom-commands
      '(("I" "Import diary from iCal" agenda ""
         ((org-agenda-mode-hook
           (lambda ()
             (org-mac-iCal)))))))
