import wollok.game.*

object nido {
  var position = null
  
  method position() = position
  
  method image() = "nido.png"
  
  method inicializar() {
    position = game.center().right(3).up(3)
    game.addVisual(self)
  }
}