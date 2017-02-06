import ip.IPSeeker;

public class IpUtil {

	public static String getIpAddress(String ip) {
		try{
			return IPSeeker.getInstance().getAddress(ip);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "未知IP";
	}

}
