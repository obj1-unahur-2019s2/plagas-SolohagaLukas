import plagas.*

class Hogar {
	var property nivelDeMugre
	var property confort
	
	method esBueno() { return nivelDeMugre <= confort / 2 }
	method recibeAtaque(plaga) { 
		nivelDeMugre += plaga.nivelDeDanio()
	}
}

class Huerta {
	var property capacidadDeProduccion
	
	method esBueno() { return capacidadDeProduccion > nivel.numero() }
	method recibeAtaque(plaga) { 
		if(plaga.transmiteEnfermedades()) {
			capacidadDeProduccion -= plaga.nivelDeDanio() * 0.1 + 10
		} else {
			capacidadDeProduccion -= plaga.nivelDeDanio() * 0.1
		}
	}
}

class Mascota {
	var property nivelDeSalud
	
	method esBueno() { return nivelDeSalud > 250 }
	method recibeAtaque(plaga) {
		if(plaga.transmiteEnfermedades()){
			nivelDeSalud -= plaga.nivelDeDanio()
		} 
	}
}

object nivel {
	var property numero 
}

class Barrio {
	var elementos = []
	
	method elementosBuenos() {
		return elementos.count({e => e.esBueno()})
	}
	method esCopado() {
		var elementosMalos = elementos.count({e => not e.esBueno()})
		return self.elementosBuenos() > elementosMalos
	}
	method agregarElemento(element) {
		elementos.add(element)
	}
	method quitarElemento(element) {
		elementos.remove(element)
	}
}