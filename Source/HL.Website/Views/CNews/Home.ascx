<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    int c = listItem != null ? listItem.Count : 0;
%>

<div class="main-box">
    <p class="title-box"><%=ViewBag.Title%></p>
    <div style="padding: 0 10px;">
        <%for (int i = 0; i < c; i++)
            {
                string url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
        %>
        <div class="row">
            <div class="col-xs-12">
                <h5><a href="<%=url %>" title="<%=listItem[i].Name %>" class="news-title"><%=listItem[i].Name %></a><span class="news-created"> - <%=string.Format("{0:dd/MM/yyyy}", listItem[i].Published) %></span></h5>
            </div>
            <div class="col-xs-4">
                <%if (!string.IsNullOrEmpty(listItem[i].File))
                    {%>
                <a href="<%=url %>" title="<%=listItem[i].Name %>">
                    <img src="<%=listItem[i].File.Replace("~/", "/") %>" alt="<%=listItem[i].Name %>" style="max-width: 160px;"></a>
                <%} %>
            </div>
            <div class="col-xs-8" style="padding-left: 0;">
                <%=listItem[i].Summary %>
                <a href="<%=url %>" title="<%=listItem[i].Name %>" class="link-xemchitiet"><span>>> Xem chi tiết</span></a>
            </div>
        </div>
        <div class="news-line"></div>
        <%} %>
        <div class="clear-20"></div>
    </div>
</div>
<div class="clear-10"></div>
