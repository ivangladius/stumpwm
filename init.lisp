
#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
				       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(in-package :stumpwm)

(require :slynk)
(defcommand slynk (port) ((:string "Port number: "))
  (sb-thread:make-thread
   (lambda ()
     (slynk:create-server :port (parse-integer port) :dont-close t))
   :name "slynk-manual"))

(setf *default-package* :stumpwm)


(load "~/.stumpwm.d/settings.lisp")
(load "~/.stumpwm.d/keys.lisp")
(load "~/.stumpwm.d/ui.lisp")
