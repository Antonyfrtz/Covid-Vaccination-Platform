using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace thema3
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["UserLoggedIn"] == null)
            {
                Response.Redirect("WebForm2.aspx"); //Redirect to sign-in if not logged in
            }
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
        protected void InsertNewRecord(object sender, EventArgs e)
        {
            {
                String strSQL = "INSERT INTO `Table1` (`AMKA`) VALUES (@param)";
                String connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + HttpContext.Current.Server.MapPath("db\\records.accdb");
                // Create a connection    
                using (OleDbConnection connection = new OleDbConnection(connectionString))
                {
                    if (!amka.Text.Equals(string.Empty) & amka.Text.Length == 11)
                    {
                        // Create a command and set its connection
                        OleDbCommand command = new OleDbCommand(strSQL, connection);
                        command.Parameters.AddWithValue("@param", amka.Text); //Avoiding SQL Injection
                                                                              // Open the connection and execute the select command.    
                        try
                        {
                            // Open connecton
                            connection.Open();
                            // Execute command    
                            OleDbDataReader reader = command.ExecuteReader();
                            amka.Text = "";
                            Response.Redirect("WebForm4.aspx");
                        }
                        catch (Exception ex)
                        {
                            Response.Write(ex.Message);
                        }
                    }
                }
                // The connection is automatically closed becasuse of using block.    
            }
        }
        protected void DeleteAllRecords(object sender, EventArgs e)
        {
            String strSQL = "DELETE * FROM `Table1`";
            String connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + HttpContext.Current.Server.MapPath("db\\records.accdb");
            // Create a connection    
            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                    // Create a command and set its connection
                    OleDbCommand command = new OleDbCommand(strSQL, connection);
                    try
                    {
                        // Open connecton
                        connection.Open();
                        // Execute command    
                        OleDbDataReader reader = command.ExecuteReader();
                        Response.Redirect("WebForm4.aspx");
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }
            }
        }       // The connection is automatically closed becasuse of using block. 
    }
}