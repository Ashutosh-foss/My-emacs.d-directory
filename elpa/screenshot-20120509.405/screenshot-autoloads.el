;;; screenshot-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "screenshot" "screenshot.el" (22524 29225 562232
;;;;;;  411000))
;;; Generated autoloads from screenshot.el

(autoload 'screenshot "screenshot" "\
Prepare to take a screenshot to FILENAME with SCHEME.
After pressing C-c C-c, executing `screenshot-take'.
See also `screenshot-take' docstring. 

\(fn FILENAME &optional SCHEME NOMSG)" t nil)

(autoload 'screenshot-take "screenshot" "\
Take a screenshot configured by `screenshot' command.

- Taking a screenshot is delayed by `screenshot-take-delay'.
- Execute import command (ImageMagick).
- If the scheme has :ssh-dir property, use scp to send image to remote host.
  It is executed asynchronously to suppress a wait.
- Finally put the image URL or filename to kill-ring.
  Press C-y to input the image URL.
  If the scheme has :yaoddmuse, [[image:FileName]] is yanked.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; screenshot-autoloads.el ends here
