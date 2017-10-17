using System;

namespace HL.Lib.MVC
{
    public class ViewControl : HL.Core.MVC.ViewControl
    {
        public ViewPage ViewPage
        {
            get { return this.Page as ViewPage; }
        }

        protected string GetPagination(int pageIndex, int pageSize, int totalRecord)
        {
            return GetPagination(ViewPage.CurrentURL, pageIndex, pageSize, totalRecord);
        }

        protected string GetPagination(string url, int pageIndex, int pageSize, int totalRecord)
        {
            Global.Pager _Pager = new Global.Pager();

            _Pager.URL = url;
            _Pager.PageIndex = pageIndex;
            _Pager.PageSize = pageSize;
            _Pager.TotalRecord = totalRecord;
            _Pager.DisableMode = true;
            _Pager.NextText = "<img src=\"/Content/skins/images/next.png\" alt=\"\" />";
            _Pager.BackText = "<img src=\"/Content/skins/images/prev.png\" alt=\"\" />";
            _Pager.NextEndText = "";
            _Pager.BackEndText = "";

            _Pager.Update();

            return _Pager.HtmlPage;
        }
    }
}
