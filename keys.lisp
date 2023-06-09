
;; WINDOW
(define-key *top-map* (kbd "s-f") "fullscreen")
(define-key *top-map* (kbd "s-Q") "my/kill-window")
(define-key *top-map* (kbd "s-q") "delete-window")
(define-key *top-map* (kbd "s-a") "my/hsplit-and-focus")
(define-key *top-map* (kbd "s-s") "my/vsplit-and-focus")

(define-key *top-map* (kbd "s-p") "pull-hidden-previous")
(define-key *top-map* (kbd "s-n") "pull-hidden-next")

(define-key *top-map* (kbd "s-h") "move-focus left")
(define-key *top-map* (kbd "s-l") "move-focus right")
(define-key *top-map* (kbd "s-j") "move-focus down")
(define-key *top-map* (kbd "s-k") "move-focus up")
(define-key *top-map* (kbd "s-o") "fother")
(define-key *top-map* (kbd "s-O") "only")

(define-key *top-map* (kbd "s-.") "colon")

(define-key *top-map* (kbd "XF86MonBrightnessUp") 
	    "exec brightnessctl set +10%")
(define-key *top-map* (kbd "XF86MonBrightnessDown") 
	    "exec brightnessctl set 10%-")



;; PROGRAMS
(define-key *top-map* (kbd "s-7") "exec nautilus --new-window")
(define-key *top-map* (kbd "s-8") "exec chromium")
(define-key *top-map* (kbd "s-9") "exec emacsclient --create-frame --alternate-editor=\"\"")
(define-key *top-map* (kbd "s-0") "exec xterm")




(defcommand my/kill-window () ()
            (delete-window)
            (remove-split))

(defcommand my/hsplit-and-focus () ()
  (vsplit)
  (move-focus :down))

(defcommand my/vsplit-and-focus () ()
  (hsplit)
  (move-focus :right))


(defcommand hello-world () ()
    (message "hello wolrd"))
;; WINDOW
