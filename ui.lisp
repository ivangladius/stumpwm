

(load-module "ttf-fonts")
(ql:quickload :clx-truetype)
(clx-truetype:cache-fonts)

(set-font (make-instance 'xft:font
			 :family "Hack"
			 :subfamily "Regular"
			 :size 13 
			 :antialias t))
(when *initializing*

  (mode-line))

(setf *mode-line-timeout* 5)

(defun show-ipv4-address ()
  (async-run "ip a s | grep \"inet \" | tail -n1 | awk '{print $2}'"))

(defun show-battery ()
  (async-run "acpi -i | head -n1 | grep -o -P \"..?%\""))

(setf *colors*
      '("#000000"   ;black
        "#BF6262"   ;red
        "#a1bf78"   ;green
        "#dbb774"   ;yellow
        "#7D8FA3"   ;blue
        "#ff99ff"   ;magenta
        "#53cdbd"   ;cyan
        "#ffffff")) ;white

(setf *mode-line-foreground-color* "black")
(setf *mode-line-background-color* "white")

(setf *mode-line-border-width* 0)
(setf *mode-line-border-height* 0)
(setf *mode-line-pad-x* 30)
(setf *mode-line-pad-y* 5)


(setf stumpwm:*screen-mode-line-format*
      (list
       '(:eval (async-run "date"))
       " | IP: "'(:eval (show-ipv4-address))
       " | Battery: " '(:eval (show-battery))
       " | %g"))

(define-key *top-map* (kbd "s-]") "mode-line")

(setf *group-format* "%t")
        

(setf *normal-border-width* 0)
(setf *window-border-style* :none)

(setf  *maxsize-border-width* 2
      *normal-border-width* 2
      *transient-border-width* 2)

(setq *ignore-wm-inc-hints* t)


(setf *message-window-gravity* :center)






(run-shell-command "nitrogen --restore &")

;;(set-font "-xos4-terminus-medium-r-normal-*-16-*-*-*-*-*-*-*")
;; (set-font "-xos4-terminus-medium-r-bold-*-18-*-*-*-*-*-*-*")

(when *initializing*
  (grename "A")
  (gnewbg "B")
  (gnewbg "C"))

(define-key *top-map* (kbd "s-1") "gprev")
(define-key *top-map* (kbd "s-2") "gnext")

(defparameter *async-shell* (uiop:launch-program "bash" :input :stream :output :stream))

(defun async-run (command)
  (write-line command (uiop:process-info-input *async-shell*))
  (force-output (uiop:process-info-input *async-shell*))
  (let* ((output-string (read-line (uiop:process-info-output *async-shell*)))
         (stream (uiop:process-info-output *async-shell*)))
    (if (listen stream)
        (loop while (listen stream)
              do (setf output-string (concatenate 'string
                                                  output-string
                                                  '(#\Newline)
                                                  (read-line stream)))))
    output-string))



;; (defcommand toggle-polybar () ()
;;   (run-shell-command "polybar-msg cmd toggle"))

;; (define-key *top-map* (kbd "s-P") "toggle-polybar")
