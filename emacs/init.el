
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defun auto-cask/find-homebrew-cask-el ()
 (let ((prefix "/usr/local/Cellar/cask"))
  (when (file-exists-p prefix)
   ; This will break if cask changes version numbering
   (let ((files (directory-files prefix nil "[0-9]+\\.[0-9]+\\.[0-9]+")))
    (unless (null files)
     (let ((filename (format "%s/%s/%s" prefix (car files) "cask.el")))
      (when (file-exists-p filename)
       filename)))))))

(defun auto-cask/find-cask-el ()
  (let ((homebrew-cask-el (auto-cask/find-homebrew-cask-el))
        (homedir-cask-el "~/.cask/cask.el"))
    (or homebrew-cask-el homedir-cask-el)))

(defun auto-cask/setup (base-dir)
  (let ((cask-el (auto-cask/find-cask-el)))
    (when cask-el
      (progn
        (require 'cask cask-el)
        (cask-initialize base-dir)))))

(provide 'auto-cask)

(org-babel-load-file "~/.emacs.d/configuration.org")
