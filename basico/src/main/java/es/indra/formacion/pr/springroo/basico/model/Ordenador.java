package es.indra.formacion.pr.springroo.basico.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Ordenador {

    /**
     */
    @NotNull
    private String nombre;

    /**
     */
    @NotNull
    private String serial;

    /**
     */
    @ManyToOne
    private Persona persona;
}
