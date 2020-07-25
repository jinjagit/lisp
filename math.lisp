#!/usr/bin/sbcl --script

;;;; basic math stuff

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