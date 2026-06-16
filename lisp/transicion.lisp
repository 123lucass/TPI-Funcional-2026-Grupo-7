(defun transicion (color-actual cambiar-a)
  "Devuelve una lista con el estado y la acción según el ejemplo de la cátedra."
  (cond
    ((and (eq color-actual 'en-rojo) (eq cambiar-a 'amarillo))
     (list 'en-rojo "cambiar-a-amarillo"))
    ((and (eq color-actual 'en-amarillo) (eq cambiar-a 'verde))
     (list 'en-amarillo "cambiar-a-verde"))
    ((and (eq color-actual 'en-verde) (eq cambiar-a 'amarillo))
     (list 'en-verde "cambiar-a-amarillo"))  
    ((and (eq color-actual 'en-amarillo) (eq cambiar-a 'amarillo-intermitente))
     (list 'en-amarillo "cambiar-a-amarillo-intermitente"))
     ((and (eq color-actual 'amarillo-intermitente) (eq cambiar-a 'rojo))
     (list 'amarillo-intermitente "cambiar-a-rojo"))
    (t
     (list color-actual 'accion-por-defecto))))
