package es.indra.formacion.pr.springroo.basico.web;
import es.indra.formacion.pr.springroo.basico.model.Ordenador;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/ordenadors")
@Controller
@RooWebScaffold(path = "ordenadors", formBackingObject = Ordenador.class)
public class OrdenadorController {
}
