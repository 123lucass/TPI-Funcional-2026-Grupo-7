;; =================================================================
;; FUNCIÓN: timer
;; NATURALEZA: Pura (Cálculo matemático determinista sin efectos secundarios)
;; ESTRATEGIA: Composición Funcional / Aritmética Plana (Operación Módulo)
;; IMPACTO: Inmutable (Retorna un símbolo independiente sin alterar el estado)
;; =================================================================
(defun timer (timestamp-actual)
  (let* ((duracion-total 219)
         (momento-ciclo (mod timestamp-actual duracion-total)))
    (cond
      ((< momento-ciclo 120) 'en-rojo)
      ((< momento-ciclo 121) 'en-amarillo)
      ((< momento-ciclo 211) 'en-verde)
      ((< momento-ciclo 216) 'en-amarillo)
      (t 'amarillo-intermitente))))
;; =================================================================
;; FUNCIÓN: transicion
;; NATURALEZA: Pura (Determinista, libre de efectos colaterales en el sistema)
;; ESTRATEGIA: Condicional Declarativo / Evaluación Estricta de Predicados
;; IMPACTO: No destructiva (Genera y retorna una estructura de lista nueva)
;; =================================================================
(defun transicion (color-actual cambiar-a)
  (cond
    ((and (eq color-actual 'en-rojo) (eq cambiar-a 'amarillo))
     (list 'en-rojo "cambiar-a-amarillo"))
    ((and (eq color-actual 'en-amarillo) (eq cambiar-a 'verde))
     (list 'en-amarillo "cambiar-a-verde"))
    ((and (eq color-actual 'en-verde) (eq cambiar-a 'amarillo))
     (list 'en-verde "cambiar-a-amarillo"))  
    ((and (eq color-actual 'en-amarillo) (eq cambiar-a 'amarillo-intermitente))
     (list 'en-amarillo "cambiar-a-yellow-intermitente"))
    ((and (eq color-actual 'amarillo-intermitente) (eq cambiar-a 'rojo))
     (list 'amarillo-intermitente "cambiar-a-rojo"))
    (t
     (list color-actual 'accion-por-defecto))))
