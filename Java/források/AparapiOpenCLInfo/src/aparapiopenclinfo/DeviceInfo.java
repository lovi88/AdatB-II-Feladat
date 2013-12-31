package aparapiopenclinfo;

import com.amd.aparapi.Device;

/**
 *
 * @author lovi88
 */
public class DeviceInfo {

    Device bestDevice;
    Device firstCPU;
    Device firstGPU;

    public DeviceInfo() {
        bestDevice = Device.best();
        firstCPU = Device.firstCPU();
        firstGPU = Device.firstGPU();

    }

    public DeviceInfo(Device bestDevice, Device firstCPU, Device firstGPU) {
        this.bestDevice = bestDevice;
        this.firstCPU = firstCPU;
        this.firstGPU = firstGPU;
    }

    public Device getBestDevice() {
        return bestDevice;
    }

    public Device getFirstCPU() {
        return firstCPU;
    }

    public Device getFirstGPU() {
        return firstGPU;
    }

}
