import marcas.*

class Jarras{
	const property capacidad
	var property marca
	method cantidadAlcohol() = capacidad * (marca.graduacion() / 100)
	method pais() = marca.pais()
}
