// ========================================================================
 // FUNCIÓN: transicion 
// NATURALEZA: Pura (Determinista, sin efectos secundarios en el entorno)
 // ESTRATEGIA DE CONTROL: Evaluación Condicional Estructurada
 // IMPACTO EN MEMORIA: No Destructiva (Retorna una nueva tupla inmutable) 
// ========================================================================
def transicion (colorActual: String, cambiarA: String):
 (String, String) = {if (colorActual == "en-rojo" && cambiarA == "verde") {("en-rojo", "cambiar-a-verde")} 
else if (colorActual == "en-verde" && cambiarA == "amarillo")
 { ("en-verde", "cambiar-a-amarillo")}
 else if (colorActual == "en-amarillo" && cambiarA == "amarillo-intermitente")
 { ("en-amarillo", "cambiar-a-amarillo-intermitente") }
 else if (colorActual == "amarillo-intermitente" && cambiarA == "rojo") 
{ ("amarillo-intermitente", "cambiar-a-rojo") }
else {
  (colorActual, "accion-por-defecto")
 }
}           

// ========================================================================
 // FUNCIÓN: timer
 // NATURALEZA: Pura (Dado un timestamp idéntico, siempre retorna el mismo color)
 // ESTRATEGIA DE CONTROL: Evaluación Condicional por Rangos Temporales
 // IMPACTO EN MEMORIA: No Destructiva (Asigna valores inmutables en Stack) 
// ========================================================================
def timer (timestampActual: Long):
 String = {val duracionTotal = 219    // 90 + 120 + 6 + 3 
val momentoCiclo = timestampActual % duracionTotal
 if (momentoCiclo < 90) {"en-rojo” 
} else if (momentoCiclo < 210) {"en-verde"   // 90 + 120
} else if (momentoCiclo < 216) {"en-amarillo" // 90 + 120 + 6
} else {"amarillo-intermitente"}
}
