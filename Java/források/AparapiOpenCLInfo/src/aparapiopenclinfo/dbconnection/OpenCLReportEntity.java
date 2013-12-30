/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package aparapiopenclinfo.dbconnection;

import java.io.Serializable;
import java.util.Calendar;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author Oracle
 */
@Entity
@Table(name="OpenCLReports")
public class OpenCLReportEntity implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) id;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OpenCLReportEntity)) {
            return false;
        }
        OpenCLReportEntity other = (OpenCLReportEntity) object;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "aparapiopenclinfo.OpenCLReportEntity[ id=" + id + " ]";
    }
    
    String firstCPU;
    String firstGPU;
    String bestDevice;
    
    @Temporal(javax.persistence.TemporalType.DATE)
    Calendar reportDate;

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
    
    
}
