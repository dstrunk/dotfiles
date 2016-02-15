(load-file "~/.emacs.d/sensible-defaults.el")
(sensible-defaults/use-all-settings)
(sensible-defaults/use-all-keybindings)

(defun dstrunk/configure-cask ()
  (require 'cask "~/.cask/cask.el")
  (cask-initialize)
  (require 'pallet))
