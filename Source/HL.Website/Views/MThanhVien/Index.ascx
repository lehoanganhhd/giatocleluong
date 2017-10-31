<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModThanhVienEntity>;
    var model = ViewBag.Model as MThanhVienModel;
    var lstJson = ViewBag.JSon;
%>

<style type="text/css">
    .orgchart {
        background: #fff;
    }

        .orgchart td.left, .orgchart td.right, .orgchart td.top {
            border-color: #aaa;
        }

        .orgchart td > .down {
            background-color: #aaa;
        }

        .orgchart .middle-level .title {
            background-color: #006699;
        }

        .orgchart .middle-level .content {
            border-color: #006699;
        }

        .orgchart .product-dept .title {
            background-color: #009933;
        }

        .orgchart .product-dept .content {
            border-color: #009933;
        }

        .orgchart .rd-dept .title {
            background-color: #993366;
        }

        .orgchart .rd-dept .content {
            border-color: #993366;
        }

        .orgchart .pipeline1 .title {
            background-color: #996633;
        }

        .orgchart .pipeline1 .content {
            border-color: #996633;
        }

        .orgchart .frontend1 .title {
            background-color: #cc0066;
        }

        .orgchart .frontend1 .content {
            border-color: #cc0066;
        }

        .oc-export-btn {
            background-color: #d9534f;
            border-color: #d9534f;
        }
</style>

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
