<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModThanhVienModel;
    var entity = ViewBag.Data as ModThanhVienEntity;
    List<ModThanhVienEntity> list = ModThanhVienService.Instance.CreateQuery().Where(o => o.Activity == true).ToList_Cache();

    string s = string.Empty;

%>

<form id="hlForm" name="hlForm" method="post">
    <input type="hidden" id="_hl_action" name="_hl_action" />

    <div id="toolbar-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="toolbar-list" id="toolbar">
                <%= GetDefaultAddCommand()%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Thành viên dòng họ : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
            </div>
            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>
    <div class="clr"></div>

    <%= ShowMessage()%>

    <div id="element-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="col width-100">
                <table class="admintable">
                    <tr>
                        <td class="key">
                            <label>Họ tên :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Name" id="Name" value="<%=entity.Name %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Mã :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Code" id="Code" value="<%=entity.Code %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Thuộc Ngành :</label>
                        </td>
                        <td>
                            <select name="MenuID" id="MenuID" class="text_input">
                                <option value="0">Root</option>
                                <%= Utils.ShowDDLMenuByType("Nganh", model.LangID, entity.MenuID)%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Thuộc Đời :</label>
                        </td>
                        <td>
                            <select name="MenuID1" id="MenuID1" class="text_input">
                                <option value="0">Root</option>
                                <%= Utils.ShowDDLMenuByType("Doi", model.LangID, entity.MenuID1)%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Cha :</label>
                        </td>
                        <td>
                            <select name="ParentID" id="ParentID" class="text_input">
                                <option value="0">Root</option>
                                <%
                                    for (int i = 0; list != null && i < list.Count; i++)
                                    {
                                        s += "<option " + (list[i].ID == entity.ParentID ? "selected" : string.Empty) + " value=\"" + list[i].ID + "\">&nbsp; " + list[i].Name + "</option>";
                                    }
                                %>
                                <%=s %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Là con thứ mấy :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="ConThu" id="ConThu" value="<%=entity.ConThu %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Quê quán :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="QueQuan" id="QueQuan" value="<%=entity.QueQuan %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Địa chỉ :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Address" id="Address" value="<%=entity.Address %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Giới tính :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Sex" id="Sex" value="<%=entity.Sex %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Điện thoại :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Phone" id="Phone" value="<%=entity.Phone %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Email :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Email" id="Email" value="<%=entity.Email %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Link Facebook :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="LinkFB" id="LinkFB" value="<%=entity.LinkFB %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Nghề nghiệp :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Job" id="Job" value="<%=entity.Job %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Ảnh đại diện :</label>
                        </td>
                        <td>
                            <%= Utils.GetMedia(entity.File, 100, 80)%>
                            <br />
                            <input class="text_input" type="text" name="File" id="File" style="width: 80%;" value="<%=entity.File %>" maxlength="255" />
                            <input class="text_input" style="width: 17%;" type="button" onclick="ShowFileForm('File'); return false;" value="Chọn File" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Còn sống :</label>
                        </td>
                        <td>
                            <input name="ConSong" <%= entity.ConSong ? "checked" : "" %> type="radio" value='1' />
                            Còn sống
                    <input name="ConSong" <%= !entity.ConSong ? "checked" : "" %> type="radio" value='0' />
                            Đã mất
                        </td>
                    </tr>
                    <%if (CPViewPage.UserPermissions.Approve)
                        {%>
                    <tr>
                        <td class="key">
                            <label>Duyệt :</label>
                        </td>
                        <td>
                            <input name="Activity" <%= entity.Activity ? "checked" : "" %> type="radio" value='1' />
                            Có
                    <input name="Activity" <%= !entity.Activity ? "checked" : "" %> type="radio" value='0' />
                            Không
                        </td>
                    </tr>
                    <%} %>
                </table>
            </div>
            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>

</form>
