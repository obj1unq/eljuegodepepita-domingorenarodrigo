import wollok.game.*

object conEnergia {
  method textColor() = "1020ff"
  
  method image(pepita) {
    if (pepita.estaEnObjetivo()) {
      return "reposo"
    }
    
    if (pepita.estaAtrapada()) {
      return "gris"
    }
    
    return "vuelo"
  }
  
  method volar(pepita, direccion) {
    pepita.mover(direccion)
    pepita.disminuirEnergia(pepita.joulesPorKm())
  }
}

object sinEnergia {
  method textColor() = "3a3a3a"
  
  method image(pepita) = if (pepita.estaEnObjetivo()) "reposo" else "gris"
  
  method volar(pepita, direccion) {
    pepita.error("¡Energía insuficiente!")
  }
}