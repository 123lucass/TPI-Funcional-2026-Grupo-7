;; ========================================================
;; REQUERIMIENTO 3: Sistema de Auditoría
;; FUNCIÓN: registrar-cambio
;; NATURALEZA: Impura (Efecto secundario de salida I/O en terminal)
;; ESTRATEGIA: Función de Mapeo de Salida
;; IMPACTO: No destructiva
;; ========================================================
(defun registrar-cambio (epoch color-anterior color-nuevo)
  (format t "Tiempo Unix <~A>: la luz ha cambiado de <~A> a <~A>~%" 
          epoch color-anterior color-nuevo))
;; ========================================================
;; REQUERIMIENTO 4: Análisis de Ciclos Semafóricos
;; FUNCIÓN: duracion-ciclo y recomendacion-ciclo
;; NATURALEZA: Pura
;; ESTRATEGIA: Condicional Declarativo / Evaluación de Rangos
;; IMPACTO: No destructiva
;; ========================================================
(defun duracion-ciclo ()
  219)

(defun recomendacion-ciclo (duracion)
  (cond
    ((< duracion 35) "Ciclo ineficiente.")
    ((> duracion 150) "Ciclo ineficiente (Peligro).")
    (t "Ciclo óptimo.")))
