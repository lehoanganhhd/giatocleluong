using System;
using System.Globalization;

using HL.Core.Models;

namespace HL.Lib.Global
{
    public static class CPResource 
    {
        private static string CurrentCode
        {
            get { return CultureInfo.CurrentCulture.Name; }
        }

        public static string GetValue(string code)
        {
            return GetValue(code, string.Empty);
        }

        public static string GetValue(string code, string defalt)
        {
            IniResourceService ResourceService = new IniResourceService(System.Web.HttpContext.Current.Server.MapPath("~/" + HL.Core.Web.Setting.Sys_CPDir + "/Views/Lang/" + CurrentCode + ".ini"));
            return ResourceService.HL_Core_GetByCode(code, defalt);
        }
    }
}