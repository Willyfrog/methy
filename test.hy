(import [flask [Flask]])
(setv app (Flask "__main__"))

(require methy)

(print "setup / with GET")
(router "/" index []  (str "Hy world!"))

(print "setup / with POST")
(router-with-methods "/" pindex []  (str "Hy post world!") ["POST"])

;;(kwapply (.run app) {"debug" true})
(.run app)

