;; ========================================================
;; REQUERIMIENTO 3: Sistema de Auditoría
;; FUNCIÓN: registrar-cambio
;; NATURALEZA: Impura (Efecto secundario de salida I/O en terminal)
;; ESTRATEGIA: Función de Mapeo de Salida
;; IMPACTO: No destructiva
;; ========================================================
(defun registrar-cambio (epoch color-anterior color-nuevo)
  "Imprime en la terminal el log con formato forense para auditoría."
  (format t "Tiempo <~A>: la luz ha cambiado de <~A> a <~A>~%" 
          epoch color-anterior color-nuevo))
;; ========================================================
;; REQUERIMIENTO 4: Análisis de Ciclos Semafóricos
;; FUNCIÓN: duracion-ciclo y recomendacion-ciclo
;; NATURALEZA: Pura
;; ESTRATEGIA: Condicional Declarativo / Evaluación de Rangos
;; IMPACTO: No destructiva
;; ========================================================
(defun duracion-ciclo ()
  "Retorna la duración total fija de un ciclo bajo las reglas actuales (219 segundos)."
  219)

(defun recomendacion-ciclo (duracion)
  "Entrega una recomendación de optimización basada en la psicología del conductor."
  (cond
    ((< duracion 35) "Ciclo ineficiente: Muy corto para la psicología del conductor.")
    ((> duracion 150) "Ciclo ineficiente (Peligro): Mayor a 150s, los usuarios tienden a evitarlo.")
    (t "Ciclo óptimo: Se acomoda perfectamente a la mentalidad del usuario.")))

;; ========================================================
