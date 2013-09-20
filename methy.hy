;;; Methy
;; based on paultag's meth library to access a Flask based application

(defmacro route [name path params code]
  "Default get request"
  (quasiquote (let [[deco ((getattr app "route") (unquote path))]]
                (with-decorator deco 
                  (defn (unquote name) (unquote params) (unquote-splice code))))))

(defmacro route-with-methods [name path params code methods]
  "Same as route but with an extra methods array to specify HTTP methods"
  (quasiquote (let [[deco (kwapply ((getattr app "route") (unquote path)) 
                                   {"methods" (unquote methods)})]]
                (with-decorator deco 
                  (defn (unquote name) (unquote params) (unquote-splice code))))))

;; Some macro examples
(defmacro post-route [name path params code]
  "Post request"
  `(route-with-methods ~name ~path ~params ~code ["POST"]))

(defmacro put-route [name path params code]
  "Put request"
  `(route-with-methods ~name ~path ~params ~code ["PUT"]))

(defmacro delete-route [name path params code]
  "Delete request"
  `(route-with-methods ~name ~path ~params ~code ["DELETE"]))
