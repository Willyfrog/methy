
(defmacro router [path name params code &kwargs extra]
  (quasiquote (let [[deco (if (unquote extra)
                            (kwapply ((getattr app "route") (unquote path)) extra)
                            ((getattr app "route") (unquote path)))]]
                (with-decorator deco (defn (unquote name) (unquote params) (unquote-splice code))))))
