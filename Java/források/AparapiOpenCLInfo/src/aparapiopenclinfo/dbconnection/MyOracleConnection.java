package aparapiopenclinfo.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lovas István
 */
public class MyOracleConnection {

    String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
    String host = "localhost";
    String port = "1521";
    String SID = "orcl";
    String user = "sema1";
    String password = "sema1";
    String JDBC_STRING = "jdbc:oracle:thin:@" + host + ":" + port + ":" + SID;
    Connection conn = null;
    Statement stmt = null;

    public MyOracleConnection() {
        try {

            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(JDBC_STRING, user, password);
            stmt = conn.createStatement();

            String query = "SELECT * FROM TABLE TBL";

        } catch (SQLException | ClassNotFoundException ex) {
        } finally {
        }
    }

    public void execute(String sql) throws SQLException {
        stmt.execute(sql);
    }
    
    public ResultSet query(String sql) throws SQLException{
        ResultSet executeQuery = stmt.executeQuery(sql);
        return executeQuery;
    }

    public void close() {
        try {
            if (conn != null) {
                conn.close();
            }
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException e) {
        }
    }

//rs = stmt.executeQuery (query);
    public String getJDBC_DRIVER() {
        return JDBC_DRIVER;
    }

    public void setJDBC_DRIVER(String JDBC_DRIVER) {
        this.JDBC_DRIVER = JDBC_DRIVER;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getSID() {
        return SID;
    }

    public void setSID(String SID) {
        this.SID = SID;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getJDBC_STRING() {
        return JDBC_STRING;
    }

    public void setJDBC_STRING(String JDBC_STRING) {
        this.JDBC_STRING = JDBC_STRING;
    }
}
