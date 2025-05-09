object camion {
  const carga = [] // new list()

  method tara() = 1000

  method peso() = self.tara() + self.pesoCarga()
  
  method pesoCarga() = carga.sum({x=>x.peso()})

  method descargar(unObjeto){
    carga.remove(unObjeto)
  }

  method cargar(unObjeto){
    unObjeto.reaccionar()
    carga.add(unObjeto)
  }

  method tieneObjetoEntre(minimo, maximo){
    return carga.map({x=>x.peso()}).any({x=>x.between(minimo, maximo)})
  }

  method masPesada(){
    return carga.max({x=>x.peso()})
  }

  method todosPares(){
    carga.all({x=>x.peso().even()})
  }

  method pesa(unPeso){
    carga.any({x=>x.peso() == unPeso})
  }

  method peligrosidad(unValor){
    carga.find({x=>x.peligrosidad() == unValor})
  }
  
  method todosLosPeligrosos(unValor){
    return carga.filter({x=>x.peligrosidad() > unValor})
  }

  method estaExcedido(){
    return self.peso() > 2500
  }

  method puedeCircular(unLimite){
    return self.estaExcedido().negate() and (self.todosLosPeligrosos(unLimite).isEmpty())
  }

  method hayAlgoEntre(min, max){
    carga.any({x=>x.peso().between(min, max)})
  }
}