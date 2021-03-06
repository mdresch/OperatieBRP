// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package nl.bzk.brp.model.data.autaut;

import java.math.BigDecimal;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import nl.bzk.brp.model.data.autaut.Srtautorisatiebesluit;
import nl.bzk.brp.model.data.autaut.SrtautorisatiebesluitDataOnDemand;
import org.springframework.stereotype.Component;

privileged aspect SrtautorisatiebesluitDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SrtautorisatiebesluitDataOnDemand: @Component;
    
    private Random SrtautorisatiebesluitDataOnDemand.rnd = new SecureRandom();
    
    private List<Srtautorisatiebesluit> SrtautorisatiebesluitDataOnDemand.data;
    
    public Srtautorisatiebesluit SrtautorisatiebesluitDataOnDemand.getNewTransientSrtautorisatiebesluit(int index) {
        Srtautorisatiebesluit obj = new Srtautorisatiebesluit();
        setDataanvgel(obj, index);
        setDateindegel(obj, index);
        setNaam(obj, index);
        setOms(obj, index);
        return obj;
    }
    
    public void SrtautorisatiebesluitDataOnDemand.setDataanvgel(Srtautorisatiebesluit obj, int index) {
        BigDecimal dataanvgel = BigDecimal.valueOf(index);
        obj.setDataanvgel(dataanvgel);
    }
    
    public void SrtautorisatiebesluitDataOnDemand.setDateindegel(Srtautorisatiebesluit obj, int index) {
        BigDecimal dateindegel = BigDecimal.valueOf(index);
        obj.setDateindegel(dateindegel);
    }
    
    public void SrtautorisatiebesluitDataOnDemand.setNaam(Srtautorisatiebesluit obj, int index) {
        String naam = "naam_" + index;
        if (naam.length() > 40) {
            naam = new Random().nextInt(10) + naam.substring(1, 40);
        }
        obj.setNaam(naam);
    }
    
    public void SrtautorisatiebesluitDataOnDemand.setOms(Srtautorisatiebesluit obj, int index) {
        String oms = "oms_" + index;
        if (oms.length() > 250) {
            oms = new Random().nextInt(10) + oms.substring(1, 250);
        }
        obj.setOms(oms);
    }
    
    public Srtautorisatiebesluit SrtautorisatiebesluitDataOnDemand.getSpecificSrtautorisatiebesluit(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Srtautorisatiebesluit obj = data.get(index);
        Short id = obj.getId();
        return Srtautorisatiebesluit.findSrtautorisatiebesluit(id);
    }
    
    public Srtautorisatiebesluit SrtautorisatiebesluitDataOnDemand.getRandomSrtautorisatiebesluit() {
        init();
        Srtautorisatiebesluit obj = data.get(rnd.nextInt(data.size()));
        Short id = obj.getId();
        return Srtautorisatiebesluit.findSrtautorisatiebesluit(id);
    }
    
    public boolean SrtautorisatiebesluitDataOnDemand.modifySrtautorisatiebesluit(Srtautorisatiebesluit obj) {
        return false;
    }
    
    public void SrtautorisatiebesluitDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Srtautorisatiebesluit.findSrtautorisatiebesluitEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Srtautorisatiebesluit' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Srtautorisatiebesluit>();
        for (int i = 0; i < 10; i++) {
            Srtautorisatiebesluit obj = getNewTransientSrtautorisatiebesluit(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
