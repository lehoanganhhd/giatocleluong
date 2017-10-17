<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<div class="main-box">
    <p class="title-box">Tìm kiếm</p>
    <div style="padding: 0 10px;">
        <input type="text" class="form-control" placeholder="Tìm kiếm..." />
        <br />
        <label class="custom-control custom-radio">
            <input id="radio1" name="radio" type="radio" class="custom-control-input">
            <span class="custom-control-indicator"></span>
            <span class="custom-control-description">Tìm theo tên</span>
        </label>
        <br />
        <label class="custom-control custom-radio">
            <input id="radio2" name="radio" type="radio" class="custom-control-input">
            <span class="custom-control-indicator"></span>
            <span class="custom-control-description">Tìm theo tuổi</span>
        </label>
        <br />
        <label class="custom-control custom-radio">
            <input id="radio3" name="radio" type="radio" class="custom-control-input">
            <span class="custom-control-indicator"></span>
            <span class="custom-control-description">Đời thứ...</span>
        </label>
        <br />
        <button type="button" class="btn btn-danger" style="display: block; margin: 0 auto;">Tìm kiếm</button>
        <div class="clear-20"></div>
    </div>
</div>
<div class="clear-10"></div>
