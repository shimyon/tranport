using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TransAPi.Entity;
using TransAPi.Repository;
using TransAPi.Services;

namespace TransAPi.Controllers.Api
{
    public class LookUpController : ApiController
    {
        LookServices services = new LookServices();


        public int Create(LookUp newObj)
        {
            return services.Create(newObj);
        }

        public bool Delete(int id)
        {
            return services.Delete(id);
        }

        public LookUp Select(int id)
        {
            return services.Select(id);
        }

        public bool Update(LookUp editObj)
        {
            return services.Update(editObj);
        }

        public List<LookUp> GetGroup(string GroupName)
        {
            return services.GetGroup(GroupName);
        }
    }
}