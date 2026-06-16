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
