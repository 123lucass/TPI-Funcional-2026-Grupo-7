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

