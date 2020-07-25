#!/usr/bin/sbcl --script

;;;; lists


;;; some examples of lists:

(cons 'superman 'batman) ; cons = consecutive

(list 'superman 'batman 'flash)

(cons 'aquaman '(superman batman))


;;; examples of operations on / with lists:

;; note: car / cdr remind me of [head | tail] in Elixir

(format t "First = ~a ~%" (car '(superman batman aquaman))) ; car gives first item

(format t "Everything else = ~a ~%" (cdr '(superman batman aquaman))) ; cdr gives all items, except first

(format t "2nd item = ~a ~%" (cadr '(superman batman aquaman)))

(format t "4th item = ~a ~%" (cadddr '(one two three four five))) ; maximum number of 'a' + 'd' allowed


;; check a list is a list:

(format t "Is this a list? = ~a ~%" (listp '(superman batman aquaman)))


;; check item is in a list:

(format t "Is 3 in this list? = ~a ~%" (if (member 3 '(2 4 6)) 't nil)) ; 't provides a situation in which the condition would not be true


;; append, push

(defvar *phrase* (append '(just) '(some) '(pointless words)))

(format t "~a ~%" *phrase*)



(defparameter *nums* '(2 4 6))

(push 1 *nums*)

(format t "~a ~%" *nums*) ; => (1 2 4 6)



; get item at specified position (index):

(format t "3rd item in list = ~a ~%" (nth 2 *nums*)) ; => 4

(format t "1st item in list = ~a ~%" (nth 0 *nums*)) ; => 1


; plists - use symbols to describe data (appears similar to key : value pairs)

(defvar superman (list :name "Superman" :secret-id "Clark Kent"))

(defvar batman (list :name "Batman" :secret-id "Bruce Wayne"))

(defvar *hero-list* nil)

(push superman *hero-list*)
(push batman *hero-list*)

; (setq *print-case* :capitalize) ; see notes, below, at end of file

(dolist (hero *hero-list*)
  (format t "~{~a : ~a   ~} ~%" hero))

; => NAME : Batman   SECRET-ID : Bruce Wayne    
;    NAME : Superman   SECRET-ID : Clark Kent 

;; Note, if we had done (setq *print-case* :capitalize) before running the above, we get:

; => Name : Batman   Secret-Id : Bruce Wayne    
;    Name : Superman   Secret-Id : Clark Kent