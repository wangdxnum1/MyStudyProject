import sun.jvmstat.perfdata.monitor.PerfStringVariableMonitor;

import java.net.InetAddress;

/**
 * Created by Hakim on 16/10/8.
 */
public class Main {
    public static void main(String[] args) throws  Exception{
        InetAddress ip = InetAddress.getByName("www.baidu.com");
        System.out.println(ip.getHostAddress());
        System.out.println("地址是否可达 " + ip.isReachable(2000));

        InetAddress local = InetAddress.getByAddress(new byte[]{127,0,0,1});
        System.out.println("地址是否可达 " + local.isReachable(2000));
    }
}
