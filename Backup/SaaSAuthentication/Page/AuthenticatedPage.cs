using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SaaSAuthentication.Data;
using System.Web.Security;

namespace SaaSAuthentication.Page
{
    public class AuthenticatedPage : System.Web.UI.Page
    {
        AuthenticationEntitiesDataContext _ctx;

        protected void Page_PreInit(object sender, EventArgs e)
        {
            _ctx = new AuthenticationEntitiesDataContext();
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            _ctx.Dispose();
        }

        private Guid _TenantId = Guid.Empty;
        public Guid TenantId { 
            get
            {
                Guid retVal;

                if (_TenantId == Guid.Empty)
                {

                    GetTenantInfo(out _TenantId, out _TenantName);

                    retVal = _TenantId;
                }
                else
                {
                    retVal = _TenantId;
                }

                return retVal;
            }
            
        }

        private string _TenantName = String.Empty;
        public string TenantName 
        { 
            get
            {
                string retVal;

                if (_TenantName == String.Empty)
                {

                    GetTenantInfo(out _TenantId, out _TenantName);

                    retVal = _TenantName;
                }
                else
                {
                    retVal = _TenantName;
                }

                return retVal;
            }
            
        }

        private void GetTenantInfo(out Guid tenantId, out string tenantName)
        {
            Guid userId = (Guid)Membership.GetUser(this.User.Identity.Name).ProviderUserKey;
            var query = (from tenants in _ctx.UsersInTenants where tenants.UserId == userId select tenants.Tenant).FirstOrDefault();

            if (query == null)
            {
                throw new Exception("This User doesn't belong to a Tenant!");
            }

            tenantId = query.TenantId;
            tenantName = query.CompanyName;
        }
    }
}