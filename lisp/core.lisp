

;; ========================================================
;; REQUERIMIENTO 5: Planificación Temporal
;; ========================================================
(defun ciclos-por-tiempo (minutos)
  "Calcula la cantidad de ciclos completos en un período de minutos."
  (floor (* minutos 60) (duracion-ciclo)))

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

