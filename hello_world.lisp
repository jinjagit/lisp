#!/usr/bin/sbcl --script

;;;; some LISP basics
;;; note bash path in first line
;;  grant file permissions. e.g. chmod 0755 test.lisp 
; run as for bash file: ./test.lisp
#||
multiline comment
||#

 (format t "Hello World! ~%")

(format t "What's your name? ~%")

(defvar *name* (read))

(defun hello-you (*name*)
  (format t "Hello ~@a! ~%" *name*))

;;; ~a shows the value
;;; ~s shows quotes around the value
;;; ~10a adds 10 spaces to right of value
;;; ~10@a adds 10 spaces to left of value

(setq *print-case* :capitalize)

(hello-you *name*)