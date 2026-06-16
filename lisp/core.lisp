;; ========================================================
;; FUNCIÓN: ciclos-por-tiempo
;; NATURALEZA: Pura (mismo input siempre retorna mismo resultado)
;; ESTRATEGIA: Composición funcional aritmética (floor)
;; IMPACTO: No destructiva
;; ========================================================
(defun ciclos-por-tiempo (tiempo-en-minutos)
  
  (let ((segundos-totales (* tiempo-en-minutos 60)))
    (floor segundos-totales (duracion-ciclo))))

;; ========================================================
;; FUNCIÓN: informe-distribucion-1hora
;; NATURALEZA: Pura (sin efectos secundarios)
;; ESTRATEGIA: Asignación local secuencial (let*)
;; IMPACTO: No destructiva
;; ========================================================
(defun informe-distribucion-1hora ()
 
  (let* ((ciclo-total             (duracion-ciclo))
         (rojo-porcentaje         (* (/ 90  ciclo-total) 100.0))
         (verde-porcentaje        (* (/ 120 ciclo-total) 100.0))
         (amarillo-porcentaje     (* (/ 6   ciclo-total) 100.0))
         (intermitente-porcentaje (* (/ 3   ciclo-total) 100.0)))
    (list (cons 'en-rojo              rojo-porcentaje)
          (cons 'en-verde             verde-porcentaje)
          (cons 'en-amarillo          amarillo-porcentaje)
          (cons 'amarillo-intermitente intermitente-porcentaje))))
