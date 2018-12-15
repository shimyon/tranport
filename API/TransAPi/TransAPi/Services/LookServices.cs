using System;
using System.Linq;
using TransAPi.Controllers.Api;
using TransAPi.Entity;
using TransAPi.Repository;
using System.Collections.Generic;

namespace TransAPi.Services
{
    public class LookServices : ICRUD<LookUp>
    {
        public int Create(LookUp newObj)
        {
            int id = -1;
            try
            {
                using (var db = new TransEntities())
                {
                    db.LookUps.Add(newObj);
                    db.SaveChanges();
                    id = newObj.LookupId;
                }
            }
            catch (System.Exception)
            {
                throw;
            }
            return id;
        }

        public bool Delete(int id)
        {
            bool isok = false;
            try
            {
                using (var db = new TransEntities())
                {
                    LookUp removeObj = db.LookUps.FirstOrDefault(f => f.LookupId == id);
                    if (removeObj != null)
                    {
                        removeObj.IsEnable = true;
                        db.SaveChanges();
                    }
                    isok = true;
                }
            }
            catch (System.Exception)
            {
                throw;
            }
            return isok;
        }

        public LookUp Select(int id)
        {
            LookUp obj = null;
            try
            {
                using (var db = new TransEntities())
                {
                    obj = db.LookUps.FirstOrDefault(f => f.LookupId == id);
                }
            }
            catch (System.Exception)
            {
                throw;
            }

            return obj;
        }

        public bool Update(Entity.LookUp editObj)
        {
            bool isok = false;
            try
            {
                using (var db = new TransEntities())
                {
                    Entity.LookUp update = db.LookUps.FirstOrDefault(f => f.LookupId == editObj.LookupId);
                    if (update != null)
                    {
                        update.ItemName = editObj.ItemName;
                        update.ItemId = editObj.ItemId;
                        update.GroupName = editObj.GroupName;
                        db.SaveChanges();
                    }
                    isok = true;
                }
            }
            catch (System.Exception)
            {
                throw;
            }
            return isok;
        }

        public List<LookUp> GetGroup(string GroupName)
        {
            List<LookUp> list = new List<LookUp>();
            try
            {
                using (var db = new TransEntities())
                {
                    list = db.LookUps.Where(f => f.GroupName == GroupName).ToList();
                }
            }
            catch (System.Exception)
            {
                throw;
            }
            return list;
        }
    }
}