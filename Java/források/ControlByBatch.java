
public class ControlByBatch {

    public static void main(String[] args) {
        System.out.println("Jogosúltságok...");

//        SecurityManager sm = new MySecurityManager();
//        System.setSecurityManager(sm);

        System.out.println("Parancsfuttatás...");

        //startBach("controll.bat");

        
        runCMD("java -jar C:/LJava/AparapiOpenCLInfo.jar");
    }

    public static void runCMD(String command) {
        try {
            Runtime.getRuntime().exec("cmd /c " + command);
            System.out.println("Parancs lefutott");
        } catch (Exception ex) {
            System.out.println("Hiba történt a parancsfuttatás közben:" + ex.getMessage());
        }
    }

    public static void startBach(String bach) {
        try {
            Runtime.getRuntime().exec("cmd /c start " + bach);
            System.out.println("Parancs lefutott");
        } catch (Exception ex) {
            System.out.println("Hiba történt a parancsfuttatás közben:" + ex.getMessage());
        }
    }
}
//class MySecurityManager extends SecurityManager {
//
//    @Override
//    public void checkExec(String cmd) {
//    }
//}
