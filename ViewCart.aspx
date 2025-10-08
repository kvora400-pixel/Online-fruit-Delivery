<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="OnlineFruitDelivery.ViewCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4fff4;
            margin: 0;
            padding: 20px;
        }

        h3 {
            color: #2e7d32;
            font-size: 24px;
            margin-bottom: 10px;
            text-align: center;
        }

        .fruit-grid {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(46, 125, 50, 0.2);
            border-radius: 8px;
            overflow: hidden;
        }

            .fruit-grid th {
                background-color: #66bb6a;
                color: white;
                padding: 12px;
                text-align: left;
                font-size: 16px;
            }

            .fruit-grid td {
                padding: 10px;
                border-bottom: 1px solid #e0e0e0;
                font-size: 15px;
                color: #333;
            }

            .fruit-grid tr:hover {
                background-color: #e8f5e9;
            }

            .fruit-grid img {
                border-radius: 6px;
                box-shadow: 0 0 5px rgba(0,0,0,0.1);
            }

        #btnUpdateCart, #btncheck {
            background-color: #43a047;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 10px 5px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

            #btnUpdateCart:hover, #btnCheckout:hover {
                background-color: #388e3c;
            }

        #lblFinalTotal {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #1b5e20;
        }

        input[type="text"] {
            border: 1px solid #c8e6c9;
            border-radius: 4px;
            padding: 5px;
            text-align: center;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>Your Cart</h3>
            <br />
            <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="fruit-grid" DataKeyNames="prod_cart_id">
                <Columns>
                    <asp:TemplateField HeaderText="FruitName">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("FruitName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQuantity" runat="server"
                                Text='<%# Eval("Quantity") %>'
                                Width="50px"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="50" Width="50" ImageUrl='<%# Eval("Image") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnRemove" runat="server"
                                CommandName="Remove"
                                CommandArgument='<%# Eval("prod_cart_id") %>'
                                Text="Remove" ForeColor="Red" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <br />
            <asp:Button ID="btnUpdateCart" runat="server" Text="Update Cart" OnClick="btnUpdateCart_Click" />
            <asp:Button ID="btncheck" runat="server" Text="Check Out" OnClick="btncheck_Click" />
            <br />
            <br />
            <asp:Label ID="lblFinalTotal" runat="server"
                Text="Total: ₹0.00"
                Font-Bold="True"
                ForeColor="Green"
                Font-Size="Large"></asp:Label>
        </div>
    </form>
</body>
</html>
