// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.indra.formacion.pr.springroo.basico.model;

import es.indra.formacion.pr.springroo.basico.model.Ordenador;
import es.indra.formacion.pr.springroo.basico.model.Persona;

privileged aspect Ordenador_Roo_JavaBean {
    
    public String Ordenador.getNombre() {
        return this.nombre;
    }
    
    public void Ordenador.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String Ordenador.getSerial() {
        return this.serial;
    }
    
    public void Ordenador.setSerial(String serial) {
        this.serial = serial;
    }
    
    public Persona Ordenador.getPersona() {
        return this.persona;
    }
    
    public void Ordenador.setPersona(Persona persona) {
        this.persona = persona;
    }
    
}
