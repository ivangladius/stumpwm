
#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
				       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(init-load-path #p"/usr/share/stumpwm/contrib/util")

(in-package :stumpwm)

;; (require :slynk)
;; (defcommand slynk (port) ((:string "Port number: "))
;;   (sb-thread:make-thread
;;    (lambda ()
;;      (slynk:create-server :port (parse-integer port) :dont-close t))
;;    :name "slynk-manual"))

(require :swank)
(swank-loader:init)
(swank:create-server :port 4004
		     :style swank:*communication-style*
		     :dont-close t)


(setf *default-package* :stumpwm)


(load "~/.stumpwm.d/settings.lisp")
(load "~/.stumpwm.d/keys.lisp")
(load "~/.stumpwm.d/ui.lisp")

;; modules

(load "~/.stumpwm.d/swm-gaps.lisp")
(load "~/.stumpwm.d/winner.lisp")

;; my libs and programs
(load "~/.stumpwm.d/browser.lisp")
