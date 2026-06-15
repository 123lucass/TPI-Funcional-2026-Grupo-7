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
