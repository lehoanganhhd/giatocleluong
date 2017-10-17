<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModThanhVienEntity>;
    var model = ViewBag.Model as MThanhVienModel;
    var lstJson = ViewBag.JSon;
%>

<div class="main-box">
    <p class="title-box"><%= ViewPage.CurrentPage.Name %></p>
    <div style="padding: 0 10px;">

        <div id="PhaHe"></div>
        <div class="clear-20"></div>
    </div>
</div>
<div class="clear-10"></div>

<script>
    $(function () {
        getDataPhaHe();
    });
</script>

<%--<div class="title"><%= ViewPage.CurrentPage.Name %></div>

<div class="list">
<%for(int i = 0; listItem != null && i < listItem.Count; i++)
{
string Url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);%>
    <p class="list-item-name"><a href="<%=Url %>"><%= listItem[i].Name %></a></p>
    <p class="list-item-img"><a href="<%=Url %>">
                   <%if (!string.IsNullOrEmpty(listItem[i].File))
                      { %><img src="<%= Utils.GetResizeFile(listItem[i].File, 2, 100, 100)%>" alt="<%= listItem[i].Name %>" /><%} %></a></p>
<%}%>
</div>

<div class="navigation">
  <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
</div>--%>
