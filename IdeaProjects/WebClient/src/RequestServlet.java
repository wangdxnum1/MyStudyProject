import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RequestServlet")
public class RequestServlet extends HttpServlet {

	private static final long serialVersionUID = -7936817351382556277L;

	/**
	 * @param accept
	 * @return �ͻ�����������ܵ��ļ�����
	 */
	private String getAccept(String accept){
		StringBuffer buffer = new StringBuffer();
		if(accept.contains("image/gif"))	buffer.append("GIF �ļ�, ");
		if(accept.contains("image/x-xbitmap"))	buffer.append("BMP �ļ�, ");
		if(accept.contains("image/jpeg"))	buffer.append("JPG �ļ�, ");
		if(accept.contains("application/vnd.ms-excel"))	buffer.append("Excel �ļ�, ");
		if(accept.contains("application/vnd.ms-powerpoint"))	buffer.append("PPT �ļ�, ");
		if(accept.contains("application/msword"))	buffer.append("Word �ļ�, ");
		return buffer.toString().replaceAll(", $", "");
	}
	/**
	 * @param locale
	 * @return ���Ի�������
	 */
	private String getLocale(Locale locale) {
		if(Locale.SIMPLIFIED_CHINESE.equals(locale))	return "��������";
		if(Locale.TRADITIONAL_CHINESE.equals(locale))	return "��������";
		if(Locale.ENGLISH.equals(locale))				return "Ӣ��";
		if(Locale.JAPANESE.equals(locale))				return "����";
		return "δ֪���Ի���";
	}
	/**
	 * @param ip IP��ַ
	 * @return IP��ַ��Ӧ������λ��
	 */
	private String getAddress(String ip){
		return IpUtil.getIpAddress(ip);
	}
	
	/**
	 * @param userAgent
	 * @return �ͻ����������Ϣ
	 */
	private String getNavigator(String userAgent) {
		if(userAgent.indexOf("TencentTraveler") > 0)	return "��Ѷ�����";
		if(userAgent.indexOf("Maxthon") > 0)	return "Maxthon�����";
		if(userAgent.indexOf("MyIE2") > 0)	return "MyIE2�����";
		if(userAgent.indexOf("Firefox") > 0)	return "Firefox�����";
		if(userAgent.indexOf("MSIE") > 0)	return "IE �����";
		return "δ֪�����";
	}

	/**
	 * @param userAgent
	 * @return �ͻ��˲���ϵͳ
	 */
	private String getOS(String userAgent) {
		if(userAgent.indexOf("Windows NT 5.1") > 0)	return "Windows XP";
		if(userAgent.indexOf("Windows 98") > 0)	return "Windows 98";
		if(userAgent.indexOf("Windows NT 5.0") > 0)	return "Windows 2000";
		if(userAgent.indexOf("Linux") > 0)	return "Linux";
		if(userAgent.indexOf("Unix") > 0)	return "Unix";
		return "δ֪";
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		response.setContentType("text/html");
		
		String authType = request.getAuthType();
		String localAddr = request.getLocalAddr();
		Locale locale = request.getLocale();
		String localName = request.getLocalName();
		String contextPath = request.getContextPath();
		int localPort = request.getLocalPort();
		String method = request.getMethod();
		String pathInfo = request.getPathInfo();
		String pathTranslated = request.getPathTranslated();
		String protocol = request.getProtocol();
		String queryString = request.getQueryString();
		String remoteAddr = request.getRemoteAddr();
		int port = request.getRemotePort();
		String remoteUser = request.getRemoteUser();
		String requestedSessionId = request.getRequestedSessionId();
		String requestURI = request.getRequestURI();
		StringBuffer requestURL = request.getRequestURL();
		String scheme = request.getScheme();
		String serverName = request.getServerName();
		int serverPort = request.getServerPort();
		String servletPath = request.getServletPath();
		Principal userPrincipal = request.getUserPrincipal();
		
		String accept = request.getHeader("accept");
		String referer = request.getHeader("referer");
		String userAgent = request.getHeader("user-agent");
		
		String serverInfo = this.getServletContext().getServerInfo();
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		
		// ����<title></title>֮�����Ϣ�����������ʾΪ����
		out.println("  <HEAD><TITLE>Request Servlet</TITLE></HEAD>");
		out.println("  <style>body, font, td, div {font-size:12px; line-height:18px; }</style>");
		out.println("  <BODY>");
		
		out.println("<b>����IPΪ</b> " + remoteAddr + "<b>��λ��</b> " + getAddress(remoteAddr) + "<b>����ʹ��</b> " + getOS(userAgent) + " <b>����ϵͳ</b>��" + getNavigator(userAgent) + " <b>����ʹ��</b> " + getLocale(locale) + "��<br/>");
		out.println("<b>������IPΪ</b> " + localAddr + "<b>��λ��</b> " + getAddress(localAddr) + "<b>��������ʹ��</b> " + serverPort + " <b>�˿ڣ����������ʹ����</b> " + port + " <b>�˿ڷ��ʱ���ҳ��</b><br/>");
		out.println("<b>���������Ϊ</b>��" + serverInfo + "��<b>����������Ϊ</b> " + localName + "��<br/>");
		out.println("<b>�������������</b> " + getAccept(accept) + "��<br/>");
		out.println("<b>����</b> " + referer + " <b>���ʵ���ҳ�档</b><br/>");
		out.println("<b>ʹ�õ�Э��Ϊ</b> " + protocol + "��<b>URLЭ��ͷ</b> " + scheme + "��<b>����������</b> " + serverName + "��<b>�����ʵ�URIΪ</b> " + requestURI + "��<br/>" );
		out.println("<b>�� Servlet ·��Ϊ</b> " + servletPath + "��<b>�� Servlet ����Ϊ</b> " + this.getClass().getName() + "��<br/>");
		out.println("<b>��Ӧ�ó�����Ӳ�̵ĸ�Ŀ¼Ϊ</b> " + this.getServletContext().getRealPath("") + "��<b>�������·��Ϊ</b> " + contextPath + "�� <br/>");
		
		out.println("<br/>");
				
		out.println("<br/><br/><a href=" + requestURI + "> ���ˢ�±�ҳ�� </a>");
		
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
