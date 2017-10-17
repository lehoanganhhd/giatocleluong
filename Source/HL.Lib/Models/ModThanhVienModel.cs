using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModThanhVienEntity : EntityBase
    {

        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public int ParentID { get; set; }

        [DataInfo]
        public int ConThu { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public int MenuID1 { get; set; }

        [DataInfo]
        public string QueQuan { get; set; }

        [DataInfo]
        public string Address { get; set; }

        [DataInfo]
        public int Sex { get; set; }

        [DataInfo]
        public string Phone { get; set; }

        [DataInfo]
        public string Email { get; set; }

        [DataInfo]
        public string LinkFB { get; set; }

        [DataInfo]
        public string Job { get; set; }

        [DataInfo]
        public string File { get; set; }

        [DataInfo]
        public bool ConSong { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        #endregion

        private WebMenuEntity _oMenu = null;
        /// <summary>
        /// Lay ra Nganh thu bao nhie
        /// </summary>
        /// <returns></returns>
        public WebMenuEntity getMenu()
        {
            if (_oMenu == null && MenuID > 0)
                _oMenu = WebMenuService.Instance.GetByID_Cache(MenuID);

            if (_oMenu == null)
                _oMenu = new WebMenuEntity();

            return _oMenu;
        }

        private WebMenuEntity _oMenu1 = null;
        /// <summary>
        /// Lay ra Doi thu bao nhieu
        /// </summary>
        /// <returns></returns>
        public WebMenuEntity getMenu1()
        {
            if (_oMenu1 == null && MenuID1 > 0)
                _oMenu1 = WebMenuService.Instance.GetByID_Cache(MenuID1);

            if (_oMenu1 == null)
                _oMenu1 = new WebMenuEntity();

            return _oMenu1;
        }

        private ModThanhVienEntity _oParent = null;
        public ModThanhVienEntity getParent()
        {
            if (_oParent == null && ParentID > 0)
                _oParent = ModThanhVienService.Instance.GetByParentID(ParentID);

            if (_oParent == null)
                _oParent = new ModThanhVienEntity();

            return _oParent;
        }

    }

    public class ModThanhVienService : ServiceBase<ModThanhVienEntity>
    {

        #region Autogen by HL

        private ModThanhVienService()
            : base("[Mod_ThanhVien]")
        {

        }

        private static ModThanhVienService _Instance = null;
        public static ModThanhVienService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModThanhVienService();

                return _Instance;
            }
        }

        #endregion

        public ModThanhVienEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

        public ModThanhVienEntity GetByParentID(int parentId)
        {
            return base.CreateQuery()
               .Where(o => o.ID == parentId)
               .ToSingle();
        }

    }
}