<%@ page contentType="application/xml" pageEncoding="UTF-8"%><% 
%><%@ page import="java.util.*" %><% 
%><%@ page import="java.text.SimpleDateFormat" %><% 
%><%@ page import="org.opencms.file.CmsResource" %><% 
%><%@ page import="org.opencms.file.CmsObject" %><% 
%><%@ page import="org.opencms.util.CmsUUID" %><% 
%><%@ page import="org.opencms.util.CmsStringUtil" %><% 
%><%@ page import="org.opencms.main.*" %><% 
%><%@ page import="org.opencms.jsp.*" %><% 
%><%@ page import="org.opencms.file.*" %><% 
%><%@ page import="org.opencms.file.types.*" %><% 
%><%@ page import="org.opencms.xml.*" %><% 
%><%@ page import="org.opencms.xml.content.*" %><% 
%><%@ page import="org.opencms.xml.types.*" %><% 
%><%@ page import="org.opencms.lock.*" %><% 
%><%@ page import="org.opencms.db.CmsResourceState" %><% 
%><%@ page import="org.opencms.xml.content.CmsXmlContent" %><% 
%><%@ page import="org.opencms.mail.CmsSimpleMail" %><% 
%><%@ page import="java.net.*" %><% 
%><%@ page import="java.text.DateFormat" %><% 
%><%@ page import="java.text.SimpleDateFormat" %><% 
%><%@ page import="java.util.Date" %><% 
%><%@ page import="java.io.*" %><% 
%><%@ page import="javax.net.ssl.*" %><% 
%><%@ page import="javax.json.*" %><% 
%><%@ page import="javax.servlet.jsp.*" %>
%><%
// Variables
String url = "http://157.88.26.20/bibliotecas_ws/www/index.php/bhsc/search/text/" + request.getParameter("q");
// fq=type:nb-noticia&fq=parent-folders:\"/sites/divulga/\"

String USER_AGENT = "Mozilla/5.0";

try {
	// Creamos el proxy y la conexion
	/* Lo mantenemos con el proxy por si acaso que no se sabe*/
	
	InetSocketAddress proxyInet = new InetSocketAddress("proxy.uva.es",80);
	Proxy proxy = new Proxy(Proxy.Type.HTTP, proxyInet);
	URL obj = new URL(url);
	HttpURLConnection con = (HttpURLConnection) obj.openConnection(proxy);
	
	/*URL obj = new URL(url);
	HttpURLConnection con = (HttpURLConnection) obj.openConnection();*/
	
	// Añadimos el header
	con.setRequestMethod("GET");
	con.setRequestProperty("User-Agent", USER_AGENT);
	con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
	
	// Enchufamos la query
	String postParams = query;
	
	// Enviamos el post
	con.setDoOutput(true);
	//DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	//wr.writeBytes(postParams);
	//wr.flush();
	//wr.close();
	
	// Respuesta
	int responseCode = con.getResponseCode();
	
	BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
	String inputLine;
	StringBuffer respuesta = new StringBuffer();
	
	while ((inputLine = in.readLine()) != null) {
		//respuesta.append(inputLine);
		out.print(inputLine);
	}
	in.close();
	
	//JsonReader jsonReader = Json.createReader(new StringReader(respuesta.toString()));
	//JsonObject jsonObject = jsonReader.readObject();
	//jsonReader.close();
	
	// Pintamos la respuesta
	//out.print(jsonObject);
	//out.print(inputLine);
	out.flush();
	
} catch(Exception e) {
	// Ha ocurrido un error
	out.println("<h1>Ha ocurrido un error:</h1><p><strong>Atencion</strong>: Ha ocurrido un error al crear el JSON. Por favor, pruebe mas tarde</p><br/>");
	out.println(e.toString());
	e.printStackTrace();
}
%>