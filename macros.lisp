#!/usr/bin/sbcl --script

;;;; macros - (are compiled then are available just like functions):
;; used to generate code, rather than to necessarily perform actions


(setq *print-case* :capitalize)


(defvar *num-1* 2)
(defvar *num-2* 0)

;; consider following (non-macro) conditional:

(if (= *num-1* 2)
  (progn
    (setf *num-2* 2)
    (format t "*num-2* = ~d ~%" *num-2*)
  )
  (format t "Not equal to 2 ~%")) ; => *num-2* = 2

;; above, rewritten using a macro:

(defmacro ifis (condition &rest body)
  `(if, condition (progn ,@body) (format t "False"))) ; includes the else statement

(ifis (= *num-1* 2)
  (setf *num-2* 2)
  (format t "*num-2* = ~d ~%" *num-2*)) ; => *num-2* = 2


;; another example macro:

(defmacro ifit (condition &rest body)
  `(if, condition (progn ,@body) (format t "Can't drive ~%")))

(defvar *age* 16)

(ifit (>= *age* 16)
  (print "You are over 16")
  (print "You can drive")
  (terpri))


;; consider the following (non-macro) code, using let:

(defun add (num1 num2)
  (let ((sum (+ num1 num2)))
    (format t "~a + ~a = ~a ~%" num1 num2 sum)))

(add 9 7) ; => 9 + 7 = 16

;; above, rewritten using a macro:

(defmacro letx (var val &rest body)
  `(let ((,var ,val)) ,@body))

(defun add (num1 num2)
  (letx result (+ num1 num2)
    (format t "~a + ~a = ~a ~%" num1 num2 result)))

(add 9 7) ; => 9 + 7 = 16 