/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.howtodoinjava.dao;

import com.howtodoinjava.entity.Predicado;
import com.howtodoinjava.entity.PredicadoId;
import java.util.List;
/**
 *
 * @author miguel
 */
public interface PredicadoDAO {
    
    public void addPredicado(Predicado predicado);
    
    public void deletePredicado(PredicadoId id);
    
    public void updatePredicado(Predicado pre);
    
    public Predicado getPredicado(PredicadoId id);
    
    public Predicado getPredicado(String username, String comb);
    
    public List<Predicado> getAllPredicadosByUser(String userLogin);
    
}
