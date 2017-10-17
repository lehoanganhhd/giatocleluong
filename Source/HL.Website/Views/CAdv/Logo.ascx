<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<ModAdvEntity>;
    int c = listItem != null ? listItem.Count : 0;
%>

<%if (c > 0)
    {
        var item = listItem[0];
%>
<img src="<%=item.File.Replace("~/", "/") %>" alt="<%=item.Name %>" />
<%} %>
