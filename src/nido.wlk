import wollok.game.*

object nido {
  var position = null
  
  method position() = position
  
  method image() = "nido.png"
  
  method inicializar() {
    position = game.center().right(1).up(2)
    game.addVisual(self)
  }
}