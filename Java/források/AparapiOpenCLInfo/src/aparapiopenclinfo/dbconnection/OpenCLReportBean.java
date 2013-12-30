/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package aparapiopenclinfo.dbconnection;

import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 *
 * @author Lovas István
 */
public class OpenCLReportBean {
    String reportID;
    
    String firstCPU;
    String firstGPU;
    String bestDevice;
    
    Calendar reportDate = new GregorianCalendar();

    public String getFirstCPU() {
        return firstCPU;
    }

    public void setFirstCPU(String firstCPU) {
        this.firstCPU = firstCPU;
    }

    public String getFirstGPU() {
        return firstGPU;
    }

    public void setFirstGPU(String firstGPU) {
        this.firstGPU = firstGPU;
    }

    public String getBestDevice() {
        return bestDevice;
    }

    public void setBestDevice(String bestDevice) {
        this.bestDevice = bestDevice;
    }

    public Calendar getReportDate() {
        return reportDate;
    }

    public void setReportDate(Calendar reportDate) {
        this.reportDate = reportDate;
    }

    public String getReportID() {
        return reportID;
    }

    
    MyOracleConnection conn = new MyOracleConnection();
    
    public OpenCLReportBean() {
        
    }

    public OpenCLReportBean(String firstCPU, String firstGPU, String bestDevice, Calendar reportDate) {
        this();
        
        this.firstCPU = firstCPU;
        this.firstGPU = firstGPU;
        this.bestDevice = bestDevice;
        this.reportDate = reportDate;
    }
    
    
}
