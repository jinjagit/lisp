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
      :initform (error "Must provide a name"))
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

; because we set an accessor for sound, we can set this directly:

(setf (mammal-sound *mouse*) "Eeek!")

; we will need to create getters and setters for :name, however;

(defgeneric (setf mammal-name) (value the-mammal))

(defmethod (setf mammal-name) (value (the-mammal mammal))
  (setf (slot-value the-mammal 'name) value))

(defgeneric mammal-name (the-mammal))

(defmethod mammal-name ((the-mammal mammal))
  (slot-value the-mammal 'name ))

(setf (mammal-name *mouse*) "Vocal Micky")  

(format t "~a says ~a ~%"
  (slot-value *mouse* 'name)
  (slot-value *mouse* 'sound)) ; Vocal Mickey says Eeek!

; we can also use our getter to get the name (though we seemed to be able to get it in any case)

(format t "I am ~a ~%" (mammal-name *mouse*)) ; => I am Vocal Micky


;;; inheritence

(defclass dog (mammal) ())

(defparameter *rover*
  (make-instance 'dog :name "Rover" :sound "Woof!"))

(format t "~a says ~a ~%"
  (slot-value *rover* 'name)
  (slot-value *rover* 'sound))