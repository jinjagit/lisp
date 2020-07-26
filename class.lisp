#!/usr/bin/sbcl --script

;;;; classes:


(setq *print-case* :capitalize)


(defclass animal ()
  (name sound))

(defparameter *dog* (make-instance 'animal))

(setf (slot-value *dog* 'name) "Spot")
(setf (slot-value *dog* 'sound) "woof!")

(format t "~a says ~a ~%"
  (slot-value *dog* 'name)
  (slot-value *dog* 'sound))

; => Spot says woof!


(defclass mammal ()
  ((name
      :initarg :name
      :initform (error "Must provide a name")
      :accessor mammal-name)
  (sound
      :initarg :sound
      :initform "No sound"
      :accessor mammal-sound))) ; alternatives to accessor; reader (getter) writer (setter)

(defparameter *king-kong*
  (make-instance 'mammal :name "King Kong" :sound "Rawwr"))

(format t "~a says ~a ~%"
  (slot-value *king-kong* 'name)
  (slot-value *king-kong* 'sound)) ; King Kong says Rawwr


(defparameter *mouse*
  (make-instance 'mammal :name "Mute Mickey"))

(format t "~a says ~a ~%"
  (slot-value *mouse* 'name)
  (slot-value *mouse* 'sound)) ; Mute Mickey says No sound

(setf (mammal-name *mouse*) "Vocal Mickey")
(setf (mammal-sound *mouse*) "Eeek!")

(format t "~a says ~a ~%"
  (slot-value *mouse* 'name)
  (slot-value *mouse* 'sound)) ; Vocal Mickey says Eeek!
