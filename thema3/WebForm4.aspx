﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="thema3.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>Αρχείο εμβολιασμών | Εμβολιασμός COVID-19</title>
    <link rel="shortcut icon" href="https://emvolio.gov.gr/sites/default/themes/govbootstrap/favicon.ico"/>
    <link rel="stylesheet" href="css/navigation.css"/>
    <link rel="stylesheet" href="css/data.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<header>
    <div class="bar">
        <a href="WebForm1.aspx"><img style="margin-right:20px;margin-left:12px;margin-top:10px;width:152px;height:50px;float:left;display:inline-block;"src="resources/logo.svg" alt="logo" class="responsive"/></a>
        <a href=""><img style="margin-right:20px;margin-left:0px;margin-top:10px;width:1px;height:50px;float:left;display:inline-block;"src="resources/line.png" alt="logo" class="responsive"/></a>
        <ul class="topnav">
        <li><p style="float:left;color:#f2f2f2;text-align:center;padding-bottom:7px;padding-right:10px;text-decoration:none;font-size:18px;font-family:'Open Sans',sans-serif;margin:0;user-select:none;">Εμβολιασμός COVID-19</p></li>
        <li><a href="WebForm1.aspx">ΑΡΧΙΚΗ</a></li>
        <li><a class="active" href="WebForm4.aspx">ΜΗΤΡΩΟ</a></li>
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
    <form id="form1" runat="server"><div></div>
    <br/>
    <h1>Μητρώο καταγραφής πολιτών</h1>
    <div style="display:block;margin:auto;width:80%;">
        <asp:TextBox required="true" pattern="[0-9]{11}" ID="amka" CssClass="createField" placeholder="Εισάγετε AMKA" runat="server"></asp:TextBox>
        <asp:Button ID="vaccinate" CssClass="create" OnClick="InsertNewRecord" runat="server" Text="Προσθήκη πολίτη" />
        <br/><br/>
        <asp:GridView ID="GridView1" class="dataset" runat="server" AutoGenerateColumns="False" DataKeyNames="AMKA" DataSourceID="AccessDataSource2" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" EmptyDataText ="There are no data records to display.">
            <Columns>
                <asp:BoundField DataField="AMKA" HeaderText="AMKA" ReadOnly="True" SortExpression="AMKA" />
                <asp:BoundField DataField="AFM" HeaderText="ΑΦΜ" SortExpression="AFM" />
                <asp:BoundField DataField="ART" HeaderText="ΑΤ" SortExpression="ART" />
                <asp:BoundField DataField="ONOMA" HeaderText="ONOMA" SortExpression="ONOMA" />
                <asp:BoundField DataField="EPITHETO" HeaderText="ΕΠΙΘΕΤΟ" SortExpression="EPITHETO" />
                <asp:BoundField DataField="ADDR" HeaderText="ΔΙΕΥΘΥΝΣΗ" SortExpression="ADDR" />
                <asp:BoundField DataField="TK" HeaderText="ΤK" SortExpression="TK" />
                <asp:BoundField DataField="KINHTO" HeaderText="ΚΙΝΗΤΟ" SortExpression="KINHTO" />
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                <asp:BoundField DataField="SEX" HeaderText="ΦΥΛΟ" SortExpression="SEX" />
                <asp:BoundField DataField="AGE" HeaderText="ΗΛΙΚΙΑ" SortExpression="AGE" />
                <asp:BoundField DataField="UNDERLYING" HeaderText="ΥΠΟΚΕΙΜΕΝΟ ΝΟΣΗΜΑ" SortExpression="UNDERLYING" />
                <asp:BoundField DataField="VACCINATED" HeaderText="ΗΜ/ΝΙΑ ΕΜΒΟΛΙΑΣΜΟΥ" SortExpression="VACCINATED" />
            </Columns>
        </asp:GridView>
            <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~\db\records.accdb" DeleteCommand="DELETE FROM `Table1` WHERE `AMKA` = ?" InsertCommand="INSERT INTO `Table1` (`AMKA`, `AFM`, `ART`, `ONOMA`, `EPITHETO`, `TK`, `ADDR`, `KINHTO`, `EMAIL`, `SEX`, `AGE`, `UNDERLYING`, `VACCINATED`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" SelectCommand="SELECT `AMKA`, `AFM`, `ART`, `ONOMA`, `EPITHETO`, `TK`, `ADDR`, `KINHTO`, `EMAIL`, `SEX`, `AGE`, `UNDERLYING`, `VACCINATED` FROM `Table1`" UpdateCommand="UPDATE `Table1` SET `AFM` = ?, `ART` = ?, `ONOMA` = ?, `EPITHETO` = ?, `TK` = ?, `ADDR` = ?, `KINHTO` = ?, `EMAIL` = ?, `SEX` = ?, `AGE` = ?, `UNDERLYING` = ?, `VACCINATED` = ? WHERE `AMKA` = ?">
                <DeleteParameters>
                    <asp:Parameter Name="AMKA" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="AMKA" Type="String" />
                    <asp:Parameter Name="AFM" Type="String" />
                    <asp:Parameter Name="ART" Type="String" />
                    <asp:Parameter Name="ONOMA" Type="String" />
                    <asp:Parameter Name="EPITHETO" Type="String" />
                    <asp:Parameter Name="TK" Type="String" />
                    <asp:Parameter Name="ADDR" Type="String" />
                    <asp:Parameter Name="KINHTO" Type="String" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="SEX" Type="String" />
                    <asp:Parameter Name="AGE" Type="String" />
                    <asp:Parameter Name="UNDERLYING" Type="String" />
                    <asp:Parameter Name="VACCINATED" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AFM" Type="String" />
                    <asp:Parameter Name="ART" Type="String" />
                    <asp:Parameter Name="ONOMA" Type="String" />
                    <asp:Parameter Name="EPITHETO" Type="String" />
                    <asp:Parameter Name="TK" Type="String" />
                    <asp:Parameter Name="ADDR" Type="String" />
                    <asp:Parameter Name="KINHTO" Type="String" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="SEX" Type="String" />
                    <asp:Parameter Name="AGE" Type="String" />
                    <asp:Parameter Name="UNDERLYING" Type="String" />
                    <asp:Parameter Name="VACCINATED" Type="String" />
                    <asp:Parameter Name="AMKA" Type="String" />
                </UpdateParameters>
            </asp:AccessDataSource>
        <br />
        </div>
    </form>
</body>
</html>
