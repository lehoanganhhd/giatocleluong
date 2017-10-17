<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModNewsEntity;
%>

<div class="main-box">
    <p class="title-box"><%= ViewPage.CurrentPage.Name %></p>
    <div style="padding: 0 10px;">
        <%=item.Summary %>
        <div class="clear-10"></div>
        <%=item.Content%>
        <div class="clear-20"></div>
    </div>
</div>
<div class="clear-10"></div>

<%--<p class="link">
   <a href="/"><span>{RS:Web_HOME}</span></a><span>></span> 
   <%= Utils.GetMapPage(ViewPage.CurrentPage, "<span>></span>")%>
</p>
<div id="details">
    <%if(item != null){ %> 
    
      <%=item.Content%> 
       
       <p> Tags : 
       <% if (!string.IsNullOrEmpty(item.Tags))
       {
           string[] ArrTag = item.Tags.Split(',');%>
            <%for (int i = 0; i < ArrTag.Length; i++)
            {
                ArrTag[i] = ArrTag[i].Trim();%>
                <%if (i > 0)
                { %> , <%} %>
                <a href="<%= ViewPage.GetURL("Tag", Data.GetCode(ArrTag[i])) %>" title="<%= ArrTag[i] %>"><%= ArrTag[i]%></a>
            <%} %>
       <%} %>
    </p>

    <%} %>
</div>
<p class="clear_20"></p>--%>