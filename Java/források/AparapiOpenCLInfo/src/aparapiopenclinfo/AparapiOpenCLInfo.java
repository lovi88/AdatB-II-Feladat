package aparapiopenclinfo;

//import java.io.File;
import aparapiopenclinfo.dbconnection.DataManager;
import java.sql.SQLException;
import javax.persistence.EntityManager;
import oracle.jdbc.pool.OracleConnectionPoolDataSource;
import oracle.jdbc.pool.OracleDataSource;

//import java.io.IOException;
/**
 *
 * @author Lovas István
 */
public class AparapiOpenCLInfo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
//        File f = new File("alma.txt");
//        try {
//            f.createNewFile();
//        } catch (IOException ex) {
//            System.out.println("filelétrehozási probléma");
//        }
//        DataManager dm = new DataManager();
//        EntityManager em = dm.getEntityManager();
//        
    }

    static void MyConnection() throws SQLException {

        String user;
        String password;
        String database;

        OracleDataSource ods = new OracleDataSource();
        
        ods.setURL("jdbc:oracle:");
    }
}
