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
    public class FeeDepositedController : ApiController
    {
        private SmarteezDatabaseEntities db = new SmarteezDatabaseEntities();

        // GET api/FeeDeposited
        public IQueryable<FeeDeposit> GetFeeDeposits()
        {
            return db.FeeDeposits;
        }

        // GET api/FeeDeposited/5
        //Get Fee Detail based on Student Id
        //[ResponseType(typeof(FeeDeposit))]
        public List<FeeDeposit> GetFeeDeposit(int id)
        {
            var feeDetail = db.FeeDeposits.Where(fee => fee.StudentId == id).ToList();
            return feeDetail;
            //FeeDeposit feedeposit = db.FeeDeposits.Find(id);
            //if (feedeposit == null)
            //{
            //    return NotFound();
            //}

            //return Ok(feedeposit);
        }

        public List<FeeDeposit> GetFeeDeposit(int id, string Month)
        {
            var feeDetail = db.FeeDeposits.Where(fee => fee.StudentId == id && fee.Month == Month).ToList();
            return feeDetail;
        }

        // PUT api/FeeDeposited/5
        public IHttpActionResult PutFeeDeposit(int id, FeeDeposit feedeposit)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != feedeposit.FeeDepositId)
            {
                return BadRequest();
            }

            db.Entry(feedeposit).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FeeDepositExists(id))
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

        // POST api/FeeDeposited
        [ResponseType(typeof(FeeDeposit))]
        public IHttpActionResult PostFeeDeposit(FeeDeposit feedeposit)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.FeeDeposits.Add(feedeposit);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = feedeposit.FeeDepositId }, feedeposit);
        }

        // DELETE api/FeeDeposited/5
        [ResponseType(typeof(FeeDeposit))]
        public IHttpActionResult DeleteFeeDeposit(int id)
        {
            FeeDeposit feedeposit = db.FeeDeposits.Find(id);
            if (feedeposit == null)
            {
                return NotFound();
            }

            db.FeeDeposits.Remove(feedeposit);
            db.SaveChanges();

            return Ok(feedeposit);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool FeeDepositExists(int id)
        {
            return db.FeeDeposits.Count(e => e.FeeDepositId == id) > 0;
        }
    }
}