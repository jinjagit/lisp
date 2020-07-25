#!/usr/bin/sbcl --script

;;;; loops

(loop for x from 1 to 10 do
  (print x))

(terpri) ; print newline
(terpri) ; print newline


(defvar i 1)

(loop
  (format t "~d ~%" i)
  (setq i (+ i 1))
  (when (> i 10) (return i))) ; when 10 > i

(terpri) ; print newline


(loop for j in '(Peter Paul Mary) do
  (format t "~d ~%" j))

(terpri) ; print newline


(loop for i from 100 to 110 do
  (print i))

(terpri) ; print newline
(terpri) ; print newline


(dotimes (i 10) ; starts at i = 0
  (print i))

(terpri) ; print newline
(terpri) ; print newline


