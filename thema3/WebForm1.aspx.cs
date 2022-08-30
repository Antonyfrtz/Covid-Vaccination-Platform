using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace thema3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Disconnect(object sender, EventArgs e)
        {
            if (Request.Cookies["UserLoggedIn"] != null)
            {
                HttpCookie myCookie = new HttpCookie("UserLoggedIn");
                myCookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(myCookie);
                Response.Redirect("WebForm2.aspx");
            }
        }
        protected void RedirectToSearch(object sender, EventArgs e) 
        {
            if (Request.Cookies["UserLoggedIn"] == null)
            {
                Response.Redirect("WebForm2.aspx"); //Redirect to sign-in if not logged in
            }
            else
            {
                Session["key"] = amka.Text;
                Response.Redirect("WebForm3.aspx");
            }
        }
    }
}