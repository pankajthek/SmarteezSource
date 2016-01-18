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
    public class EmployeeAttendanceController : ApiController
    {
        private SmarteezDatabaseEntities db = new SmarteezDatabaseEntities();

        // GET api/EmployeeAttendance
        public IQueryable<EmpAttendanceRegister> GetEmpAttendanceRegisters()
        {
            return db.EmpAttendanceRegisters;
        }

        // GET api/EmployeeAttendance/5
        [ResponseType(typeof(EmpAttendanceRegister))]
        public IHttpActionResult GetEmpAttendanceRegister(int id)
        {
            EmpAttendanceRegister empattendanceregister = db.EmpAttendanceRegisters.Find(id);
            if (empattendanceregister == null)
            {
                return NotFound();
            }

            return Ok(empattendanceregister);
        }

        // PUT api/EmployeeAttendance/5
        public IHttpActionResult PutEmpAttendanceRegister(int id, EmpAttendanceRegister empattendanceregister)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != empattendanceregister.AttandanceId)
            {
                return BadRequest();
            }

            db.Entry(empattendanceregister).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EmpAttendanceRegisterExists(id))
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

        // POST api/EmployeeAttendance
        [ResponseType(typeof(EmpAttendanceRegister))]
        public IHttpActionResult PostEmpAttendanceRegister(EmpAttendanceRegister empattendanceregister)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.EmpAttendanceRegisters.Add(empattendanceregister);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = empattendanceregister.AttandanceId }, empattendanceregister);
        }

        // DELETE api/EmployeeAttendance/5
        [ResponseType(typeof(EmpAttendanceRegister))]
        public IHttpActionResult DeleteEmpAttendanceRegister(int id)
        {
            EmpAttendanceRegister empattendanceregister = db.EmpAttendanceRegisters.Find(id);
            if (empattendanceregister == null)
            {
                return NotFound();
            }

            db.EmpAttendanceRegisters.Remove(empattendanceregister);
            db.SaveChanges();

            return Ok(empattendanceregister);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool EmpAttendanceRegisterExists(int id)
        {
            return db.EmpAttendanceRegisters.Count(e => e.AttandanceId == id) > 0;
        }
    }
}