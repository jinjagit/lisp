#!/usr/bin/sbcl --script

;;;; basic math stuff

;;; NIL == () an empty list, the symbol NIL, & boolean false. (& the concept often known as 'null')

(format t "(+ 5 4) = ~d ~%" (+ 5 4)) ; => (+ 5 4) = 9

(format t "(- 5 4) = ~d ~%" (- 5 4)) ; => (- 5 4) = 1

(format t "(* 5 4) = ~d ~%" (* 5 4)) ; => (* 5 4) = 20

(format t "(/ 5 4) = ~d ~%" (/ 5 4)) ; => (/ 5 4) = 5/4

(format t "(/ 5 4.0) = ~d ~%" (/ 5 4.0)) ; => (/ 5 4) = 1.25

(format t "(rem 5 4) = ~d ~%" (rem 5 4)) ; => (rem 5 4) = 1

(format t "(mod 5 4) = ~d ~%" (mod 5 4)) ; => (mod 5 4) = 1

(format t "(expt 4 2) = ~d ~%" (expt 4 2)) ; => (expt 4 2) = 16

(format t "(sqrt 81) = ~d ~%" (sqrt 81)) ; => (sqrt 81) = 9.0

(format t "(exp 1) = ~d ~%" (exp 1)) ; => (exp 1) = 2.7182817 

(format t "(log 1000 10) = ~d ~%" (log 1000 10)) ; => (log 1000 10) = 3   (Because 10^3 = 1000)

(format t "(eq 'dog 'dog) = ~d ~%" (eq 'dog 'dog)) ; => (eq 'dog 'dog) = T

(format t "(eq 'dog 'cat) = ~d ~%" (eq 'dog 'cat)) ; => (eq 'dog 'cat) = NIL

(format t "(floor 5.5) = ~d ~%" (floor 5.5)) ; => (floor 5.5) = 5

(format t "(ceiling 5.5) = ~d ~%" (ceiling 5.5)) ; => (ceiling 5.5) = 6

(format t "(max 5 10) = ~d ~%" (max 5 10)) ; => (max 5 10) = 10

(format t "(min 5 10) = ~d ~%" (min 5 10)) ; => (min 5 10) = 5

(format t "(oddp 15) = ~d ~%" (oddp 15)) ; => (oddp 15) = T

(format t "(evenp 15) = ~d ~%" (evenp 15)) ; => (evenp 15) = NIL

(format t "(numberp 2) = ~d ~%" (numberp 2)) ; => (numberp 2) = T

;; null returns t if object is the empty list; otherwise, returns nil.

(format t "(null nil) = ~d ~%" (null nil)) ; => (null nil) = T

(format t "(null 2) = ~d ~%" (null 2)) ; => (null 2) = NIL

