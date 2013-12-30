package aparapiopenclinfo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.sql.SQLException;


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

        File f = new File("C:\\LJava\\OCLInfo.txt");
        
        Charset ASCII_HU = Charset.forName("ISO-8859-2");
        
        OutputStream os = null;
        OutputStreamWriter ow = null;
        try {
            if (!f.exists()) {
                f.createNewFile();
            }

            os = new FileOutputStream(f);
            ow = new OutputStreamWriter(os, ASCII_HU);

            ow.write(getOpenCLInfo());

        } catch (Exception e) {
        } finally {
            try {
                if (ow != null) {
                    ow.close();
                }

                if (os != null) {
                    os.close();
                }

            } catch (IOException ex) {
            }
        }

    }

    static String getOpenCLInfo() {
        return "<div><h2>Az Aparapi által érzékelt OpenCl eszközök</h2><p>Legjobb eszköz: <br />Device 5233328 type:GPU maxComputeUnits=14 maxWorkItemDimensions=3 maxWorkItemSizes={256, 256, 256}   maxWorkWorkGroupSize=256  globalMemSize=2147483648  localMemSize=32768</p><p>Elsődleges CPU: <br />Device 227840384  type:CPU  maxComputeUnits=6  maxWorkItemDimensions=3  maxWorkItemSizes={1024, 1024, 1024}  maxWorkWorkGroupSize=1024  globalMemSize=8586293248  localMemSize=32768</p><p>Elsődleges GPU: <br />Device 5233328  type:GPU  maxComputeUnits=14  maxWorkItemDimensions=3  maxWorkItemSizes={256, 256, 256}  maxWorkWorkGroupSize=256  globalMemSize=2147483648  localMemSize=32768</p></div>";
    }
}
