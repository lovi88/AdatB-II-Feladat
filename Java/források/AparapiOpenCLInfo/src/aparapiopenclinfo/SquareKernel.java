package aparapiopenclinfo;

import com.amd.aparapi.Kernel;

/**
 *
 * @author lovi88
 */
public class SquareKernel extends Kernel implements IRunInfo {

    private float in[];
    private float out[];

    public SquareKernel(float in[]) {
        this.in = in;
        out = new float[in.length];
    }

    public float[] getIn() {
        return in;
    }

    public void setIn(float[] in) {
        this.in = in;
        out = new float[in.length];
    }

    public float[] getOut() {
        return out;
    }

    @Override
    public void run() {
        int i = getGlobalId();
        out[i] = in[i] * in[i];
    }

    @Override
    public String getRunMode() {
        EXECUTION_MODE mo = this.getExecutionMode();

        switch (mo) {

            case CPU:
                return "CPU";

            case GPU:
                return "GPU";
            case JTP:
                return "JTP: Java Thread Pool";
            case NONE:
            default:
                return "Nincs információ a futásról";
        }

    }

    public String InputAsString() {
        return FloatArrayAsString(in);
    }

    public String OutputAsString() {
        return FloatArrayAsString(out);
    }

    public String FloatArrayAsString(float[] input) {

        if (input == null || input.length == 0) {
            return "";
        }

        Float first = new Float(input[0]);
        String ret = first.toString();
        for (int i = 1; i < in.length; i++) {
            Float fi = new Float(input[i]);
            ret += ", " + fi.toString();
        }

        return ret;
    }

    @Override
    public String getRunTask() {
        return "Négyzetre emelés: " + in.length + " float típusú számon";
    }

    public static String GetTestRunHTML(IRunInfo testrun) {

        String html = "";
        html += "<div>";
        html += "<h2>Aparapi kernel feladata: " + testrun.getRunTask() + "</h2>";

        html += "<p><h3>Futtató eszközről</h3>" + testrun.getRunMode() + "</p>";

        html += "</div>";

        html += String.format("%n");
        return html;
    }

}
