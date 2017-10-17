<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var item = ViewBag.Data as ModNewsEntity;
    string title = ViewBag.Title;
%>

<div class="main-box">
    <p class="title-box"><%= title %></p>
    <div style="padding: 0 10px;">
        <%=item.Summary %>
        <div class="clear-10"></div>
        <%=item.Content%>
        <div class="clear-20"></div>
    </div>
</div>
<div class="clear-10"></div>
