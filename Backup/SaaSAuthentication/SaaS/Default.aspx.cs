using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SaaSAuthentication.Page;

namespace SaaSAuthentication.SaaS
{
    public partial class Default : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblTenantName.Text = TenantName;
        }
    }
}