import elementos.*

class Plaga {
	var poblacion = 0
	
	method transmiteEnfermedades() {
		return poblacion >= 10
	}
	method atacar() {
		poblacion += poblacion * 0.1
	}
	method ataque(elemento) {
		self.atacar()
		elemento.recibeAtaque(self)
	}
}

class Cucaracha inherits Plaga {
	var property pesoPromedio
	
	override method transmiteEnfermedades() {
		return super() and pesoPromedio >= 10
	}
	method nivelDeDanio() { return poblacion / 2 }
	override method atacar() {
		super()
		pesoPromedio += 2
	}
}

class Pulga inherits Plaga {
	
	method nivelDeDanio() { return poblacion * 2 }
}

class Garrapata inherits Pulga { 
	override method atacar() {
		poblacion += poblacion * 0.2
	}
}

class Mosquito inherits Plaga {
	
	override method transmiteEnfermedades() {
		return super() and poblacion % 3 == 0
	}
	method nivelDeDanio() {	return poblacion }
}