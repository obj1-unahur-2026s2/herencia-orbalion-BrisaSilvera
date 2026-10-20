class Equipo {
    const nombre //son const o var
    const nivelEnergiaBase
    const entrenador
    const tecnologiasComplemnetarias = []

    method nombre() = nombre

    method nivelEnergiaBase() = nivelEnergiaBase

    method entrenador() = entrenador

    method tecnologiasComplemnetarias() = tecnologiasComplemnetarias

    method agregarTecnologias(nuevaTecnologia) = tecnologiasComplemnetarias.add(nuevaTecnologia)

    method tecnologiasActivas() = tecnologiasComplemnetarias.filter({t=> t.activa()})
    method valoresTecnologiasActiva() = self.tecnologiasActivas().sum({v => v.valorEnergetico() })
    method energiaTotal() = nivelEnergiaBase + self.valoresTecnologiasActiva()
    
    method prestigioUniversal()

}


class TecnologiaEspecial {
    const nombre
    const valorEnergetico
    const activa

    method nombre() = nombre
    method valorEnergetico() = valorEnergetico
    method activa() = activa

}
//Ejemplos de tecnologías: núcleos gravitacionales, interfaces de proyección mental, cámaras de fusión energética.

class EquipoLuminico inherits Equipo {
    const nivelRadiacionCapturada
    const cristalesSolares = []

    method nivelRadiacionCapturada() = nivelRadiacionCapturada

    method cristalesSolares() = cristalesSolares

    method agregarCristalesSolares(agregarCristal) = cristalesSolares.add(agregarCristal)

    override method energiaTotal() = if (nivelRadiacionCapturada <= 5000) super() * 1.10
                                     else super()
    
    override method prestigioUniversal() = cristalesSolares.size() >= 3 and entrenador.esDeEliteGalactica() and self.tecnologiasActivas().size() >= 1
}




class EquipoSintetico inherits Equipo{
    const nivelProcesamientoCentral
    const cantModulosActivos 
    const certificadosEstableCompeticion 

    method nivelProcesamientoCentral() = nivelProcesamientoCentral

    method cantModulosActivos() = cantModulosActivos

    method certificadosEstableCompeticion() = certificadosEstableCompeticion

    override method energiaTotal() = if (cantModulosActivos > 5) super() * 0.80
                                     else super()

    override method prestigioUniversal()= certificadosEstableCompeticion and cantModulosActivos > 3 and (self.tecnologiasActivas().size() == tecnologiasComplemnetarias.size())


}


class EquipoEterico inherits Equipo{
    const nivelFluctuacionDimensional
    const cantPortalesEnergeticosAbiertos

    method nivelFluctuacionDimensional() = nivelFluctuacionDimensional

    method cantPortalesEnergeticosAbiertos() = cantPortalesEnergeticosAbiertos

    override method prestigioUniversal()= nivelFluctuacionDimensional > 75 and cantPortalesEnergeticosAbiertos >= 2 and (self.tecnologiasActivas().size() == 2) 
    
    override method energiaTotal() = if (self.prestigioUniversal()) super() *1.15
                                     else super()


}


class Entrenador {

    const cantCiclosDeExp
    const estaEnSintoniaConEquipo
    const precisionEstrategica
    const rol
    const listaRoles = ["estratega cuantico", "arquitecto de energia","guia mental"]

    method initialize() {
        if (!listaRoles.contains(rol)) 
        self.error("Rol no homologado por la FOZ")
    } 
    method cantCiClosDeExp() = cantCiclosDeExp
    method estaEnSintoniaConEquipo() = estaEnSintoniaConEquipo
    method precisionEstrategica() =precisionEstrategica.min(100).max(0)
    method rol() = rol
    method rolCumple() = if (rol == "estratega cuantico") self.precisionEstrategica() > 80
                         else if(rol == "arquitecto de energia") self.estaEnSintoniaConEquipo()
                         else true
    method esDeEliteGalactica()= cantCiclosDeExp > 10 and self.rolCumple()
            
}

