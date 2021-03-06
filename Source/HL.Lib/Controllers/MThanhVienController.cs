﻿using System;

using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class MThanhVienController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|ThanhVien")]
        public int MenuID;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionIndex(MThanhVienModel model)
        {
            if (ViewPage.CurrentPage.MenuID > 0)
               MenuID = ViewPage.CurrentPage.MenuID;

            var dbQuery = ModThanhVienService.Instance.CreateQuery()
                            .Where(o => o.Activity == true)
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("ThanhVien", MenuID, ViewPage.CurrentLang.ID))
                            .OrderByDesc(o => o.ID)
                            .Take(PageSize)
                            .Skip(PageSize * model.Page);

            var list = dbQuery.ToList();
            ViewBag.Data = list;
            model.TotalRecord = dbQuery.TotalRecord;
            model.PageSize = PageSize;
            ViewBag.Model = model;
        }

        public void ActionDetail(string endCode)
        {
            var entity = ModThanhVienService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.Code == endCode)
                            //.WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("ThanhVien", MenuID, ViewPage.CurrentLang.ID))
                            .ToSingle();

            if (entity != null)
            {
                ViewBag.Other = ModThanhVienService.Instance.CreateQuery()
                                        .Where(o => o.Activity == true)
                                        .Where(o => o.ID < entity.ID)
                                        .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("ThanhVien", MenuID, ViewPage.CurrentLang.ID))
                                        .OrderByDesc(o => o.ID)
                                        .Take(PageSize)
                                        .ToList();

                ViewBag.Data = entity;
                SetObject["view.Meta"] = entity;
            }
            else
            {
                ViewPage.Error404();
            }
        }
    }

    public class MThanhVienModel
    {
        private int _Page = 0;
        public int Page
        {
            get { return _Page; }
            set { _Page = value - 1; }
        }

        public int PageSize { get; set; }
        public int TotalRecord { get; set; }
    }
}
