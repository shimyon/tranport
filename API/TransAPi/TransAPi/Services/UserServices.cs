using System.Linq;
using TransAPi.Entity;
using TransAPi.Repository;

namespace TransAPi.Services
{
    public class UserServices : ICRUD<User>
    {
        int ICRUD<User>.Create(User newObj)
        {
            int userid = -1;
            try
            {
                using (var db = new TransEntities())
                {
                    db.Users.Add(newObj);
                    db.SaveChanges();
                    userid = newObj.UserId;
                }
            }
            catch (System.Exception)
            {
                throw;
            }
            return userid;
        }

        bool ICRUD<User>.Delete(int id)
        {
            bool isok = false;
            try
            {
                using (var db = new TransEntities())
                {
                    User removeUesr = db.Users.FirstOrDefault(f => f.UserId == id);
                    if (removeUesr != null)
                    {
                        db.Users.Remove(removeUesr);
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

        User ICRUD<User>.Select(int id)
        {
            User user = null;
            try
            {
                using (var db = new TransEntities())
                {
                    user = db.Users.FirstOrDefault(f => f.UserId == id);
                }
            }
            catch (System.Exception)
            {
                throw;
            }

            return user;
        }

        bool ICRUD<User>.Update(User editObj)
        {
            bool isok = false;
            try
            {
                using (var db = new TransEntities())
                {
                    User updateUser = db.Users.FirstOrDefault(f => f.UserId == editObj.UserId);
                    if (updateUser != null)
                    {

                        updateUser.FirstName = editObj.FirstName;
                        updateUser.LastName = editObj.LastName;
                        updateUser.Email = editObj.Email;
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
    }
}