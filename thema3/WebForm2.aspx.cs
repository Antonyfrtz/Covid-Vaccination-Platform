using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace thema3
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["UserLoggedIn"] != null)
            {
                Response.Redirect("WebForm1.aspx"); //Redirect to mainpage if already logged in
            }
        }

        protected void Button1_Click(object sender, EventArgs e) // Successful login
        {
            if (CheckBox1.Checked)
            {
                Response.Cookies["UserLoggedIn"].Value = TextBox1.Text;
                Response.Cookies["UserLoggedIn"].Expires = DateTime.Now.AddMinutes(720);
                Response.Redirect("WebForm1.aspx");
            }
            else
            {
                Response.Cookies["UserLoggedIn"].Value = TextBox1.Text;
                Response.Cookies["UserLoggedIn"].Expires = DateTime.Now.AddMinutes(1);
                Response.Redirect("WebForm1.aspx");
            }
        }
    }
}