using MyProject2.Services;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;

namespace MyProject2.Admin.Helpers
{
    public static class VersionManager
    {


        private static readonly AppVersionService _service = new AppVersionService();

        public static string GetLocalVersion()
        {
            return Assembly.GetExecutingAssembly()
                .GetName()
                .Version?
                .ToString() ?? "1.0.0";
        }

        public static string GetDbVersion()
        {
            return _service.GetLastVersion()?.VersionNo ?? "0.0.0";
        }

        public static string GetDbDescription()
        {
            return _service.GetLastVersion()?.Description ?? "";
        }

        public static bool IsNewVersion()
        {
            return GetLocalVersion() != GetDbVersion();
        }


    }
}
