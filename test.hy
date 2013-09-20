;; Simple example application

(import [flask [Flask]])
(setv app (Flask "__main__"))

(require methy)

(print "setup / with GET")
(route get-index "/" []  (str "Hy world!"))

(print "setup /post with POST")
(post-route post-index "/post" []  (str "Hy post world!"))

(route-with-methods both-index "/both" []  (str "Hy to both worlds!") ["GET" "POST"])

(.run app)

;;; Now you can do:
;; curl 127.0.0.1:5000
;; curl -X POST 127.0.0.1:5000/post
;; curl -X POST 127.0.0.1:5000/both
;; curl 127.0.0.1:5000/both
