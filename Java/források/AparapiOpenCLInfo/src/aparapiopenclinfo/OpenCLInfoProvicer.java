package aparapiopenclinfo;

/**
 *
 * @author lovi88
 */
public class OpenCLInfoProvicer {

    String CPUArchitecture = System.getProperty("sun.arch.data.model");
    DeviceInfo di = new DeviceInfo();

    public String getCPUArchitecture() {
        return CPUArchitecture;
    }

    public OpenCLInfoProvicer() {

    }

    public String getOpenCLInfo() {

        return null;
    }

    public String getCPUArchHTML() {

        String html = "";
        html += "<div>";
        html += "<h2>A Java futtató környezet által észlelt processzor architektúra (adatszélesség bit)</h2>";

        html += "<p>" + getCPUArchitecture() + "</p>";

        html += "</div>";

        html += String.format("%n");
        return html;
    }

    public String getDevicesHTML() {

        String html = "";
        html += "<div>";
        html += "<h2>Az Aparapi által érzékelt OpenCl eszközök</h2>";

        html += "<p>Legjobb eszköz: <br />" + di.getBestDevice() + "</p>";
        html += "<p>Elsődleges CPU: <br />" + di.getFirstCPU() + "</p>";
        html += "<p>Elsődleges GPU: <br />" + di.getFirstGPU() + "</p>";
        html += "</div>";

        html += String.format("%n");
        return html;
    }
    
    
}
