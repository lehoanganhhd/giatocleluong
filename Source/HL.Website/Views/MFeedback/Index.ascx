<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModFeedbackEntity;
    if (item == null)
        item = new ModFeedbackEntity();

    var detail = ViewBag.Detail as ModNewsEntity;
    if (detail == null) { detail = new ModNewsEntity(); }
%>

<link href="/Content/css/w3.css" rel="stylesheet" />
<link href="/Content/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<link href="/Content/css/message.css" rel="stylesheet" />

<style>
    body, h1, h2, h3, h4, h5, h6 {
        font-family: "Raleway", sans-serif
    }

    body, html {
        height: 100%;
        line-height: 1.8;
    }
    /* Full height image header */
    .bgimg-1 {
        background-position: center;
        background-size: cover;
        background-color: #489FDF;
        min-height: 100%;
    }

    .w3-bar .w3-button {
        padding: 16px;
        color: #fff;
    }

    .inValidInput {
        border: 1px solid red !important;
    }
</style>

<script src="/Content/js/JavaScript.js"></script>
<script src="/Content/js/message.js"></script>
<script src="/Content/js/AjaxRequest.js"></script>
<script src="/Content/js/Function.js"></script>
<div class="main-box">
    <p class="title-box"><%=ViewPage.CurrentPage.Name%></p>
    <div style="padding: 0 10px;">

        <div class="w3-container w3-light-grey" id="contact">
            <div class="w3-center w3-large"><%=detail.Content %></div>
            <div class="w3-row-padding" style="margin-top: 15px">
                <div class="alert warning" id="alert" style="display: none;">
                    <span class="closebtn" id="closeAlert">&times;</span>
                    <span id="lblWarning"></span>
                </div>
                <p>
                    <input class="w3-input w3-border" type="text" placeholder="{RS:Web_FB_Name}" id="Name">
                </p>
                <p>
                    <input class="w3-input w3-border" type="text" placeholder="{RS:Web_FB_Email}" id="Email">
                </p>
                <p>
                    <input class="w3-input w3-border" type="text" placeholder="{RS:Web_FB_Phone}" id="Phone">
                </p>
                <p>
                    <input class="w3-input w3-border" type="text" placeholder="{RS:Web_FB_Title}" id="Title">
                </p>
                <p>
                    <textarea class="w3-input w3-border" rows="3" placeholder="{RS:Web_FB_Content}" id="Content" style="min-width: 100%; max-width: 100%; max-height: 300px; min-height: 50px;"></textarea>
                </p>
                <p>
                    <button class="w3-button w3-black" type="button" id="btnGuiLienHe">
                        <i class="fa fa-paper-plane"></i>&nbsp;{RS:Web_FB_Submit}
                    </button>
                </p>
                <!-- Add Google Maps -->
                <%--<div id="googleMap" class="w3-greyscale-max" style="width: 100%; height: 510px;"></div>--%>
            </div>
        </div>
    </div>
</div>
<div class="clear-10"></div>

<!-- The actual snackbar -->
<div id="snackbar">Tin nhắn thông báo..</div>
<p class="loading" id="loading" style="display: none;">
    <i class="fa fa-spinner fa-spin"></i><span id="lblLoad">&nbsp;Đang tải...</span>
</p>

<%--<p class="link">
   <a href="/"><span>{RS:Web_HOME}</span></a><span>></span> 
   <%= Utils.GetMapPage(ViewPage.CurrentPage, "<span>></span>")%>
</p>

<p class="clear_20"></p>

<div id="details">
    <%if (detail != null)
      { %> <%=detail.Content%> <%} %>
</div>

<form method="post">

<div id="contact">
    <p class="row">
        <span>{RS:Web_FB_Title} (*)</span>
        <input type="text" name="Title" value="<%=item.Title %>" class="text-input" />
    </p>
    <p class="row" style="height: 100px;">
        <span>{RS:Web_FB_Content} (*)</span>
        <textarea class="text-area" name="Content" rows="" cols=""><%=item.Content %></textarea>
    </p>
    <p class="row">
        <span>{RS:Web_FB_Name} (*)</span>
        <input type="text" name="Name" value="<%=item.Name %>" class="text-input" />
    </p>
    <p class="row">
        <span>{RS:Web_FB_Phone} (*)</span>
        <input type="text" name="Phone" value="<%=item.Phone %>" class="text-input" />
    </p>
    <p class="row">
        <span>{RS:Web_FB_Email}</span>
        <input type="text" name="Email" value="<%=item.Email %>" class="text-input" />
    </p>
    <input name="_hl_action[AddPOST]" type="submit" value="{RS:Web_FB_Submit}" class="contact-button" />
</div>

</form>--%>

