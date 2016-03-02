
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(setq user-full-name "Daniel Strunk"
      user-mail-address "me@dstrunk.com"
      calendar-latitude 32.46
      calendar-longitude -84.99
      calendar-location-name "Columbus, GA")

(load-file "~/.emacs.d/hrs/sensible-defaults.el/sensible-defaults.el")
(sensible-defaults/use-all-settings)
(sensible-defaults/use-all-keybindings)

(tool-bar-mode 0)
(menu-bar-mode 0)
(when window-system
  (scroll-bar-mode -1))

(projectile-global-mode)

(evil-mode 1)
(global-evil-surround-mode 1)

(projectile-global-mode)
(define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)

(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'elixir-mode-hook
             (defun auto-activate-ruby-end-mode-for-elixir-mode ()
               (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
                    "\\(?:^\\|\\s-+\\)\\(?:do\\)")
               (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers) nil)
               (ruby-end-mode +1)))

(setq alchemist-goto-erlang-source-dir "/usr/lib/elixir")
(setq alchemist-goto-elixir-source-dir "/usr/lib/erlang")
