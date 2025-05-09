object cosas {
    
}


object knight_rider{
    method peso() = 500

    method peligrosidad() = 10
}

object bumblebee{
    method peso() = 800

    method peligrosidad() = estado.peligrosidad()

    var estado = auto

    method cambiarEstado(){
        estado = estado.cambiar()
    }
}

object auto{
    method peligrosidad() = 15

    method cambiar() = robot
}

object robot{
    method peligrosidad() = 30

    method cambiar() = auto
}


object paquete_de_ladrillos{
    var property cantidad = 100
    method peso () =self.cantidad()*2

    method peligrosidad() = 2
}

object arena_a_granel{
    var property peso = 0

    method peligrosidad() = 1
}

object contenedor_portuario{
    const carga = [] // Está mal un polimorfismo innecesario(?

    method peso() = 100 + carga.map({x => x.peso()}).sum()

    method peligrosidad() {
        if(carga.size() > 0){
            return carga.map({x => x.peligrosidad()}).max()
        } else{
            return 0
        }
    }
}

object residuos_radioactivos{
    var property peso = 0

    method peligrosidad() = 200
}

object embalaje_de_seguridad{
    var property contenido = null

    method peso() = self.contenido().peso()

    method peligrosidad() = self.contenido().peligrosidad() / 2
}