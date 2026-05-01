import wollok.game.*
import pepita.*

object silvestre {
  const presa = pepita
  
  method image() = "silvestre.png"
  
  method position() = game.at(self.posicionX(), self.limiteY())
  
  method posicionX() = self.limiteX().max(presa.position().x())
  
  method limiteX() = 3

  method limiteY() = 0
  
  method inicializar() {
    game.addVisual(self)
  }
}