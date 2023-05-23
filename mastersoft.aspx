<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mastersoft.aspx.cs" Inherits="Ashutosh.Nayak.Mastersoft.mastersoft" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        .lbl{
            color:teal;
            font-weight:500;
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-weight:bold;
        }
        .btn {
            background-color: #4CAF50; /* Green */
            transition-duration:0.4s;
        }
        .btn:hover
        {
            background-color: #4CAF50;
        }
        .btn1
        {
            background-color:orangered;
        }
        .btn2{
            background-color:#4CAF50;
        }
        .btn3{
            background-color:powderblue;
        }

    </style>
    <title>Registration Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hfId" runat="server" />
            <table>
                <tr>
                    <td class="lbl">
                        <asp:Label ID="label1" runat="server" Text="First Name"></asp:Label>
                    </td>
                    <td colspan="2" class="txt">
                        <asp:TextBox ID="txtFirstName" runat="server" Width="251px" BorderWidth="3px"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td class="lbl">
                        <asp:Label ID="label2" runat="server" Text="LastName"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtLastName" runat="server" Width="251px" BorderWidth="3px"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td class="lbl">
                        <asp:Label ID="label3" runat="server" Text="Email Id"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtEmailID" runat="server" Width="251px" BorderWidth="3px"></asp:TextBox>
                    </td >
                </tr>
                 <tr>
                    <td class="lbl">
                        <asp:Label ID="label4" runat="server" Text="Phone No"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtPhoneNo" runat="server" Width="250px" BorderWidth="3px"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td class="lbl">
                        <asp:Label ID="label5" runat="server" Text="Department"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>MCA</asp:ListItem>
                            <asp:ListItem>MBA</asp:ListItem>
                            <asp:ListItem>BSc</asp:ListItem>
                            <asp:ListItem>BBA</asp:ListItem>
                            <asp:ListItem>BTECH</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                 <tr>
                    <td class="lbl">
                        <asp:Label ID="label6" runat="server" Text="Date of Birth"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                    </td>
                </tr>
                 <tr>
                    <td>
                        
                    </td>
                    <td colspan="2">
                        <asp:Button CssClass="btn" ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" />
                        <asp:Button CssClass="btn1" ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                        <asp:Button CssClass="btn2" ID="btnUpdate" runat="server" Text="Update" />
                        <asp:Button CssClass="btn3" ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td colspan="2">
                       <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gvMastersoft" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField Datafield="FirstName" HeaderText="FirstName" />
                <asp:BoundField Datafield="LastName" HeaderText="LastName" />
                <asp:BoundField Datafield="EmailId" HeaderText="EmailId" />
                <asp:BoundField Datafield="PhoneNo" HeaderText="PhoneNo" />
                <asp:BoundField Datafield="Department" HeaderText="Department" />
                <asp:BoundField Datafield="DateofBirth" HeaderText="DateofBirth " />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="linkView" runat="server" CommandArgument='<%# Eval("Id")%>' OnClick="lnk_OnClick">View</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
          </asp:GridView>
        </div>
    </form>
</body>
</html>
