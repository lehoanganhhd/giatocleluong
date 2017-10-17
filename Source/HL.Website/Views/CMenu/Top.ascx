<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
    int c = listItem != null ? listItem.Count : 0;
    int i = 0;
%>

<%if (c > 0)
    {%>
<ul class="nav">
    <%for (i = 0; i < c; i++)
        {
            string cls = "";
            string url = ViewPage.GetPageURL(listItem[i]);
            if (ViewPage.IsPageActived(listItem[i]))
            {
                cls = "active";
            }
    %>
    <li class="nav-item">
        <a class="nav-link <%=cls %>" href="<%=url %>"><%=listItem[i].Name %></a>
    </li>
    <%} %>
</ul>
<%} %>

<%--<div id="navigation">
    <div class="navigation-inner">
        <div id="myslidemenu" class="jqueryslidemenu">
            <ul>
                <%for (int i = 0; listItem != null && i < listItem.Count; i++)
                  {
                      var listChildItem = SysPageService.Instance.GetByParent_Cache(listItem[i].ID); %>
                <li><a <%if(ViewPage.IsPageActived(listItem[i], 0)){ %> class="select" <%} %> href="<%=ViewPage.GetPageURL(listItem[i]) %>">
                    <%=listItem[i].Name%></a>
                    <%if (listChildItem != null)
                      { %>
                    <ul>
                        <%for (int j = 0; listChildItem != null && j < listChildItem.Count; j++)
                          {
                              var listChildItem1 = SysPageService.Instance.GetByParent_Cache(listChildItem[j].ID);%>
                        <li><a href="<%=ViewPage.GetPageURL(listChildItem[j]) %>">
                            <%=listChildItem[j].Name%></a>
                            <%if (listChildItem1 != null)
                              { %>
                            <ul>
                                <%for (int k = 0; listChildItem1 != null && k < listChildItem1.Count; k++)
                                  {
                                      var listChildItem2 = SysPageService.Instance.GetByParent_Cache(listChildItem1[k].ID);
                                %>
                                <li><a href="<%=ViewPage.GetPageURL(listChildItem1[k]) %>">
                                    <%=listChildItem1[k].Name%></a>
                                    <%if (listChildItem2 != null)
                                      { %>
                                    <ul>
                                        <%for (int l = 0; listChildItem2 != null && l < listChildItem2.Count; l++)
                                          {
                                        %>
                                        <li><a href="<%=ViewPage.GetPageURL(listChildItem2[l]) %>">
                                            <%=listChildItem2[l].Name%></a> </li>
                                        <%} %>
                                    </ul>
                                    <%} %>
                                </li>
                                <%} %>
                            </ul>
                            <%} %>
                        </li>
                        <%} %>
                    </ul>
                    <%} %>
                </li>
                <%} %>
            </ul>
            <br style="clear: left" />
        </div>
    </div>
</div>--%>
