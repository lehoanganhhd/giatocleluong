<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModThanhVienModel;
    var listEntity = ViewBag.Data as List<ModThanhVienEntity>;
    List<ModThanhVienEntity> list = ModThanhVienService.Instance.CreateQuery().Where(o => o.Activity == true).ToList_Cache();

    string s = string.Empty;

%>

<form id="hlForm" name="hlForm" method="post">

    <input type="hidden" id="_hl_action" name="_hl_action" />
    <input type="hidden" id="boxchecked" name="boxchecked" value="0" />

    <div id="toolbar-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="toolbar-list" id="toolbar">
                <%=GetDefaultListCommand()%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Thành viên dòng họ</h2>
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

    <script type="text/javascript">

        var HLController = 'ModThanhVien';

        var HLArrVar = [
            'filter_menu', 'MenuID',
            'filter_menu1', 'MenuID1',
            'filter_parent', 'ParentID',
            'filter_lang', 'LangID',
            'limit', 'PageSize'
        ];


        var HLArrVar_QS = [
            'filter_search', 'SearchText'
        ];

        var HLArrQT = [
                      '<%= model.PageIndex + 1 %>', 'PageIndex', 
                      '<%= model.Sort %>', 'Sort'
        ];

        var HLArrDefault =
            [
                '1', 'PageIndex',
                '1', 'LangID',
                '20', 'PageSize'
            ];
    </script>

    <%= ShowMessage()%>

    <div id="element-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">

            <table>
                <tr>
                    <td width="100%">Lọc:
                        <input type="text" id="filter_search" value="<%= model.SearchText %>" class="text_area" onchange="HLRedirect();return false;" />
                        <button onclick="HLRedirect();return false;">Tìm kiếm</button>
                    </td>
                    <td nowrap="nowrap">Ngành : 
                        <select id="filter_menu" onchange="HLRedirect()" class="inputbox" size="1">
                            <option value="0">(Tất cả)</option>
                            <%= Utils.ShowDDLMenuByType("Nganh", model.LangID, model.MenuID)%>
                        </select>
                    </td>
                    <td nowrap="nowrap">Đời : 
                        <select id="filter_menu1" onchange="HLRedirect()" class="inputbox" size="1">
                            <option value="0">(Tất cả)</option>
                            <%= Utils.ShowDDLMenuByType("Doi", model.LangID, model.MenuID1)%>
                        </select>
                    </td>
                    <td nowrap="nowrap">Cha : 
                        <select id="filter_parent" onchange="HLRedirect()" class="inputbox" size="1">
                            <option value="0">(Tất cả)</option>
                            <%
                                for (int i = 0; list != null && i < list.Count; i++)
                                {
                                    s += "<option " + (list[i].ID == model.ParentID ? "selected" : string.Empty) + " value=\"" + list[i].ID + "\">&nbsp; " + list[i].Name + "</option>";
                                }
                            %>
                            <%=s %>
                        </select>
                        Ngôn ngữ :<%= ShowDDLLang(model.LangID)%>
                    </td>
                </tr>
            </table>

            <table class="adminlist" cellspacing="1">
                <thead>
                    <tr>
                        <th width="1%">#
                        </th>
                        <th width="1%">
                            <input type="checkbox" name="toggle" value="" onclick="checkAll(<%= model.PageSize %>);" />
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("ID", "ID")%>
                        </th>
                        <th class="title">
                            <%= GetSortLink("Tên", "Name")%>
                        </th>
                        <th>
                            <%= GetSortLink("Cha", "ParentID")%>
                        </th>
                        <th width="10%" nowrap="nowrap">
                            <%= GetSortLink("Ngành", "MenuID")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Đời", "MenuID1")%>
                        </th>
                        <th width="10%" nowrap="nowrap">
                            <%= GetSortLink("Quê quán", "QueQuan")%>
                        </th>
                        <th width="10%" nowrap="nowrap">
                            <%= GetSortLink("Địa chỉ", "Address")%>
                        </th>
                        <th style="width: 40px" nowrap="nowrap">
                            <%= GetSortLink("Ảnh", "File")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Còn sống", "ConSong")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Duyệt", "Activity")%>
                        </th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td colspan="15">
                            <del class="container">
                                <%= GetPagination(model.PageIndex, model.PageSize, model.TotalRecord)%>
                            </del>
                        </td>
                    </tr>
                </tfoot>
                <tbody>
                    <%for (int i = 0; listEntity != null && i < listEntity.Count; i++)
                        { %>
                    <tr class="row<%= i%2 %>">
                        <td align="center">
                            <%= i + 1%>
                        </td>
                        <td align="center">
                            <%= GetCheckbox(listEntity[i].ID, i)%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ID%>
                        </td>
                        <td>
                            <a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].Name%></a>
                            <span style="font-style: italic; display: block;">(<%= listEntity[i].Code%>)</span>
                        </td>
                        <td align="center">
                            <%= GetName(listEntity[i].getParent()) %>
                        </td>
                        <td align="center">
                            <%= GetName(listEntity[i].getMenu()) %>
                        </td>
                        <td align="center">
                            <%= GetName(listEntity[i].getMenu1()) %>
                        </td>
                        <td align="center">
                            <%= listEntity[i].QueQuan%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Address%>
                        </td>
                        <td align="center">
                            <%if (!string.IsNullOrEmpty(listEntity[i].File))
                                {%>
                            <%= Utils.GetMedia(listEntity[i].File, 40, 40)%>
                            <%} %>
                        </td>
                        <td align="center">
                            <a class="jgrid" href="javascript:void(0);" onclick="hl_exec_cmd('[damatgx][<%= listEntity[i].ID %>,<%= !listEntity[i].ConSong %>]')">
                                <span class="jgrid">
                                    <span class="state <%= listEntity[i].ConSong ? "publish" : "unpublish" %>"></span>
                                </span>
                            </a>
                        </td>
                        <td align="center">
                            <%= GetPublish(listEntity[i].ID, listEntity[i].Activity)%>
                        </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>

            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>

</form>
