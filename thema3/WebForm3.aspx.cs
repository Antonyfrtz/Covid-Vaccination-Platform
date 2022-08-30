using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace thema3
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        public bool Found { get; set; }
        public bool Successful_vaccination { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["UserLoggedIn"] == null)
            {
                Response.Redirect("WebForm2.aspx"); //Redirect to sign-in if not logged in
            }
            else
            {
                if (!IsPostBack) // Page Reloaded by EventArgs - use object properties
                    try // In case session key is invalidated
                    {
                        String s = Session["key"].ToString();
                        if (s.Length == 11)
                        {
                            SearchKey(s, 1); // Search by AMKA
                        }
                        else if (s.Length == 9)
                        {
                            SearchKey(s, 2); // Search by AFM
                        }
                        else if (s.Length == 8)
                        {
                            SearchKey(s, 3); // Search by AT
                        }
                        else
                        {
                            Found = false;
                        }
                    }
                    catch { Response.Redirect("WebForm1.aspx"); }
                else Found = true; // Force as found if reloaded by EventArgs
            }
        }

        static Person citizen; // Static object keeps fields on page reload
        static Health healthdata;
        protected void SearchKey(string searchquery, int mode)
        {
            string connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + HttpContext.Current.Server.MapPath("db\\records.accdb");
            // Create a connection    
            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                string strSQL;
                // Create a command and set its connection
                if (mode == 1)
                {
                    strSQL = "SELECT * FROM [Table1] WHERE AMKA=@param";
                }
                else if (mode == 2)
                {
                    strSQL = "SELECT * FROM [Table1] WHERE AFM=@param";
                }
                else
                {
                    strSQL = "SELECT * FROM [Table1] WHERE ART=@param";
                }
                OleDbCommand command = new OleDbCommand(strSQL, connection);
                command.Parameters.AddWithValue("@param", searchquery); //Avoiding SQL Injection
                // Open the connection and execute the select command.    
                try
                {
                    // Open connecton
                    connection.Open();
                    // Execute command    
                    OleDbDataReader reader = command.ExecuteReader();
                    //Read data
                    reader.Read();
                    //Create objects from database data
                    Person p = new Person(reader[0].ToString(), reader[1].ToString(), reader[2].ToString(), reader[3].ToString(), reader[4].ToString(), reader[5].ToString(), reader[6].ToString(), reader[7].ToString(), reader[8].ToString());
                    Health h = new Health(reader[0].ToString(), reader[9].ToString(), reader[10].ToString(), reader[11].ToString(), reader[12].ToString());
                    //Fill in real-time fields
                    amka.Text = p.Amka;
                    afm.Text = p.Afm;
                    at.Text = p.At;
                    firstname.Text = p.Firstname;
                    lastname.Text = p.Lastname;
                    tk.Text = p.Tk;
                    addr.Text = p.Addr;
                    kinhto.Text = p.Kinhto;
                    email.Text = p.Email;
                    citizen = p; //pass new instance to static object
                    sex.Text = h.Sex;
                    age.Text = h.Age;
                    health.Text = h.Disease;
                    vacdate.Text = h.Vacdate;
                    healthdata = h; //pass new instance to static object
                    Found = true;
                }
                catch (Exception ex)
                {
                    Found=false;
                }
                // The connection is automatically closed becasuse of using block.    
            }
        }

        protected void Disconnect(object sender, EventArgs e)
        {
            if (Request.Cookies["UserLoggedIn"] != null) //Disconnect by overwriting cookie
            {
                HttpCookie myCookie = new HttpCookie("UserLoggedIn");
                myCookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(myCookie);
                Response.Redirect("WebForm2.aspx");
            }
        }

        protected void Edit(object sender, EventArgs e) //Edit-Save Info Fields
        {
            if (firstname.ReadOnly == true)
            {
                firstname.ReadOnly = false;
                lastname.ReadOnly = false;
                afm.ReadOnly = false;
                at.ReadOnly = false;
                kinhto.ReadOnly = false;
                email.ReadOnly = false;
                addr.ReadOnly = false;
                tk.ReadOnly = false;
                firstname.Focus();
                edit.Text = "Αποθήκευση αλλαγών";
            }
            else
            {
                DB.NowEditing = true; //flag
                citizen.Firstname = firstname.Text; //Setter refreshes field in database if changed,otherwise just rewrites it back to object
                firstname.ReadOnly = true;
                citizen.Lastname = lastname.Text;
                lastname.ReadOnly = true;
                citizen.Afm = afm.Text;
                afm.ReadOnly = true;
                citizen.At = at.Text;
                at.ReadOnly = true;
                citizen.Kinhto = kinhto.Text;
                kinhto.ReadOnly = true;
                citizen.Email = email.Text;
                email.ReadOnly = true;
                citizen.Addr = addr.Text;
                addr.ReadOnly = true;
                citizen.Tk = tk.Text;
                tk.ReadOnly = true;
                DB.NowEditing = false;
                edit.Text = "Ενημέρωση στοιχείων";
            }
        }
        protected void EditHealth(object sender, EventArgs e) {
            if (sex.ReadOnly == true)
            {
                sex.ReadOnly = false;
                age.ReadOnly = false;
                health.ReadOnly = false;
                vacdate.ReadOnly = false;
                sex.Focus();
                edith.Text = "Αποθήκευση αλλαγών";
            }
            else
            {
                DB.NowEditing = true; //flag
                healthdata.Sex = sex.Text; //Setter refreshes field in database if changed,otherwise just rewrites it back to object
                sex.ReadOnly = true;
                healthdata.Age = age.Text;
                age.ReadOnly = true;
                healthdata.Disease = health.Text;
                health.ReadOnly = true;
                healthdata.Vacdate = vacdate.Text;
                vacdate.ReadOnly = true;
                DB.NowEditing = false;
                edith.Text = "Ενημέρωση στοιχείων";
            }
        }
        protected void Vaccinate(object sender, EventArgs e)
        {
            DateTime now = DateTime.Now;
            vacdate.Text = now.ToString("d")+now.ToString(" HH:mm");
            DB.NowEditing = true; //flag
            healthdata.Vacdate = vacdate.Text;
            DB.NowEditing = false;
            Successful_vaccination = true;
        }
    }
}