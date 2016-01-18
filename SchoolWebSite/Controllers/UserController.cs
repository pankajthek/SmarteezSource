using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SchoolWebSite.Models;
//using SchoolApi.MapperEntity;
using log4net;

namespace SchoolApi.Controllers
{
    public class UserController : ApiController
    {
        log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        // GET api/default1
        public IEnumerable<User> Get()
        {
            IEnumerable<User> users = new List<User>();
            try
            {
                //List<UserMapper> usersMapper = new List<UserMapper>();
                using (SmarteezDatabaseEntities db = new SmarteezDatabaseEntities())
                {
                    users = db.Users.ToList();
                }

                //foreach (var item in users)
                //{
                //    UserMapper obj = new UserMapper();
                //    obj.UserName = item.UserId;
                //    usersMapper.Add(obj);
                //}
                //UserMapper usersMapper = from users i
                return users;
            }
            catch (Exception ex)
            {
                logger.Error(ex.Message,ex);
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.InternalServerError)
                {
                    Content = new StringContent(ex.Message),
                    ReasonPhrase = "Critical Exception"
                });
            }
        }

        // GET api/default1/5
        [Route("api/user/{LoginId}/{Passowrd}/{Role}")]
        public HttpResponseMessage Get(string LoginId, string Passowrd, string Role)
        {
            List<User> users = new List<User>();
            using (SmarteezDatabaseEntities db = new SmarteezDatabaseEntities())
            {
                users = db.Users.Where(user=>user.UserId == LoginId && user.Passowrd == Passowrd && user.IsActive=="A" && user.Role == Role).ToList();
                if (users==null)
                {
                    return new HttpResponseMessage(HttpStatusCode.NotFound);
                }
            }

            return Request.CreateResponse(HttpStatusCode.OK, users);
        }

        // POST api/default1
        public void Post([FromBody]string value)
        {
        }

        // PUT api/default1/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/default1/5
        public void Delete(int id)
        {
        }
    }
}
