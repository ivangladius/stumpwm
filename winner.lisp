
(load-module "winner-mode")

(define-key *top-map* (kbd "s-i") "winner-undo")
(define-key *top-map* (kbd "s-u") "winner-redo")
