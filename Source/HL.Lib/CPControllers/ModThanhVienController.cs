using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModThanhVienController : CPController
    {
        public ModThanhVienController()
        {
            //khoi tao Service
            DataService = ModThanhVienService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModThanhVienModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModThanhVienService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Nganh", model.MenuID, model.LangID))
                                .WhereIn(o => o.MenuID1, WebMenuService.Instance.GetChildIDForCP("Doi", model.MenuID1, model.LangID))
                                .Where(model.ParentID > 0, o => o.ParentID == model.ParentID)
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModThanhVienModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModThanhVienService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new ModThanhVienEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = model.MenuID;
                entity.MenuID1 = model.MenuID1;
                entity.ParentID = model.ParentID;
                entity.Activity = CPViewPage.UserPermissions.Approve;
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModThanhVienModel model)
        {
            if (ValidSave(model))
                SaveRedirect();
        }

        public void ActionApply(ModThanhVienModel model)
        {
            if (ValidSave(model))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModThanhVienModel model)
        {
            if (ValidSave(model))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        public void ActionDaMatGX(int[] arrID)
        {
            if (CheckPermissions && !CPViewPage.UserPermissions.Approve)
            {
                //thong bao
                CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;
                CPViewPage.Message.ListMessage.Add("Quyền hạn chế.");
                return;
            }

            DataService.Update("[ID]=" + arrID[0],
                        "@ConSong", arrID[1]);

            //thong bao
            CPViewPage.SetMessage("Đã thực hiện thành công.");
            CPViewPage.RefreshPage();
        }

        #region private func

        private ModThanhVienEntity entity = null;

        private bool ValidSave(ModThanhVienModel model)
        {
            TryUpdateModel(entity);

            //chong hack
            entity.ID = model.RecordID;

            ViewBag.Data = entity;
            ViewBag.Model = model;

            CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;

            //kiem tra quyen han
            if ((model.RecordID < 1 && !CPViewPage.UserPermissions.Add) || (model.RecordID > 0 && !CPViewPage.UserPermissions.Edit))
                CPViewPage.Message.ListMessage.Add("Quyền hạn chế.");

            //kiem tra ten 
            if (entity.Name.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập tên.");

            //kiem tra chuyen muc
            if (entity.MenuID < 1)
                CPViewPage.Message.ListMessage.Add("Chọn chuyên mục.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                //neu khong nhap code -> tu sinh
                if (entity.Code.Trim() == string.Empty)
                    entity.Code = Data.GetCode(entity.Name);

                //save
                ModThanhVienService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        #endregion
    }

    public class ModThanhVienModel : DefaultModel
    {
        private int _LangID = 1;
        public int LangID
        {
            get { return _LangID; }
            set { _LangID = value; }
        }

        public int MenuID { get; set; }
        public int MenuID1 { get; set; }
        public int ParentID { get; set; }
        public string SearchText { get; set; }
    }
}

