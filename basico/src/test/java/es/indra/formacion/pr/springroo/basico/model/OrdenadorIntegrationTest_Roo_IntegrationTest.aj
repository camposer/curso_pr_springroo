// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.indra.formacion.pr.springroo.basico.model;

import es.indra.formacion.pr.springroo.basico.model.Ordenador;
import es.indra.formacion.pr.springroo.basico.model.OrdenadorDataOnDemand;
import es.indra.formacion.pr.springroo.basico.model.OrdenadorIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect OrdenadorIntegrationTest_Roo_IntegrationTest {
    
    declare @type: OrdenadorIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: OrdenadorIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: OrdenadorIntegrationTest: @Transactional;
    
    @Autowired
    OrdenadorDataOnDemand OrdenadorIntegrationTest.dod;
    
    @Test
    public void OrdenadorIntegrationTest.testCountOrdenadors() {
        Assert.assertNotNull("Data on demand for 'Ordenador' failed to initialize correctly", dod.getRandomOrdenador());
        long count = Ordenador.countOrdenadors();
        Assert.assertTrue("Counter for 'Ordenador' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void OrdenadorIntegrationTest.testFindOrdenador() {
        Ordenador obj = dod.getRandomOrdenador();
        Assert.assertNotNull("Data on demand for 'Ordenador' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Ordenador' failed to provide an identifier", id);
        obj = Ordenador.findOrdenador(id);
        Assert.assertNotNull("Find method for 'Ordenador' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Ordenador' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void OrdenadorIntegrationTest.testFindAllOrdenadors() {
        Assert.assertNotNull("Data on demand for 'Ordenador' failed to initialize correctly", dod.getRandomOrdenador());
        long count = Ordenador.countOrdenadors();
        Assert.assertTrue("Too expensive to perform a find all test for 'Ordenador', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Ordenador> result = Ordenador.findAllOrdenadors();
        Assert.assertNotNull("Find all method for 'Ordenador' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Ordenador' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void OrdenadorIntegrationTest.testFindOrdenadorEntries() {
        Assert.assertNotNull("Data on demand for 'Ordenador' failed to initialize correctly", dod.getRandomOrdenador());
        long count = Ordenador.countOrdenadors();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Ordenador> result = Ordenador.findOrdenadorEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Ordenador' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Ordenador' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void OrdenadorIntegrationTest.testFlush() {
        Ordenador obj = dod.getRandomOrdenador();
        Assert.assertNotNull("Data on demand for 'Ordenador' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Ordenador' failed to provide an identifier", id);
        obj = Ordenador.findOrdenador(id);
        Assert.assertNotNull("Find method for 'Ordenador' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyOrdenador(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Ordenador' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void OrdenadorIntegrationTest.testMergeUpdate() {
        Ordenador obj = dod.getRandomOrdenador();
        Assert.assertNotNull("Data on demand for 'Ordenador' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Ordenador' failed to provide an identifier", id);
        obj = Ordenador.findOrdenador(id);
        boolean modified =  dod.modifyOrdenador(obj);
        Integer currentVersion = obj.getVersion();
        Ordenador merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Ordenador' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void OrdenadorIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Ordenador' failed to initialize correctly", dod.getRandomOrdenador());
        Ordenador obj = dod.getNewTransientOrdenador(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Ordenador' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Ordenador' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'Ordenador' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void OrdenadorIntegrationTest.testRemove() {
        Ordenador obj = dod.getRandomOrdenador();
        Assert.assertNotNull("Data on demand for 'Ordenador' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Ordenador' failed to provide an identifier", id);
        obj = Ordenador.findOrdenador(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Ordenador' with identifier '" + id + "'", Ordenador.findOrdenador(id));
    }
    
}
