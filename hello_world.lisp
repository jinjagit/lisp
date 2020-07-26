#!/usr/bin/sbcl --script

;;;; Hello World, with user input.
;; note bash path in first line
;; grant file permissions. e.g. $ chmod 0755 hello_world.lisp 
;; run: $ ./hello_world.lisp
#||
multiline comment
||#

(format t "Hello World! ~%")

(format t "I am Lisp. ~%")

(format t "What's your name? ~%")

(defvar *name* (read))

(defun hello-you (*name*)
  (format t "Hello ~a! ~%" *name*))

;;; ~a shows the value
;;; ~s shows quotes around the value
;;; ~10a adds 10 spaces to right of value
;;; ~10@a adds 10 spaces to left of value

(setq *print-case* :capitalize)

(hello-you *name*)
