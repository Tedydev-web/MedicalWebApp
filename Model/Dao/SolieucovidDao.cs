using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.Dao
{
    public class SolieucovidDao
    {
        private MyModel db = null;

        public SolieucovidDao()
        {
            db = new MyModel();

        }

        public List<Solieucovid> ListAll()
        {
            return db.Solieucovids.OrderBy(x => x.IDThongkecovid).ToList();
            
        }
        public Solieucovid Solieucovid_FindOneById(int IDThongkecovid)
        {
            return db.Solieucovids.Find(IDThongkecovid);
        }

        public bool Solieucovid_Insert(Solieucovid entity)
        {
            try
            {
                db.Solieucovids.Add(entity);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool Solieucovid_Update(Solieucovid entity)
        {
            try
            {
                var model = db.Solieucovids.Find(entity.IDThongkecovid);
                if (model != null)
                {

                    model.IDThongkecovid = entity.IDThongkecovid;
                    model.Quocgia = entity.Quocgia;
                    model.Socanhiem = entity.Socanhiem;
                    model.Khoi = entity.Khoi;
                    model.Tuvong = entity.Tuvong;
                    model.Ghichu = entity.Ghichu;


                    db.SaveChanges();
                    return true;
                }
                else { return false; }
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool Solieucovid_Delete(Solieucovid entity)
        {
            try
            {
                var model = db.Solieucovids.Find(entity.IDThongkecovid);
                if (model != null)
                {
                    db.Solieucovids.Remove(entity);
                    db.SaveChanges();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
