using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;

namespace thema3
{
    public class DB
    {
        public static bool NowEditing { get; set; } // Common property of Person objects
        public string Amka { get; } //auto property - read only
        protected DB(String _amka) { this.Amka = _amka; }
        protected void UpdateDB(String field, String newval)
        {
            string connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + HttpContext.Current.Server.MapPath("db\\records.accdb");
            // Create a connection    
            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                String strSQL = "UPDATE Table1 SET " + field + "=@param WHERE AMKA='" + Amka + "'";
                // Create a command and set its connection
                OleDbCommand command = new OleDbCommand(strSQL, connection);
                command.Parameters.AddWithValue("@param", newval); //Avoiding SQL Injection
                // Open the connection and execute the select command.    
                try
                {
                    // Open connecton
                    connection.Open();
                    // Execute command    
                    OleDbDataReader reader = command.ExecuteReader();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
            // The connection is automatically closed becasuse of using block.    
        }
    }
}