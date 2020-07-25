#!/usr/bin/sbcl --script

;;;; conditionals


(defvar *age* 20)

(if (= *age* 18)
  (format t "You are 18. ~%") ; then
  (format t "You are NOT 18. ~%")) ; else
; => You are NOT 18

(if (>= *age* 18)
  (format t "You are an adult. ~%")
  (format t "You are NOT an adult. ~%"))
; => You are an adult.

(if (and (>= *age* 18) (<= *age* 70))
  (format t "You are of working age. ~%")
  (format t "Work is optional!. ~%"))
; => You are of working age.

(if (or (<= *age* 18) (>= *age* 70))
  (format t "Work is optional!. ~%")
  (format t "You are of working age. ~%"))
; => You are of working age.


;; 'progn' evaluates forms, in the order in which they are given.
;; The values of each form but the last are discarded. 
;; In the case below, variables are set to new values, so the discarding
;; mentioned above is not a limiting factor.

(defvar *num-1* 2)
(defvar *num-2* 2)
(defvar *num-3* 2)

(if (= *num-1* 2)
  (progn
    (setf *num-2* (* *num-2* 2))
    (setf *num-3* (* *num-3* 3))
  )
  (format t "Not equal to 2 ~%"))

(format t "*num-2* = ~d ~%" *num-2*) ; => *num-2* = 4 
(format t "*num-3* = ~d ~%" *num-3*) ; => *num-3* = 9 


;;; case statment:

(setq *age* 5) ; note: cannot use defvar, as age already bound to value. could use setf

(defun get-school (age)
  (case age
    (5 (print "Kindergaten"))
    (6 (print "First Grade"))
    (otherwise (print "Middle School"))))

(get-school *age*) ; => "Kindergarten" (note that 'print' inserts leading newline)

(terpri) ; prints newline after output


;;; when statement:

(setf *age* 18)

(when (= *age* 18)
  (setf *num-3* 18)
  (format t "Go to college, you're ~d ~%" *num-3*))

(unless (not (= *age* 18))
  (setf *num-3* 18)
  (format t "Go to college, you're ~d ~%" *num-3*))


;; cond statement:

(defvar *college-ready* nil)

(cond ( (>= *age* 21) ;if
            (setf *college-ready* 'yes)
            (format t "Ready for college ~%"))
      ( (< *age* 18) ; else if
            (setf *college-ready* 'no)
            (format t "NOT ready for college ~%"))
      (t (setf *college-ready* 'maybe)
         (format t "Maybe ready for college ~%"))) ; else