<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="thema3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>Αρχική | Εμβολιασμός COVID-19</title>
    <link rel="shortcut icon" href="https://emvolio.gov.gr/sites/default/themes/govbootstrap/favicon.ico"/>
    <link rel="stylesheet" href="css/navigation.css"/>
    <link rel="stylesheet" href="css/main.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<header>
    <div class="bar">
        <a href="WebForm1.aspx"><img style="margin-right:20px;margin-left:12px;margin-top:10px;width:152px;height:50px;float:left;display:inline-block;"src="resources/logo.svg" alt="logo" class="responsive"/></a>
        <a href=""><img style="margin-right:20px;margin-left:0px;margin-top:10px;width:1px;height:50px;float:left;display:inline-block;"src="resources/line.png" alt="logo" class="responsive"/></a>
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
    <%} %>
        </ul>
    </div>
</header>

<body>
    <br/>
    <h2>Αναζήτηση πολίτη</h2>
    <p style="text-align:center"><em>Κάνετε αναζήτηση με</em></p>
    <form id="form1" runat="server" style="margin:auto;max-width:500px">
        <asp:TextBox ID="amka" placeholder="ΑΜΚΑ,ΑΦΜ,ΑΤ" runat="server"></asp:TextBox>
        <asp:LinkButton ID="Button1" CssClass="searchbtn" runat="server" OnClick="RedirectToSearch"><i class="fa fa-search"></i></asp:LinkButton><br/><br/><br/>
        <asp:Button ID="Button2" CssClass="searchbtnLarge" runat="server" OnClick="RedirectToSearch" Text="Αναζήτηση" />
    </form>
</body>
</html>
