
(defmacro router [path name params code]
  (quasiquote (let [[deco ((getattr app "route") (unquote path))]]
                (with-decorator deco (defn (unquote name) (unquote params) (unquote-splice code))))))

(defmacro router-with-methods [path name params code methods]
  (quasiquote (let [[deco (kwapply ((getattr app "route") (unquote path)) {"methods" (unquote methods)}) ]]
                (with-decorator deco (defn (unquote name) (unquote params) (unquote-splice code))))))
