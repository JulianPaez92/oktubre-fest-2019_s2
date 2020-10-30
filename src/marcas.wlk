class Cerveza{
	var property lupulo = 0
	var property pais
	method graduacion()
}

class Rubia inherits Cerveza{
	var property graduacion
}

class Negra inherits Cerveza{
	override method graduacion() = graduacionReglamentaria.valor().min(2*self.lupulo())
}

class Roja inherits Negra{
	override method graduacion() = super()*1.25
}

object graduacionReglamentaria{
	var property valor = 0
}

object alemania{}
object belgica{}
object republicaCheca{}
object mexico{}
object irlanda{}