;; ========================================================
;; CARGA DE LIBRERÍA EXTERNA
;; ========================================================
;; Usamos Quicklisp para cargar ‘local-time’ en la memoria del sistema.
;; Es obligatorio correr esto antes de la función, sino el compilador 
;; no reconoce los comandos de tiempo y corta la ejecución tirando error.
(ql:quickload “local-time”)
;; ========================================================
;; FUNCIÓN: registrar-cambio
;; NATURALEZA: Impura (Realiza efectos secundarios al imprimir en la terminal)
;; ESTRATEGIA: Procedural (Uso de manejo de tiempo y formateo de cadenas)
;; IMPACTO: No destructiva (Solo lectura y reporte, no modifica el estado del sistema)
;; ========================================================
(defun registrar-cambio (epoca color-anterior color-nuevo)
  “Imprime en la terminal el log mostrando la fecha y hora en formato legible [AAAA-MM-DD HH:MM:SS].”

  (let* ((objeto-tiempo (local-time:unix-to-timestamp epoca))
         (tiempo-humano (local-time:format-timestring nil objeto-tiempo
                          :format ‘(“[“ :year “-“ (:month 2) “-“ (:day 2) “ “
                                    (:hour 2) “:” (:min 2) “:” (:sec 2) “]”))))
    (format t “Tiempo ~A: la luz ha cambiado de <~A> a <~A>~%” tiempo-humano color-anterior color-nuevo)))

