#!/usr/bin/sbcl --script

;;;; data structures:


(setq *print-case* :capitalize)


;;; arrays:

(defparameter names (make-array 3))

(setf (aref names 1) 'Bob)

(format t "~a ~%" (aref names 1)) ; => Bob


;; multi-dimensional arrays:

(defparameter num-array (make-array '(3 3)
  :initial-contents '((0 1 2) (3 4 5) (6 7 8))))

(dotimes (x 3)
  (dotimes (y 3)
    (print (aref num-array x y))))

(terpri)


;;; hash tables

(defparameter people (make-hash-table))

(setf (gethash '102 people) '(Paul Smith))
(setf (gethash '103 people) '(Sam Smith))

(format t "~a ~%" (gethash '103 people)) ; => (Sam Smith)

(maphash #'(lambda (k v) (format t "~a = ~a ~%" k v)) people)

; => 102 = (Paul Smith) 
;    103 = (Sam Smith)

(remhash '103 people) ; delete a key-value pair by key

(maphash #'(lambda (k v) (format t "~a = ~a ~%" k v)) people)

; => 102 = (Paul Smith)


;;; structs - a user-defined data type

(defstruct customer name address id)

(defparameter paulsmith (make-customer
  :name "Paul Smith"
  :address "123 Main St."
  :id 1000))

(format t "~a ~%" (customer-name paulsmith)) ; => Paul Smith

(setf (customer-address paulsmith) "67 High St.")

(write paulsmith)

; => #S(Customer :Name "Paul Smith" :Address "67 High St." :Id 1000)

(terpri)
