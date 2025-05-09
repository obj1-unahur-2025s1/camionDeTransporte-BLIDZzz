object knight_rider{
    method reaccionar(){
        
    }

    method espacio() = 1

    method peso() = 500

    method peligrosidad() = 10
}

object bumblebee{
    method reaccionar(){
        estado = auto
    }
    
    method espacio() = 2

    method peso() = 800

    method peligrosidad() = estado.peligrosidad()

    var property estado = auto

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
    method reaccionar(){
        self.cantidad(self.cantidad() + 12)
    }

    method espacio() {
        if(self.cantidad() < 100){
            return 1
        } else if(self.cantidad() < 300){
            return 2
        } else{
            return 3
        }
    }

    method sgs(){
        return (2.min(1.max(cantidad-99))).max(3.min(cantidad-250)) // Creo que era así
    }

    var property cantidad = 100
    method peso () =self.cantidad()*2

    method peligrosidad() = 2
}

object arena_a_granel{
    method reaccionar(){self.peso(self.peso() - 10)}

    method espacio() = 1

    var property peso = 0

    method peligrosidad() = 1
}

object bateria_antiaerea{
    method reaccioanr(){misiles = true}

    method espacio() {
        if(self.misiles()){
            return 2
        } else{
            return 1
        }
    }

    var misiles = true

    method peso(){
        if(self.misiles()){
            return 300
        } else{
            return 200
        }
    }

    method cambiar() {
        misiles = misiles.negate()
    }

    method misiles() = misiles

    method peligrosidad(){
        if(self.misiles()){
            return 100
        } else{
            return 0
        }
    }
}

object contenedor_portuario{
    method reaccionar() {carga.forEach({x=>x.reaccionar()})}

    method espacio() = 1 + carga.map({x=>x.espacio()}).sum()

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
    method reaccionar(){
        self.peso(self.peso() + 15)
    }

    method espacio() = 1

    var property peso = 0

    method peligrosidad() = 200
}

object embalaje_de_seguridad{
    method reaccionar() {}

    method espacio() = 1

    var property contenido = null

    method peso() = self.contenido().peso()

    method peligrosidad() = self.contenido().peligrosidad() / 2
}