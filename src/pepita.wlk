import wollok.game.*
import direccion.*
import nido.*
import silvestre.*
import estadoPepita.*

object pepita {
  const objetivo = nido
  const depredador = silvestre
  var energia = 100
  var property position = null

  method image() = ("pepita-" + self.estado().image(self)) + ".png"

  method text() = "\n\n\n" + energia

  method textColor() = self.estado().textColor()

  method estado() = if (self.tieneEnergia()) conEnergia else sinEnergia

  method tieneEnergia() = energia >= self.joulesPorKm() 

  method energia() = energia

  method joulesPorKm() = 9

  method disminuirEnergia(cantidad) {
    if (cantidad < 0) self.error("No se puede disminuir una cantidad negativa de energía")
    
    energia = 0.max(energia - cantidad)
  }

  method aumentarEnergia(cantidad) {
    if (cantidad < 0) self.error("No se puede aumentar una cantidad negativa de energía")
    
    energia += cantidad
  }

  method inicializar() {
    position = game.at(0, game.center().y())
    self.inicializarVuelo()
    game.addVisual(self)
  }

  method inicializarVuelo() {
    keyboard.up().onPressDo({ self.volarSeguro(arriba) })
    keyboard.right().onPressDo({ self.volarSeguro(derecha) })
    keyboard.down().onPressDo({ self.volarSeguro(abajo) })
    keyboard.left().onPressDo({ self.volarSeguro(izquierda) })
  }

  method volarSeguro(direccion) {
    try {
      self.volar(direccion)
    } catch e : Exception {
      game.say(self, e.message())
    } 
  }

  method volar(direccion) {
    self.estado().volar(self, direccion)
  }

  method mover(direccion) {
    self.validarMovimiento(direccion)
    position = direccion.avanzar(position)
  }

  method validarMovimiento(direccion) {
    if (direccion.estaEnElLimite(position)) self.error("¡Estás en el límite!")
  }
  
  // Útil para testeo
  method moverHasta(direccion) {
    position = direccion.avanzarHastaElLimite(position)
  }

  method estaEnObjetivo() = self.estaEnLaMismaPosicionQue(objetivo)

  method estaAtrapada() = self.estaEnLaMismaPosicionQue(depredador)

  method estaEnLaMismaPosicionQue(posicionable) = position == posicionable.position()
}