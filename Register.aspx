<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineFruitDelivery.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8f9fa;
        }

        /* wrapper to create spacing from navbar */
        .page-wrapper {
            margin-top: 80px;
        }

        /* card box */
        .container {
            background: #ffffff;
            padding: 35px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            width: 450px;
            margin: 0 auto;
            text-align: center;
        }

        /* heading */
        .container h1 {
            color: #27ae60;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* form table */
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
            color: #333;
            width: 35%;
            text-align: right;
        }

        td:last-child {
            text-align: left;
        }

        /* inputs */
        .textbox, .dropdown {
            width: 95%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .textbox:focus, .dropdown:focus {
            border-color: #27ae60;
            box-shadow: 0 0 5px rgba(39, 174, 96, 0.3);
            outline: none;
        }

        /* radio buttons inline */
        .radio-buttons {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        /* button */
        .btn {
            background-color: #28a745; /* olive green like login */
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
            width: 100%;
            font-weight: bold;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .btn {
   

   
        .btn:hover {
            background-color: #218838;
            transform: scale(1.03);
        }

        /* link under form */
        .link {
            margin-top: 12px;
            display: block;
            font-size: 14px;
            color: #6c63ff;
            text-decoration: none;
        }

        .link:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="page-wrapper">

    <div class="container">
        <br />
        <br />
        <h1>🍏 Fruit Registration</h1>
        <table>
            <tr>
                <td>Name:</td>
                <td>
                    <asp:TextBox ID="txtnum" runat="server" CssClass="textbox"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td>
                    <asp:RadioButtonList ID="rdbgen" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="Male"></asp:ListItem>
                        <asp:ListItem Value="Female"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>
                    <asp:TextBox ID="txteml" runat="server" CssClass="textbox"></asp:TextBox></td>
            </tr>
            <tr>
                <td>City:</td>
                <td>
                    <asp:DropDownList ID="drpcty" runat="server" CssClass="dropdown">
                        <asp:ListItem>---Select---</asp:ListItem>
                        <asp:ListItem>Rajkot</asp:ListItem>
                        <asp:ListItem>Surat</asp:ListItem>
                        <asp:ListItem>Vadodara</asp:ListItem>
                        <asp:ListItem>Pune</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>Password:</td>
                <td>
                    <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox></td>
            </tr>


            <tr>
                <td>Image:</td>
                <td>
                    <asp:FileUpload ID="fldimg" runat="server" /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btn1" runat="server" align="center" Text="Save" OnClick="btn1_Click" /></td>
            </tr>
        </table>
        </div>
    </div>
</asp:Content>
