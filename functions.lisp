#!/usr/bin/sbcl --script

;;;; functions


(setq *print-case* :capitalize)


(defun hello()
  (print "Hello")
  (terpri))

(hello) ; => "Hello"


(defun get-avg (num-1 num-2)
  (/ (+ num-1 num-2) 2))

(format t "Avg 10 & 50 = ~a ~%" (get-avg 10 50)) ; => Avg 10 & 50 = 30


;;; optional parameters

(defun print-list (w x &optional y z)
  (format t "List = ~a ~%" (list w x y z)))

(print-list 1 2 3) ; => List = (1 2 3 Nil) 


;;; receiving multiple values

(defvar *total* 0)

(defun sum (&rest nums) ; &rest creates a list
  (setf *total* 0)
  (dolist (num nums)
    (setf *total* (+ *total* num)))
  (format t "Sum = ~a ~%" *total*))

(sum 1 2 3 4 5 6 7) ; => Sum = 28 


;;; keyword parameters

(defun print-list (&optional &key x y z)
  (format t "List: ~a ~%" (list x y z)))

(print-list :x 1 :y 2) ; => List: (1 2 Nil)


;;; specific return value

(defun difference (num-1 num-2)
  (return-from difference(- num-1 num-2)))

(format t "10 - 2 = ~a ~%" (difference 10 2)) ; => 10 - 2 = 8


(defun sum (&rest nums)
  (setf *total* 0)
  (dolist (num nums)
    (setf *total* (+ *total* num)))
  (return-from sum *total*))

(format t "Sum = ~a ~%" (sum 1 2 3 4 5 6 7)) ; => Sum = 28


;; quasi-quoting allows switching from code to data mode:

(defparameter *hero-size*
  '((Superman (6ft 3in) (230lbs))
  (Flash (6ft 0in) (190lbs))
  (Batman (6ft 2in) (210lbs))))

(defun get-hero-data (size)
  (format t "~a ~%"
  `(,(caar size) is ,(cadar size) and ,(cddar size))))

(get-hero-data *hero-size*) ; => (Superman Is (6ft 3in) And ((230lbs)))