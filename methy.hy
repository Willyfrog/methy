
(defmacro route [name path params code]
  (quasiquote (let [[deco ((getattr app "route") (unquote path))]]
                (with-decorator deco (defn (unquote name) (unquote params) (unquote-splice code))))))

(defmacro route-with-methods [name path params code methods]
  (quasiquote (let [[deco (kwapply ((getattr app "route") (unquote path)) {"methods" (unquote methods)}) ]]
                (with-decorator deco (defn (unquote name) (unquote params) (unquote-splice code))))))

(defn  post-route [name path params code]
  (route-with-methods name path params code ["POST"]))

;;
;;(defn post-route [name path params code]
;;  (route-with-methods name path params code ["GET"]))

;;(defmacro route-fun [path fun &optional methods]
;;  (quasiquote 
;;   (let [[deco (if (none? (unquote methods))
;;                 ((getattr app "route") (unquote path))
;;                 (kwapply ((getattr app "route") (unquote path)) {(unquote methods)})
;;                 )]]
;;     (with-decorator deco (unquote fun)))))

;;(defmacro route-fun [path fun &optional methods]
;;  (quasiquote 
;;   (let [[deco ((getattr app "route") (unquote path))]]
;;     (with-decorator deco (quote (unquote fun))))))
