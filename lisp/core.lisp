;; =================================================================
;; FUNCIÓN: simular-linea-tiempo
;; NATURALEZA: Impura (Genera efectos colaterales al registrar los cambios, su valor de retorno no contiene el histórico)
;; ESTRATEGIA: Recursividad (Implementada de forma pura / recursión de cola)
;; IMPACTO: Con efectos colaterales (Invoca a la función registrar-cambio)
;; =================================================================
(defun simular-linea-tiempo (timestamp-actual timestamp-fin color-anterior)
  (if (> timestamp-actual timestamp-fin)
      'SIMULACION-COMPLETADA
      (let ((color-actual (timer timestamp-actual)))
        (if (not (eq color-actual color-anterior))
            (registrar-cambio timestamp-actual color-anterior color-actual))
        (simular-linea-tiempo (+ timestamp-actual 1) timestamp-fin color-actual))))
