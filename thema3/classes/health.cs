using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace thema3
{
    public class Health:DB
    {
        public Health(String _amka, String _sex, String _age, String _disease, String _vacdate):base(_amka) //Set through protected constructor
        {
            this.Sex = _sex;
            this.Age = _age;
            this.Disease = _disease;
            this.Vacdate = _vacdate;

        }
        public Health():base("") { } // Default constructor for static object instantiation
        public string Sex { get { return sex; } set { if (!sex.Equals(value) && NowEditing == true) { UpdateDB("SEX", value); } sex = value; } }
        private string sex = string.Empty;
        public string Age { get { return age; } set { if (!age.Equals(value) && NowEditing == true) { UpdateDB("AGE", value); } age = value; } }
        private string age = string.Empty;
        public string Disease { get { return disease; } set { if (!disease.Equals(value) && NowEditing == true) { UpdateDB("UNDERLYING", value); } disease = value; } }
        private string disease = string.Empty;
        public string Vacdate { get { return vacdate; } set { if (!vacdate.Equals(value) && NowEditing == true) { UpdateDB("VACCINATED", value); } vacdate = value; } }
        private string vacdate = string.Empty;
    }
}