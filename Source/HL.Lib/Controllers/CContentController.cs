using System;

using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class CContentController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Home[NewsID-true,Title-true]")]
        public string LayoutDefine = string.Empty;

        [HL.Core.MVC.PropertyInfo("Tin bài")]
        public int NewsID = 0;

        [HL.Core.MVC.PropertyInfo("Tiêu đề")]
        public string Title;

        public override void OnLoad()
        {
            ViewBag.Data = ModNewsService.Instance.CreateQuery()
                .Where(o => o.ID == NewsID)
                .ToSingle();

            ViewBag.Title = Title;
        }
    }
}
