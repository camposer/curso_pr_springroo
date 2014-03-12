package es.indra.formacion.pr.springroo.basico.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Persona {

    /**
     */
    @NotNull
    private String nombre;

    /**
     */
    @NotNull
    private String apellido;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date fechaNacimiento;

    /**
     */
    private Float altura;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "persona")
    private List<Ordenador> ordenadores = new ArrayList<Ordenador>();
}
