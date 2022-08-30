<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="thema3.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>Αποτελέσματα Αναζήτησης | Εμβολιασμός COVID-19</title>
    <link rel="shortcut icon" href="https://emvolio.gov.gr/sites/default/themes/govbootstrap/favicon.ico"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/navigation.css"/>
    <link rel="stylesheet" href="css/search.css" />
</head>

<header>
    <div class="bar">
        <a href="WebForm1.aspx"><img style="margin-right:20px;margin-left:12px;margin-top:10px;width:152px;height:50px;float:left;display:inline-block;"src="resources/logo.svg" alt="logo" class="responsive"/></a>
        <a href="WebForm1.aspx"><img style="margin-right:20px;margin-left:0px;margin-top:10px;width:1px;height:50px;float:left;display:inline-block;"src="resources/line.png" alt="logo" class="responsive"/></a>
        <ul class="topnav">
        <li><p style="float:left;color:#f2f2f2;text-align:center;padding-bottom:7px;padding-right:10px;text-decoration:none;font-size:18px;font-family:'Open Sans',sans-serif;margin:0;user-select:none;">Εμβολιασμός COVID-19</p></li>
        <li><a class="active" href="WebForm1.aspx">ΑΡΧΙΚΗ</a></li>
        <li><a href="WebForm4.aspx">ΜΗΤΡΩΟ</a></li>
    <%HttpCookie cookie = Request.Cookies["UserLoggedIn"];if (cookie == null)
        {%> <%--Check if user is logged in --%>
        <li style="float:right;margin-right:1%;"><a href="WebForm2.aspx">ΣΥΝΔΕΣΗ</a></li>
    <%}else{user.Text=cookie.Value.ToString(); %> <%--HTML to display if user is logged in --%>
        <li style="float:right;margin-right:2%;"><a href="#" runat="server" onServerClick="Disconnect">ΑΠΟΣΥΝΔΕΣΗ</a></li>
        <li style="float:right;color: white;text-align: center;padding: 10px 10px;font-size: 15px;" runat="server">Είστε συνδεδεμένος/η, <asp:Label ID="user" runat="server" Text="USER"></asp:Label></li>
    <%}%>
        </ul>
    </div>
</header>

<body>
    <form id="form1" runat="server">
        <div>
        </div>
    <br/>
    <h1 style="margin-top: 80px;">Πληροφορίες πολίτη</h1>
    <%if(Found==true){ %>
        <div>
            <div class="info">
                <div class="row">
                  <asp:Panel runat="server" class="column" ID="a">
                    <p style="margin-right:17px">Όνομα</p><asp:TextBox readonly="true" ID="firstname" CssClass="fields" placeholder="ΟΝΟΜΑ" runat="server"></asp:TextBox><br/>
                    <p>Επίθετο</p><asp:TextBox ID="lastname" readonly="true" CssClass="fields" placeholder="ΕΠΙΘΕΤΟ" runat="server"></asp:TextBox><br/>
                    <p style="margin-right:18px">ΑΜΚΑ</p><asp:TextBox ID="amka" readonly="true" CssClass="fields" placeholder="00000000000" runat="server"></asp:TextBox><br/>
                    <p style="margin-right:27px">ΑΦΜ</p><asp:TextBox ID="afm" readonly="true" CssClass="fields" placeholder="00000000" pattern="[0-9]{9}" runat="server"></asp:TextBox><br/>
                    <p style="margin-right:44px">ΑΤ</p><asp:TextBox ID="at" readonly="true" CssClass="fields" placeholder="AA000000" pattern="[A-ZΑ-Ω]{2}[0-9]{6}" runat="server"></asp:TextBox><br/>
                  </asp:Panel>
                  <div class="column">
                    <p style="margin-right:36px">Κινητό</p><asp:TextBox ID="kinhto" readonly="true" CssClass="fields" placeholder="6900000000" runat="server"></asp:TextBox><br/>
                    <p style="margin-right:36px">E-mail</p><asp:TextBox ID="email" readonly="true" CssClass="fields" placeholder="E-mail" runat="server"></asp:TextBox><br/>
                    <p>Διεύθυνση</p><asp:TextBox ID="addr" CssClass="fields" readonly="true" placeholder="Διεύθυνση" runat="server"></asp:TextBox><br/>
                    <p style="margin-right:55px">Τ.Κ.</p><asp:TextBox ID="tk" readonly="true" CssClass="fields" placeholder="Τ.Κ." runat="server"></asp:TextBox><br/>
                    <asp:Button ID="edit" CssClass="editbtn" runat="server" OnClick="Edit" Text="Ενημέρωση στοιχείων" />
                  </div>
                </div>
            </div>
        </div>
        <br/>
        <h1>Υγειονομικό απόρρητο</h1>
        <br/>
        <div>
            <div class="info" style="min-height: 135px; height: 135px;background-color:#ffffbc;">
                <div class="row" style="min-height: 135px; height:135px;">
                  <div class="column" style="min-height: 135px; height:135px;">
                    <p style="margin-right:17px">Φύλο</p><asp:TextBox readonly="true" ID="sex" CssClass="fields" placeholder="ΑΝΔΡΑΣ/ΓΥΝΑΙΚΑ" runat="server"></asp:TextBox><br/>
                    <p>Ηλικία</p><asp:TextBox ID="age" readonly="true" CssClass="fields" placeholder="ΗΛΙΚΙΑ ΠΟΛΙΤΗ" runat="server"></asp:TextBox><br/>
                  </div>
                  <div class="column" style="min-height: 135px; height:135px;">
                    <p style="margin-right:8px">Υποκείμενο Νόσημα</p><asp:TextBox ID="health" Width="160px" readonly="true" CssClass="fields" placeholder="π.χ. Διαβήτης" runat="server"></asp:TextBox><br/>
                    <p style="margin-right:8px">Ημ/νία Εμβολιασμού</p><asp:TextBox ID="vacdate" Width="160px" readonly="true" CssClass="fields" placeholder="π.χ. 31/12/21 23:59" runat="server"></asp:TextBox><br/>
                    <asp:Button ID="edith" CssClass="editbtn" runat="server" OnClick="EditHealth" Text="Ενημέρωση στοιχείων" />
                  </div>
                </div>
            </div>
        </div>
        <br/>
        <%if (vacdate.Text == "") {%>
        <div style="display:block;margin:auto;width:700px;">
            <asp:Button ID="vaccinate" CssClass="vaccinate" runat="server" OnClick="Vaccinate" Text="Καταχώρηση Εμβολιασμού" />
        </div>
        <%} if (Successful_vaccination == true){ %>
        <div class="info" style="min-height: 50px; height: 50px;background-color:#96eccd;">
        <i class="fa fa-check" style="font-size:42px;color:forestgreen;margin:5px;float:left;"></i><label style="display:inline-block;float: left;margin-top:16px;margin-left:5px;">Επιτυχής εμβολιασμός. Για τροποποίηση/αφαίρεση, πατήστε "Ενημέρωση Στοιχείων"</label>
        </div>
        <%} %>
    <%}else{ %> <%--Citizen record not found--%>
        <div class="info" style="min-height: 60px; height: 60px;background-color:#ff8484;">
            <i class="fa fa-close" style="font-size:42px;color:#ca2e2e;margin:5px;float:left;"></i><label style="display:inline-block;float: left;margin-top:10px;margin-left:5px;color:white">Δεν βρέθηκε πολίτης. Παρακαλώ ελέγξτε το κλειδί αναζήτησης σας ή προσθέστε τον πολίτη </label><label style="display:inline-block;float: left;margin-top:0px;margin-left:5px;color:white">στο μητρώο</label>
        </div>
        <br/>
        <div style="margin:auto;width:700px;">
            <asp:Button ID="rerun" CssClass="vaccinate" runat="server" PostBackUrl="WebForm1.aspx" Text="Νέα Αναζήτηση" />
            <asp:Button ID="records" CssClass="vaccinate" runat="server" PostBackUrl="WebForm4.aspx" Text="Μητρώο" />
        </div>
    <%} %>
    </form>
    </body>
</html>
