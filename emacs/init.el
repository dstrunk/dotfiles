
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load-file "~/.emacs.d/sensible-defaults.el")
(sensible-defaults/use-all-settings)
(sensible-defaults/use-all-keybindings)

(defun dstrunk/configure-cask ()
  (require 'cask "~/.cask/cask.el")
  (cask-initialize)
  (require 'pallet)
  (pallet-mode t))
