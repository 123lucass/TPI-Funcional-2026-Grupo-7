;timer.lisp
(defun timer (timestamp-actual)
  "Calcula automáticamente qué color debe estar activo en el timestamp dado."
  (let* ((duracion-total 219)
         (momento-ciclo (mod timestamp-actual duracion-total)))
    (cond
      ((< momento-ciclo 120) 'en-rojo)
      ((< momento-ciclo 121) 'en-amarillo)
      ((< momento-ciclo 211) 'en-verde)
      ((< momento-ciclo 216) 'en-amarillo)
      (t 'amarillo-intermitente))))
;transicion.lisp
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
