<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="OnlineFruitDelivery.Admin.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8f9fa;
        }

        .page-wrapper {
            margin-top: 80px;
        }

        .container {
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            width: 450px;
            margin: 0 auto;
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
            width: 40%;
        }

        td:last-child {
            text-align: left;
        }

        .textbox {
            width: 95%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: 0.3s ease;
        }

        .textbox:focus {
            border-color: #28a745;
            box-shadow: 0 0 6px rgba(40, 167, 69, 0.4);
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

        .clickLink {
            margin-top: 10px;
            text-align: center;
            color: #28a745;
        }

        .clickLink a {
            text-decoration: none;
            color: #28a745;
        }

        .clickLink a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
           <div class="page-wrapper">
            <div class="container">
                <h1>🍏 Admin Login</h1>
                <table>
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
                        <td></td>
                        <td>
                            <asp:Button ID="btn1" runat="server" Text="Login" CssClass="btn" OnClick="btn1_Click"    />
                            <div class="clickLink">
                                <a href="AdminRegister.aspx">New Admin? Click Here...</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        </div>
        </div>
    </form>
</body>
</html>
