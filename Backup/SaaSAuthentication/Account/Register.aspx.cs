using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using SaaSAuthentication.Data;
namespace SaaSAuthentication.Account
{
    public partial class Register : System.Web.UI.Page
    {
        string _continueUrl;

        protected void Page_Load(object sender, EventArgs e)
        {
            _continueUrl = Request.QueryString["ReturnUrl"];
        }

        protected void CreateUserButton_Click(object sender, EventArgs e)
        {
            AuthenticationEntitiesDataContext ctx = new AuthenticationEntitiesDataContext();

            //1. Create the Tenant
            Tenant tenant = new Tenant();

            tenant.TenantId = Guid.NewGuid();
            tenant.CompanyName = txtCompanyName.Text;
            tenant.CompanyUrl = txtCompanyUrl.Text;
            tenant.SubscriptionPlan = ddlSubscriptionPlan.SelectedValue;

            ctx.Tenants.InsertOnSubmit(tenant);

            ctx.SubmitChanges();

            //2. Create the User
            // We use the email twice because we're letting users login using their email
            MembershipUser user = Membership.CreateUser(Email.Text, Password.Text, Email.Text);

            //3. Put the user in the new tenant
            UsersInTenant userTenant = new UsersInTenant();

            userTenant.TenantId = tenant.TenantId;
            userTenant.UserId = (Guid)user.ProviderUserKey;

            ctx.UsersInTenants.InsertOnSubmit(userTenant);

            ctx.SubmitChanges();


            // clean up the context
            ctx.Dispose();

            FormsAuthentication.SetAuthCookie(user.UserName, false /* createPersistentCookie */);

            if (String.IsNullOrEmpty(_continueUrl))
            {
                _continueUrl = "~/";
            }
            Response.Redirect(_continueUrl);
        }

    }
}
