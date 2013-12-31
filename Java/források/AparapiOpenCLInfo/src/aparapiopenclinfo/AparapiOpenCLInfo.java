package aparapiopenclinfo;

import com.amd.aparapi.Range;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

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

        OCLFileWriter infoFileWriter = null;

        String infoFilePath = "C:\\LJava\\OCLInfo.txt";

        try {
            infoFileWriter = new OCLFileWriter(infoFilePath);
            infoFileWriter.write(getOpenCLInfo() + String.format("%n") + getTestRunString());

        } catch (IOException e) {
            System.out.println("e: " + e.getMessage());
        } finally {
            if (infoFileWriter != null) {
                try {
                    infoFileWriter.close();
                } catch (IOException ex) {
                    System.out.println("Problémás bezárás");
                    System.out.println("ex: " + ex.getMessage());
                }
            }
        }

    }

    static float[] getRandFloatArr(int size) {
        float[] ret = new float[size];

        for (int i = 0; i < size; i++) {
            ret[i] = (float) (Math.random() * 100);
        }
        return ret;
    }

    static SquareKernel getNewTestSquare(int size) {
        SquareKernel sq = new SquareKernel(getRandFloatArr(size));
        return sq;
    }

    static String getOpenCLInfo() {
        //return "<div><h2>Az Aparapi által érzékelt OpenCl eszközök</h2><p>Legjobb eszköz: <br />Device 5233328 type:GPU maxComputeUnits=14 maxWorkItemDimensions=3 maxWorkItemSizes={256, 256, 256}   maxWorkWorkGroupSize=256  globalMemSize=2147483648  localMemSize=32768</p><p>Elsődleges CPU: <br />Device 227840384  type:CPU  maxComputeUnits=6  maxWorkItemDimensions=3  maxWorkItemSizes={1024, 1024, 1024}  maxWorkWorkGroupSize=1024  globalMemSize=8586293248  localMemSize=32768</p><p>Elsődleges GPU: <br />Device 5233328  type:GPU  maxComputeUnits=14  maxWorkItemDimensions=3  maxWorkItemSizes={256, 256, 256}  maxWorkWorkGroupSize=256  globalMemSize=2147483648  localMemSize=32768</p><p></p></div>";

        OpenCLInfoProvicer openCLInfoProvicer = new OpenCLInfoProvicer();

        String ret = openCLInfoProvicer.getCPUArchHTML() + " ";
        ret += openCLInfoProvicer.getDevicesHTML() + " ";

        return ret;
    }

    static String getTestRunString() {

        int size = 200;
        SquareKernel sq = getNewTestSquare(size);
        sq.execute(size);

        String ret = SquareKernel.GetTestRunHTML(sq);

        ret += "<h3>Futási idő</h3>";
        ret += "<strong>Konvertálási idő (Java byte kód -> OpenCl kód): </strong>"+sq.getConversionTime()+"<br />";
        ret += "<strong>Futási idő: </strong>"+sq.getExecutionTime()+"<br />";
        ret += "<strong>Összidő: </strong>"+sq.getAccumulatedExecutionTime()+"<br />";
        
        ret += String.format("%n");
        
        ret += "<h3>A generált bemenet</h3>" + sq.InputAsString() + "<br />" + String.format("%n");
        ret += "<h3>A kiszámított kimenet</h3>" + sq.OutputAsString() + "<br />" + String.format("%n");

        return ret;
    }

}
