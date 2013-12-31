package aparapiopenclinfo;

import java.io.Closeable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;

/**
 *
 * @author lovi88
 */
public class OCLFileWriter implements Closeable {

    Charset ASCII_HU = Charset.forName("ISO-8859-2");

    OutputStream os = null;
    OutputStreamWriter ow = null;

    public OCLFileWriter(String path) throws IOException {
        File f = new File(path);

        if (!f.exists()) {
            f.createNewFile();
        }

        os = new FileOutputStream(f);
        ow = new OutputStreamWriter(os, ASCII_HU);
    }

    public void append(String str) throws IOException {
        ow.append(str);
    }

    public void write(String str) throws IOException {
        ow.write(str);
    }

    @Override
    public void close() throws IOException {
        if (ow != null) {
            ow.close();
        }

        if (os != null) {
            os.close();
        }
    }

}
