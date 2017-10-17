<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModThanhVienEntity;
    var listOther = ViewBag.Other as List<ModThanhVienEntity>;
%>

<div class="title"><%= ViewPage.CurrentPage.Name %></div>

<div class="item">
    <p class="item-id">ID : <%= item.ID %></p>
    <p class="item-name">Tên : <%= item.Name %></p>
    <p class="item-code">Mã : <%= item.Code %></p>
    <p class="item-parentid">Cha : <%= item.getParent().Name %></p>
    <p class="item-menuid">Chuyên mục : <%= item.getMenu().Name %></p>
    <p class="item-menuid1">Menu i d1 : <%= string.Format("{0:#,##0}", item.MenuID1) %></p>
    <p class="item-quequan">Que quan : <%= item.QueQuan %></p>
    <p class="item-address">Địa chỉ : <%= item.Address %></p>
    <p class="item-sex">Giới tình : <%= string.Format("{0:#,##0}", item.Sex) %></p>
    <p class="item-phone">Điện thoại : <%= item.Phone %></p>
    <p class="item-email">Email : <%= item.Email %></p>
    <p class="item-linkfb">Link f b : <%= item.LinkFB %></p>
    <p class="item-job">Job : <%= item.Job %></p>
    <p class="item-file">Ảnh : <%= item.File %></p>
    <p class="item-damat">Da mat : <%= item.DaMat ? "Có" : "Không" %></p>
    <p class="item-activity">Duyệt : <%= item.Activity ? "Có" : "Không" %></p>
</div>

<div class="list-other">
<%for(int i = 0; listOther != null && i < listOther.Count; i++)
{
string Url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code);%>
    <p class="list-other-name"><a href="<%=Url %>"><%= listOther[i].Name %></a></p>
    <p class="list-other-img"><a href="<%=Url %>">
                    <%if (!string.IsNullOrEmpty(listOther[i].File))
                      { %><img src="<%= Utils.GetResizeFile(listOther[i].File, 2, 100, 100)%>" alt="<%= listOther[i].Name %>" /><%} %></a></p>
<%}%>
</div>
