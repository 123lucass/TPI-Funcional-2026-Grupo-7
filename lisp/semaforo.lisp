;; REQUERIMIENTO 1: Estados de Transición
;; FUNCIÓN: transicion
;; NATURALEZA: Pura (Sin efectos secundarios, determinista)
;; ESTRATEGIA: Función Predicado / Condicional Declarativo
;; IMPACTO EN MEMORIA: No destructiva (Retorna una estructura de lista nueva)
(defun transicion (color-actual cambiar-a)
  "Devuelve una lista con el estado y la acción según el ejemplo de la cátedra."
  (cond
    ((and (eq color-actual 'en-rojo) (eq cambiar-a 'verde))
     (list 'en-rojo "cambiar-a-verde"))
    ((and (eq color-actual 'en-verde) (eq cambiar-a 'amarillo))
     (list 'en-verde "cambiar-a-amarillo"))
    ((and (eq color-actual 'en-amarillo) (eq cambiar-a 'rojo))
     (list 'en-amarillo "cambiar-a-rojo"))
    ;; Extensión 1 (Iteración 2): Intermitencia de seguridad de 3 segundos
    ((and (eq color-actual 'en-amarillo) (eq cambiar-a 'amarillo-intermitente))
     (list 'en-amarillo "cambiar-a-amarillo-intermitente"))
    ((and (eq color-actual 'amarillo-intermitente) (eq cambiar-a 'rojo))
     (list 'amarillo-intermitente "cambiar-a-rojo"))
    (t
     (list color-actual 'accion-por-defecto))))
;; REQUERIMIENTO 2: Temporizador Automático
;; FUNCIÓN: timer
;; NATURALEZA: Pura (Sin efectos secundarios, determinista)
;; ESTRATEGIA: Composición Funcional y Aritmética Plana (Operador Módulo)
;; IMPACTO EN MEMORIA: No destructiva (Genera un símbolo independiente como retorno)
(defun timer (timestamp-actual)
  "Calcula automáticamente qué color debe estar activo en el timestamp dado."
  (let* ((duracion-total 219)
         (momento-ciclo (mod timestamp-actual duracion-total)))
    (cond
      ((< momento-ciclo 90) 'en-rojo)
      ((< momento-ciclo 210) 'en-verde)
      ((< momento-ciclo 216) 'en-amarillo)
      (t 'amarillo-intermitente))))
