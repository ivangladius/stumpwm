

(defparameter youtube "https://www.youtube.de")
(defparameter twitter "https://www.twitter.de")
(defparameter github "https://www.github.com/ivangladius")

(defparameter xrp "https://www.kraken.com/prices/xrp")
(defparameter bitcoin "https://www.kraken.com/prices/bitcoin")
(defparameter jasmy "https://www.kraken.com/prices/jasmycoin")

(defun select-from-menu-visit-in-browser (list-pairs)
  (run-shell-command (format nil "chromium --new-window ~A"
			     (cadr (select-from-menu
				    (current-screen)
				    list-pairs)))))

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


