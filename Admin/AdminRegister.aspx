<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminRegister.aspx.cs" Inherits="OnlineFruitDelivery.Admin.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8f9fa;
        }

        .container {
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            width: 500px;
            margin-top: 50px;
        }

        h1 {
            text-align: center;
            color: #28a745; /* parrot green */
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-spacing: 0;
        }

        td {
            padding: 10px 5px;
            vertical-align: middle;
        }

        td:first-child {
            font-weight: bold;
            text-align: right;
            width: 35%;
        }

        td:last-child {
            text-align: left;
        }

        .textbox, .dropdown, .radiolist, .fileupload {
            width: 95%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: 0.3s ease;
        }

        .textbox:focus, .dropdown:focus, .fileupload:focus {
            border-color: #28a745;
            box-shadow: 0 0 6px rgba(40,167,69,0.4);
            outline: none;
        }

        .btn {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
            width: 100%;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background-color: #218838;
            transform: scale(1.03);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                  <center>
    <div class="container">
        <h1>🍏 Fruit Registration</h1>
        <table>
            <tr>
                <td>Name:</td>
                <td>
                    <asp:TextBox ID="txtnum" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td>
                    <asp:RadioButtonList ID="rdbgen" runat="server" CssClass="radiolist" RepeatDirection="Horizontal">
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>
                    <asp:TextBox ID="txteml" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>City:</td>
                <td>
                    <asp:DropDownList ID="drpcty" runat="server" CssClass="dropdown">
                        <asp:ListItem Value="">---Select---</asp:ListItem>
                        <asp:ListItem Value="Rajkot">Rajkot</asp:ListItem>
                        <asp:ListItem Value="Surat">Surat</asp:ListItem>
                        <asp:ListItem Value="Vadodara">Vadodara</asp:ListItem>
                        <asp:ListItem Value="Pune">Pune</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Image:</td>
                <td>
                    <asp:FileUpload ID="fldimg" runat="server" CssClass="fileupload" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btn1" runat="server" Text="Save" CssClass="btn" OnClick="btn1_Click"  />
                </td>
            </tr>
        </table>
    </div>
        </div>
      
    </form>
</body>
</html>
