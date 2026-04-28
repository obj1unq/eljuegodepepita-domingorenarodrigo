import wollok.game.*

object arriba {
	method limite() = game.height() - 1
	
	method estaEnElLimite(position) = position.y() == self.limite()
	
	method avanzar(position) = position.up(1)
	
	method avanzarHastaElLimite(position) = game.at(position.x(), self.limite())
}

object derecha {
	method limite() = game.width() - 1
	
	method estaEnElLimite(position) = position.x() == self.limite()
	
	method avanzar(position) = position.right(1)
	
	method avanzarHastaElLimite(position) = game.at(self.limite(), position.y())
}

object izquierda {
	method limite() = 0
	
	method estaEnElLimite(position) = position.x() == self.limite()
	
	method avanzar(position) = position.left(1)
	
	method avanzarHastaElLimite(position) = game.at(self.limite(), position.y())
}

object abajo {
	method limite() = 0
	
	method estaEnElLimite(position) = position.y() == self.limite()
	
	method avanzar(position) = position.down(1)
	
	method avanzarHastaElLimite(position) = game.at(position.x(), self.limite())
}