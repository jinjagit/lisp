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


;;; multiple return values:

(defun exponents (num)
  (values (expt num 2) (expt num 3)))

(multiple-value-bind (a b) (exponents 2)
  (format t "2^2 = ~d   2^3 = ~d ~%" a b))

; => 2^2 = 4   2^3 = 8


;; quasi-quoting allows switching from code to data mode:

(defparameter *hero-size*
  '((Superman (6ft 3in) (230lbs))
  (Flash (6ft 0in) (190lbs))
  (Batman (6ft 2in) (210lbs))))

(defun get-hero-data (size)
  (format t "~a ~%"
  `(,(caar size) is ,(cadar size) and ,(cddar size))))

(get-hero-data *hero-size*) ; => (Superman Is (6ft 3in) And ((230lbs)))


;;; run function against each item in list:

(format t "A number? ~a ~%" (mapcar #'numberp '(1 2 3 f g)))

; => A number? (T T T Nil Nil)


;;; define function only in local scope:

; (flet ((func-name (arguments)
;   (function body))
;   (body)))

(flet ((double-it (num)
  (* num 2))
  (triple-it (num)
  (* num 3)))
  (format t "double & triple 10 = ~a ~%" (triple-it(double-it 10))))

; => double & triple 10 = 60


;; using labels in local functions:

(labels ((double-it (num)
    (* num 2))
  (triple-it (num)
    (* (double-it num) 3)))
  (format t "double & triple 3 = ~a ~%" (triple-it 3)))

; => double & triple 3 = 18


;;; higher-order functions - (can use functions as if they are data):

(defun times-3 (x) (* 3 x))
(defun times-4 (x) (* 4 x))

(defun multiples (mult-func max-num)
  (dotimes (x max-num)
    (format t "~d : ~d ~%" x (funcall mult-func x))))

(multiples #'times-3 10) ; #' passes in the function
(terpri)
(multiples #'times-4 10)


;;; anonymous lambda functions:

(mapcar (lambda (x) (print (* x 2))) '(1 2 3 4 5))

(terpri)


#|| 
http://www.lispworks.com/documentation/HyperSpec/Body/f_mapc_.htm

mapcar operates on successive elements of the lists. function is applied to the first
element of each list, then to the second element of each list, and so on.
The iteration terminates when the shortest list runs out, and excess elements in other
lists are ignored. The value returned by mapcar is a list of the results of successive
calls to function.
||#