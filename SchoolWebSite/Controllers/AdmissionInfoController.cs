using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using SchoolWebSite.Models;

namespace SchoolApi.Controllers
{
    public class AdmissionInfoController : ApiController
    {
        private SmarteezDatabaseEntities db = new SmarteezDatabaseEntities();

        // GET api/AdmissionInfo
        public List<AdmissionInfo> GetAdmissionInfoes()
        {
            var admList = db.AdmissionInfoes.Include(st => st.StudentInfo).ToList();
            return admList;   
        }

        // GET api/AdmissionInfo/5
        [ResponseType(typeof(AdmissionInfo))]
        public IHttpActionResult GetAdmissionInfo([FromUri] string id)
        {
            AdmissionInfo admissioninfo = db.AdmissionInfoes.Include(st=>st.StudentInfo).Where(t=>t.AdmissionNumber == id).FirstOrDefault();
                
            if (admissioninfo == null)
            {
                return NotFound();
            }

            return Ok(admissioninfo);
        }

        // PUT api/AdmissionInfo/5
        public IHttpActionResult PutAdmissionInfo(int id, AdmissionInfo admissioninfo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != admissioninfo.AdmId)
            {
                return BadRequest();
            }

            db.Entry(admissioninfo).State = EntityState.Modified;
            db.Entry(admissioninfo.StudentInfo).State = EntityState.Modified;
            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AdmissionInfoExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST api/AdmissionInfo
        [ResponseType(typeof(AdmissionInfo))]
        public IHttpActionResult PostAdmissionInfo(AdmissionInfo admissioninfo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                //db.SaveChanges();
                //admissioninfo.StdtId = admissioninfo.StudentInfo.StudentId;
                db.StudentInfoes.Add(admissioninfo.StudentInfo);
                db.AdmissionInfoes.Add(admissioninfo);
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (AdmissionInfoExists(admissioninfo.AdmId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = admissioninfo.AdmId }, admissioninfo);
        }

        // DELETE api/AdmissionInfo/5
        [ResponseType(typeof(AdmissionInfo))]
        public IHttpActionResult DeleteAdmissionInfo(int id)
        {
            AdmissionInfo admissioninfo = db.AdmissionInfoes.Find(id);
            if (admissioninfo == null)
            {
                return NotFound();
            }

            db.AdmissionInfoes.Remove(admissioninfo);
            db.SaveChanges();

            return Ok(admissioninfo);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AdmissionInfoExists(int id)
        {
            return db.AdmissionInfoes.Count(e => e.AdmId == id) > 0;
        }
    }
}