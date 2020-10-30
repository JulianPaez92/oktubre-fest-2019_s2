import marcas.*
import jarras.*
import personas.*

class Carpas{
	var property limiteGente
	var property musica = true
	var property marcaAVender
	var property personasAdentro = #{}
	
	method personaPuedeEntrar(persona) = self.limiteGente() > self.cantidadPersonasAdentro()
			and not persona.estaEbria() 
	
	method cantidadPersonasAdentro() = personasAdentro.size()
	
	method ingresarACarpa(persona) { 
		if(persona.puedeEntrar(self))  { personasAdentro.add(persona) }
		else { self.error("No entra") }
	}
	
	method servirJarra(persona,cantidad) { 
		if (personasAdentro.contains(persona))
		{   const jarra = new Jarras(capacidad = cantidad, marca = self.marcaAVender())
			persona.comprarJarra(jarra)
		}
		else { self.error("No esta la persona en la carpa") }
	}
	
	method cantidadEbriosEmpedernidos() = personasAdentro.count({ x=>x.esEbrioEmpedernido() })
}
