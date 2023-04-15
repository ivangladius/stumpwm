

(defparameter youtube "https://www.youtube.de")
(defparameter twitter "https://www.twitter.de")
(defparameter github "https://www.github.com/ivangladius")

(defparameter xrp "https://www.kraken.com/prices/xrp")
(defparameter bitcoin "https://www.kraken.com/prices/bitcoin")
(defparameter jasmy "https://www.kraken.com/prices/jasmycoin")


;; ### OLD VERSION ###
;; (defun select-from-menu-visit-in-browser (list-pairs)
;;   (run-shell-command (format nil "chromium --new-window ~A"
;; 			     (when (null (cadr (select-from-menu
;; 				    (current-screen)
;; 				    list-pairs)))
;; 			       (run-commands "abort")))))


;; ### NEW VERSION
(defun select-from-menu-visit-in-browser (list-pairs)
  (let ((valid-content (cadr (select-from-menu
		       (current-screen)
		       list-pairs))))
    (and valid-content (run-shell-command
		 (format nil "chromium --new-window ~A" valid-content)))))
					   

(defcommand fsites () ()
  (select-from-menu-visit-in-browser
   `(("Youtube" ,youtube)
     ("Twitter" ,twitter)
     ("Github" ,github))))

(define-key *top-map* (kbd "s-,") "fsites")

(defcommand fcrypto () ()
  (select-from-menu-visit-in-browser
   `(("BTC" ,bitcoin)
     ("XRP" ,xrp)
     ("JASMY" ,jasmy))))


