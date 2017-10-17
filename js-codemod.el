;;; js-codemod.el --- Run js-codemod on current line or selected region -*- lexical-binding: t -*-

;; Copyright (C) 2017 @torgeir

;; Author: Torgeir Thoresen <@torgeir>
;; Version: 1.0.0
;; Keywords: js codemod region
;; Package-Requires: ((emacs "24.4"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Runs js-codemod on current line or selected region.

;;; Code:

(defvar js-codemod--err-file
  "js-codemod-error.log"
  "Log file to write js-codemod error output to.")

(defun js-codemod--select-line-region ()
  "Create region for the current line."
  (set-mark (line-beginning-position))
  (end-of-line)
  (exchange-point-and-mark))

;;;###autoload
(defun js-codemod-mod-region (mod)
  "Run js-codemod `MOD' on currentline or selected region."
  (interactive "fCodemode file: ")
  (save-excursion
    (when (not (region-active-p))
      (js-codemod--select-line-region))
    (let* ((current-folder (file-name-directory (locate-file "js-codemod.el" load-path)))
           (delete t)
           (redisplay nil)
           (r-begin (region-beginning))
           (r-end (region-end))
           (selection (buffer-substring r-begin r-end))
           (exit (call-process-region r-begin
                                      r-end
                                      (concat current-folder "replace")
                                      delete
                                      `(t                     ; insert stdin at point
                                        ,js-codemod--err-file ; write stderr to file
                                        )
                                      redisplay
                                      mod)))
      (cond ((zerop exit) (message "Codemod %s...done" mod))
            (t (progn
                 (message "Codemod failed: %s"
                          (with-temp-buffer
                            (insert-file-contents js-codemod--err-file)
                            (buffer-string)))
                 (insert selection))))
      (delete-file js-codemod--err-file))))

(provide 'js-codemod)

;;; js-codemod.el ends here
