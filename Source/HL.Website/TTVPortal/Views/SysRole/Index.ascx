﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl"%>

<script runat="server">
   
    SysRoleModel model = null;
    List<CPRoleEntity> listEntity = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        model = ViewBag.Model as SysRoleModel;
        listEntity = ViewBag.Data as List<CPRoleEntity>;
    }
    
</script>

<form id="hlForm" name="hlForm" method="post">

<input type="hidden" id="_hl_action" name="_hl_action" />
<input type="hidden" id="boxchecked" name="boxchecked" value="0" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%=GetListCommand("new|Thêm,edit|Sửa,space,delete|Xóa")%>
        </div>
        <div class="pagetitle icon-48-groups">
            <h2>Nhóm người sử dụng</h2>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"> <div class="b"></div></div></div>
</div>
<div class="clr"></div>

<script type="text/javascript">

    var HLController = 'SysRole';

    var HLArrVar = [
                    'limit', 'PageSize'
                   ];

    var HLArrQT = [
                    '<%= model.PageIndex + 1 %>', 'PageIndex',
                    '<%= model.Sort %>', 'Sort'
                  ];

    var HLArrDefault =
                  [
                    '1', 'PageIndex',
                    '20', 'PageSize'
                  ];
</script>
        
<%= ShowMessage()%>

<div id="element-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
                        
        <table class="adminlist" cellspacing="1">
            <thead>
                <tr>
                    <th width="1%">
                        #
                    </th>
                    <th width="1%">
                        <input type="checkbox" name="toggle" value="" onclick="checkAll(<%= model.PageSize %>);" />
                    </th>
                    <th class="title">
                        <%= GetSortLink("Tên", "Name")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                         <%= GetSortLink("Sắp xếp", "Order")%>
                        <a href="javascript:hl_exec_cmd('saveorder')" class="saveorder" title="Lưu sắp xếp"></a>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("ID", "ID")%>
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
                    <td>
                        <a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].Name%></a>
                    </td>
                    <td class="order">
                        <%= GetOrder(listEntity[i].ID, listEntity[i].Order)%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].ID%>
                    </td>
                </tr>
                <%} %>
            </tbody>
        </table>
                            
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

</form>