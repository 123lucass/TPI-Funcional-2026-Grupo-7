;; ========================================================
;; CARGA DE LIBRERÍAS EXTERNAS (FASE 2)
;; ========================================================
(ql:quickload "local-time")

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
     (list 'en-amarillo "cambiar-a-amarillo-intermitente"))
    ((and (eq color-actual 'amarillo-intermitente) (eq cambiar-a 'rojo))
     (list 'amarillo-intermitente "cambiar-a-rojo"))
    (t
     (list color-actual 'accion-por-defecto))))

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


;; ========================================================
;; FUNCIÓN: ciclos-por-tiempo
;; NATURALEZA: Pura (mismo input siempre retorna mismo resultado)
;; ESTRATEGIA: Composición funcional aritmética (truncate)
;; IMPACTO: No destructiva
;; ========================================================
(defun ciclos-por-tiempo (tiempo-en-minutos)
  
  (let ((segundos-totales (* tiempo-en-minutos 60)))
    (truncate segundos-totales (duracion-ciclo))))

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

;; ========================================================
;; EXTENSIÓN 2 (FASE 2): Persistencia de Datos sin Bucles
;; FUNCIÓN: procesar-registros e informe
;; ========================================================
;(defun procesar-registros (datos stream)
; 
;  (if (null datos)
;      'ESCRITURA-COMPLETADA
;      (let* ((registro (car datos))
;             (epoch (first registro))
;             (color-ant (second registro))
;             (color-nue (third registro))
;             (timestamp (local-time:unix-to-timestamp epoch))
;             (tiempo-formateado (local-time:format-timestring nil timestamp
;                                 :format '(:year "-" (:month 2) "-" (:day 2) " "
;                                           (:hour 2) ":" (:min 2) ":" (:sec 2)))))
;        (format stream "~A - Transición: ~A -> ~A~%" tiempo-formateado color-ant color-nue)
;        (procesar-registros (cdr datos) stream))))

;;(defun informe (datos)
;;  
;;  (with-open-file (stream "informe-ejecucion-semaforo.txt"
;;                   :direction :output
;;                   :if-exists :supersede
;;                  :if-does-not-exist :create)
;;    (format stream "Informe de Ejecución del Sistema Semafórico~%")
;;   (format stream "=============~%")
;;    (procesar-registros datos stream)
;;    (format stream "==============~%")
;;    (format stream " --- Fin del Informe ---~%")))
