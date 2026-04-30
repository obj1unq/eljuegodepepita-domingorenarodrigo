import wollok.game.*
import direccion.*
import nido.*
import silvestre.*

object pepita {
	const objetivo = nido
	const depredador = silvestre
	var energia = 100
	var property position = null

	method energia() = energia

	method text() = "\n\n\n" + energia

	method textColor() = "1020ff" 
	
	method image() = ("pepita-" + self.estadoImagen()) + ".png"
	
	method estadoImagen() {
		if (self.estaEnObjetivo()) {
			return "reposo"
		}
		
		if (self.estaAtrapada()) {
			return "cautiverio"
		}
		
		return "vuelo"
	}
	
	method estaEnObjetivo() = self.estaEnLaMismaPosicionQue(objetivo)
	
	method estaAtrapada() = self.estaEnLaMismaPosicionQue(depredador)
	
	method estaEnLaMismaPosicionQue(
		posicionable
	) = position == posicionable.position()
	
	method inicializar() {
		position = game.at(0, game.center().y())
		self.inicializarMovimiento()
		game.addVisual(self)
	}
	
	method inicializarMovimiento() {
		keyboard.up().onPressDo({ self.moverSeguro(arriba) })
		keyboard.right().onPressDo({ self.moverSeguro(derecha) })
		keyboard.down().onPressDo({ self.moverSeguro(abajo) })
		keyboard.left().onPressDo({ self.moverSeguro(izquierda) })
	}
	
	method moverSeguro(direccion) {
		try {
			self.mover(direccion)
		} catch e : Exception {
			game.say(self, e.message())
		}
	}
	
	method mover(direccion) {
		self.validarMovimiento(direccion)
		
		position = direccion.avanzar(position)
	}
	
	method validarMovimiento(direccion) {
		if (direccion.estaEnElLimite(position)) self.error("¡Estás en el límite!")
	}
	
	method moverHasta(direccion) {
		position = direccion.avanzarHastaElLimite(position)
	}
}