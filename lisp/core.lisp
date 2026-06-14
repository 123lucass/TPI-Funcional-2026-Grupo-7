;; REQUERIMIENTO 1: Estados de Transición
(defun transicion (color-actual cambiar-a)
  "Modelará el cambio de estados respetando la secuencia vial real de seguridad."
  (cond
    ((and (eq color-actual 'en-rojo) (eq cambiar-a 'verde))
     (list 'en-verde "cambiar-a-verde"))
    ((and (eq color-actual 'en-verde) (eq cambiar-a 'amarillo))
     (list 'en-amarillo "cambiar-a-amarillo"))
    ((and (eq color-actual 'en-amarillo) (eq cambiar-a 'amarillo-intermitente))
     (list 'amarillo-intermitente "cambiar-a-amarillo-intermitente"))
    ((and (eq color-actual 'amarillo-intermitente) (eq cambiar-a 'rojo))
     (list 'en-rojo "cambiar-a-rojo"))
    (t 
     (list color-actual 'accion-por-defecto))))

;; REQUERIMIENTO 2: Temporizador Automático
(defun timer (timestamp-actual)
  "Calcula qué color debe estar activo en un timestamp Unix dado usando el ciclo de 219s."
  (let* ((duracion-total 219) 
         (momento-ciclo (mod timestamp-actual duracion-total)))
    (cond
      ((< momento-ciclo 90) 'en-rojo)
      ((< momento-ciclo 210) 'en-verde)     
      ((< momento-ciclo 216) 'en-amarillo)   
      (t 'amarillo-intermitente))))          

;; REQUERIMIENTO 3: Sistema de Auditoría
(defun registrar-cambio (epoch color-anterior color-nuevo)
  "Imprime en la terminal el log con formato forense para auditoría."
  (format t "Tiempo <~A>: la luz ha cambiado de <~A> a <~A>~%" 
          epoch color-anterior color-nuevo))

;; REQUERIMIENTO 4: Análisis de Ciclos Semafóricos
(defun duracion-ciclo ()
  "Retorna la duración total fija de un ciclo bajo las reglas actuales (219 segundos)."
  219)

(defun recomendacion-ciclo (duracion)
  "Entrega una recomendación de optimización basada en la psicología del conductor."
  (cond
    ((< duracion 35) "Ciclo ineficiente: Muy corto para la psicología del conductor.")
    ((> duracion 150) "Ciclo ineficiente (Peligro): Mayor a 150s, los usuarios tienden a evitarlo.")
    (t "Ciclo óptimo: Se acomoda perfectamente a la mentalidad del usuario.")))

;; REQUERIMIENTO 5: Planificación Temporal
(defun ciclos-por-tiempo (minutos)
  "Calcula la cantidad de ciclos completos que se completan en determinado período de minutos."
  (let* ((segundos-totales (* minutos 60))
         (duracion (duracion-cycle-auxiliar))) 
    (floor segundos-totales (duracion-ciclo))))

(defun duracion-cycle-auxiliar () 219) 

;; REQUERIMIENTO 6: Informe de Distribución Temporal
(defun informe-distribucion-1hora ()
  "Calcula el porcentaje de tiempo que cada color estará activo durante una hora (3600 segundos)."
  (let* ((pct-rojo (* (/ 90 219) 100))
         (pct-verde (* (/ 120 219) 100))
         (pct-amarillo (* (/ 6 219) 100))
         (pct-intermitente (* (/ 3 219) 100)))
    (list (cons 'en-rojo pct-rojo)
          (cons 'en-verde pct-verde)
          (cons 'en-amarillo pct-amarillo)
          (cons 'amarillo-intermitente pct-intermitente))))

;; REQUERIMIENTO 7: Aseguramiento de la Calidad (Motor de Simulación)
(defun simular-linea-tiempo (timestamp-actual timestamp-fin color-anterior)
  "Simula el paso del tiempo segundo a segundo de forma puramente recursiva."
  (if (> timestamp-actual timestamp-fin)
      'SIMULACION-COMPLETADA
      (let ((color-actual (timer timestamp-actual)))
        (if (not (eq color-actual color-anterior))
            (registrar-cambio timestamp-actual color-anterior color-actual))
        (simular-linea-tiempo (+ timestamp-actual 1) timestamp-fin color-actual))))
