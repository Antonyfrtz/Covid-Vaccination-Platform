<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="thema3.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>Σύνδεση | Εμβολιασμός COVID-19</title>
    <link rel="shortcut icon" href="https://emvolio.gov.gr/sites/default/themes/govbootstrap/favicon.ico"/>
    <link rel="stylesheet" href="css/navigation.css"/>
    <link rel="stylesheet" href="css/login.css" />
</head>

<header>
    <div class="bar">
        <a href="WebForm1.aspx"><img style="margin-right:20px;margin-left:12px;margin-top:10px;width:152px;height:50px;float:left;display:inline-block;"src="resources/logo.svg" alt="logo" class="responsive"/></a>
        <a href=""><img style="margin-right:20px;margin-left:0px;margin-top:10px;width:1px;height:50px;float:left;display:inline-block;"src="resources/line.png" alt="logo" class="responsive"/></a>
        <ul class="topnav">
        <li><p style="float:left;color:#f2f2f2;text-align:center;padding-bottom:7px;padding-right:10px;text-decoration:none;font-size:18px;font-family:'Open Sans',sans-serif;margin:0;user-select:none;">Εμβολιασμός COVID-19</p></li>
        <li><a href="WebForm1.aspx">ΑΡΧΙΚΗ</a></li>
        <li><a href="WebForm4.aspx">ΜΗΤΡΩΟ</a></li>
        <li style="float:right;margin-right:1%;"><a class="active" href="WebForm2.aspx">ΣΥΝΔΕΣΗ</a></li>
        </ul>
    </div>
</header>

<body>
      <br/>
      <div class="login">
          <div style="margin-left: 1%">
            <h1 style="color:#083474;">Καλώς ήλθατε στη σελίδα εισόδου των υπηρεσιών αυθεντικοποίησης της Ηλεκτρονικής Συνταγογράφησης</h1>
            <p> Παρακαλούμε εισάγετε τους κωδικούς e-Prescription για την είσοδό σας στο σύστημα <a style="color:#38a5ff;text-decoration: none; " href="WebForm1.aspx">Εμβολιασμός για covid-19</a></p>
            <hr style="border-radius: 5px;border: 1px solid black;"/>
            <div class="imgcontainer">
              <img src="resources/avatar.png" class="avatar"/>
            </div>
          </div>
          <br/>

          <form id="form2" runat="server">
             <div>
              <div style="text-align:left;margin-left:25%;display:block;">
                  <label for="username">Όνομα Χρήστη</label><br/>
                  <asp:TextBox ID="TextBox1" placeholder="Εισάγετε όνομα χρήστη" runat="server"></asp:TextBox>&nbsp;
              </div>
              <br/>
              <div style="text-align:left;margin-left:25%;display:block;">
                    <label for="password">Κωδικός</label><br/>
                    <input type="password" placeholder="Εισάγετε κωδικό" name="password" required/>
              </div>
            </div>

            <div class="checkcontainer" style="text-align: center; margin: 10px;">
              <label>
                <asp:CheckBox ID="CheckBox1" Checked="true" runat="server" />&nbsp;Να με θυμάσαι
              </label>
            </div>

            <div style="margin-left:25%;display:block;padding-top:14px;padding-bottom:14px;">
               <asp:Button ID="Button1" CssClass="loginbox" runat="server" OnClick="Button1_Click" Text="Είσοδος" />
            </div>
           </form>
       </div>
</body>
</html>
