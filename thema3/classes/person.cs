using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;

namespace thema3
{
    public class Person : DB
    {
        public Person(String _amka, String _afm, String _at, String _firstname, String _lastname, String _tk, String _addr, String _kinhto, String _email) : base(_amka)
        {
            this.Afm = _afm;
            this.At = _at;
            this.Firstname = _firstname;
            this.Lastname = _lastname;
            this.Tk = _tk;
            this.Addr = _addr;
            this.Kinhto = _kinhto;
            this.Email = _email;
        }
        public Person() : base("") { } // Default constructor for static object instantiation
        public string At { get { return at; } set { if (!at.Equals(value) && NowEditing == true) { UpdateDB("ART", value); } at = value; } }
        private string at = string.Empty;
        public string Afm { get { return afm; } set { if (!afm.Equals(value) && NowEditing==true) { UpdateDB("AFM", value); } afm = value; } }
        private string afm = string.Empty;
        public string Firstname { get { return firstname; } set { if (!firstname.Equals(value) && NowEditing == true) { UpdateDB("ONOMA", value); } firstname = value; } }
        private string firstname = string.Empty;
        public string Lastname { get { return lastname; } set { if (!lastname.Equals(value) && NowEditing == true) { UpdateDB("EPITHETO", value); } lastname = value; } }
        private string lastname = string.Empty;
        public string Tk { get { return tk; } set { if (!tk.Equals(value) && NowEditing == true) { UpdateDB("TK", value); } tk = value; } }
        private string tk = string.Empty;
        public string Addr { get { return addr; } set { if (!addr.Equals(value) && NowEditing == true) { UpdateDB("ADDR", value); } addr = value; } }
        private string addr = string.Empty;
        public string Kinhto { get { return kinhto; } set { if (!kinhto.Equals(value) && NowEditing == true) { UpdateDB("KINHTO", value); } kinhto = value; } }
        private string kinhto = string.Empty;
        public string Email { get { return email; } set { if (!email.Equals(value) && NowEditing == true) { UpdateDB("EMAIL", value); } email = value; } }
        private string email = string.Empty;
    }
}