using MyProject2.Models;
using MyProject2.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyProject2.Services
{
    public class AppVersionService
    {

        private readonly AppVersionRepository _repo = new AppVersionRepository();

        public AppVersion GetLastVersion()
        {
            return _repo.GetLastVersion();
        }

        public void AddVersion(string version, string desc)
        {
            _repo.Insert(new AppVersion
            {
                VersionNo = version,
                Description = desc
            });
        }


    }
}
