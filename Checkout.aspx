<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="OnlineFruitDelivery.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5fff7;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #2c7a4b;
            margin-top: 20px;
        }

        .container {
            width: 80%;
            margin: 30px auto;
            background: #fff;
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px #c0c0c0;
        }

        .fruit-grid {
            width: 100%;
            border-collapse: collapse;
        }

            .fruit-grid th, .fruit-grid td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }

            .fruit-grid th {
                background-color: #e8ffe8;
            }

        .section {
            margin-top: 30px;
        }

        label {
            font-weight: bold;
        }

        .textbox {
            width: 100%;
            padding: 8px;
            margin: 5px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            background-color: #28a745;
            color: white;
            padding: 10px 30px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

            .btn:hover {
                background-color: #218838;
            }

        .total-label {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .message {
            color: darkgreen;
            font-size: 18px;
            font-weight: bold;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <h1>Order Summary</h1>
                <br />
                <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="fruit-grid" DataKeyNames="prod_cart_id">
                    <Columns>
                        <asp:TemplateField HeaderText="Fruit Name">
                            <ItemTemplate>
                                <asp:Label ID="lblFruitName" runat="server" Text='<%# Eval("FruitName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="imgFruit" runat="server" Height="50" Width="50" ImageUrl='<%# Eval("Image") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Total">
                            <ItemTemplate>
                                <%#Convert.ToInt32(Eval("Price"))*Convert.ToInt32(Eval("Quantity")) %>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <div class="section">
                    <asp:Label ID="lblOrderTotal" runat="server" CssClass="total-label" Text="Order Total: ₹0"></asp:Label>
                </div>

                <div class="section">
                    <h2>Shipping Address</h2>
                    <asp:TextBox ID="txtShippingAddress" runat="server" CssClass="textbox" TextMode="MultiLine" Rows="3" placeholder="Enter your shipping address"></asp:TextBox>
                </div>

                <div class="section">
                    <h2>Payment Method</h2>
                    <asp:RadioButtonList ID="rblPaymentMethod" runat="server">
                        <asp:ListItem Text="Cash on Delivery" Value="Cash" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Debit Card" Value="Debit"></asp:ListItem>
                        <asp:ListItem Text="UPI" Value="UPI"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                <div class="section" style="text-align: center;">
                    <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" CssClass="btn" OnClick="btnPlaceOrder_Click" />
                    <br />
                    <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
