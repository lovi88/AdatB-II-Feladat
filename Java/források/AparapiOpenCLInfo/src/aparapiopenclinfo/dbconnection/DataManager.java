/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package aparapiopenclinfo.dbconnection;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

/**
 *
 * @author Oracle
 */
public class DataManager {
    public EntityManager getEntityManager(){
       return Persistence.createEntityManagerFactory("AparapiOpenCLInfoPU").createEntityManager();
    }
    
    
}
