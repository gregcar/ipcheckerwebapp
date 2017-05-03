<%@ Page Language="C#" %>
<script runat="server">
	private string GetClientIP()
	{
		string xForwardedIpList = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
		string remoteAddr = Request.ServerVariables["REMOTE_ADDR"];
		string xClusterClientIp = Request.ServerVariables["HTTP_X_CLUSTER_CLIENT_IP"];
		string result = "";
		
		result += "HTTP_X_FORWARDED_FOR IPs: ";

		if (!string.IsNullOrEmpty(xForwardedIpList))
        {
			result += xForwardedIpList;
			result += "<br/>";
            result += xForwardedIpList.Split(',')[0];
        }
		result += "<br/><br/>";
		
		result += "REMOTE_ADDR IPs: ";
		if (!string.IsNullOrEmpty(remoteAddr))
        {
            result += remoteAddr;
        }
		result += "<br/><br/>";

		result += "HTTP_X_CLUSTER_CLIENT_IP IPs: ";
		if (!string.IsNullOrEmpty(xClusterClientIp))
        {
            result += xClusterClientIp;
        }
		result += "<br/><br/>";
		
		if (string.IsNullOrEmpty(xForwardedIpList) && string.IsNullOrEmpty(remoteAddr) && string.IsNullOrEmpty(xClusterClientIp))
        {
			result += "No IPs Found";
        }
		
		return result;
	}
</script>
<html>
<head>
  <title>IP Address Checker</title>
</head>
<body>
  <form runat="server">
	Results as of <% =DateTime.Now.ToString()%> (UTC): <br/><br/>
	<% =GetClientIP()%>
  </form>
</body>
</html>