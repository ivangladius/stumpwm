
(load-module "swm-gaps")

;; Head gaps run along the 4 borders of the monitor(s)
(setf swm-gaps:*head-gaps-size* 0)
;; Inner gaps run along all the 4 borders of a window
(setf swm-gaps:*inner-gaps-size* 12)
;; Outer gaps add more padding to the outermost borders of a window (touching
;; the screen border)
(setf swm-gaps:*outer-gaps-size* 10)

;; Call command
(define-key *top-map* (kbd "s-[") "toggle-gaps")
