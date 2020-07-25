#!/usr/bin/sbcl --script

;;;; equality

;;; equality of symbols:

(defparameter *name* 'Derek)

(format t "(eq *name* 'Derek) = ~d ~%" (eq *name* 'Derek)) ; => (eq *name* 'Derek) = T


;;; equality of non-symbols (and symbols):

(format t "(equal 'car 'truck) = ~d ~%" (equal 'car 'truck)) ; => (equal 'car 'truck) = NIL

(format t "(equal 10 10) = ~d ~%" (equal 10 10)) ; => (equal 10 10) = T

(format t "(equal 5.5 5.3) = ~d ~%" (equal 5.5 5.3)) ; => (equal 5.5 5.3) = NIL

(format t "(equal 7 7.0) = ~d ~%" (equal 7 7.0)) ; => (equal 7 7.0) = NIL

(format t "(equal \"string\" \"String\") = ~d ~%" (equal "string" "String")) ; => (equal "string" "String") = NIL

(format t "(equal (list 1 2 3) (list 1 2 3)) = ~d ~%" (equal (list 1 2 3) (list 1 2 3))) ; => (equal (list 1 2 3) (list 1 2 3)) = NIL


;;; equality of strings of any case, & of integers to floats:

(format t "(equalp 7 7.0) = ~d ~%" (equalp 7 7.0)) ; => (equalp 7 7.0) = T

(format t "(equalp \"string\" \"String\") = ~d ~%" (equalp "string" "String")) ; => (equalp "string" "String") = T
