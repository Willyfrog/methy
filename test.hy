(import [flask [Flask]])
(setv app (Flask "__main__"))

(require methy)

(print "setup / with GET")
(route index "/" []  (str "Hy world!"))

(print "setup / with POST")
;;(route-with-methods pindex "/" []  (str "Hy post world!") ["POST"])
(post-route pindex "/" []  (str "Hy post world!"))

(defn myfun [] (str "Hy rocks"))

;;(route-fun "/yeah" myfun)
;;(kwapply (.run app) {"debug" true})
(.run app)

