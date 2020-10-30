import marcas.*
import jarras.*
import carpas.*

class Persona{
	const property peso
	var property jarrasCompradas = []
	const property musicaTradicional = false
	const property aguante
	var property nacionalidad
	
	method comprarJarra(unaJarra) {jarrasCompradas.add(unaJarra)}
	method totalAlcohol() = jarrasCompradas.sum({ jarra=> jarra.cantidadAlcohol() })
	method estaEbria() = aguante < self.totalAlcohol()*peso
	method leGusta(cerveza) = true
	
	method personaQuiereEntrar(carpa) = self.leGusta(carpa.marcaAVender()) and 
	(self.musicaTradicional() == carpa.musica())
	
	method puedeEntrar(carpa) = self.personaQuiereEntrar(carpa) and carpa.personaPuedeEntrar(self)
	
	method esEbrioEmpedernido() = jarrasCompradas.all({ x=>x.capacidad() >= 1 })
	
	method esPatriota() = jarrasCompradas.all({ x=>x.pais() == self.nacionalidad() })
}

class Belga inherits Persona{
	override method leGusta(cerveza) = cerveza.lupulo() > 4 
}

class Checo inherits Persona{
	override method leGusta(cerveza) = cerveza.graduacion() > 8
}

class Aleman inherits Persona{
	override method personaQuiereEntrar(carpa) = super(carpa) and carpa.cantidadPersonasAdentro().even()
}
