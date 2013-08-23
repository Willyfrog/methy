(import [flask [Flask]])
(setv app (Flask "__main__"))

(require meth)

(print "setup / with GET")
(router index "/" []  (str "Hy world!"))

(print "setup / with POST")
(kwapply (router pindex "/" []  (str "Hy world!")) {"method": ["POST"]})
