<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/FruitMaster.Master" AutoEventWireup="true" CodeBehind="ManageOrder.aspx.cs" Inherits="OnlineFruitDelivery.Admin.ManageOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .order-grid {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            text-align: center;
        }

            .order-grid th {
                background-color: #27ae60; /* dark green */
                color: white;
                padding: 10px;
            }

            .order-grid td {
                padding: 8px;
                border-bottom: 1px solid #ddd;
            }

            .order-grid tr:hover {
                background-color: #f2f2f2;
            }

            .order-grid a {
                text-decoration: none;
                color: #007bff;
            }

                .order-grid a:hover {
                    color: #0056b3;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <center>
        <h2>Manage Orders</h2>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            CssClass="order-grid">
            <Columns>

                <asp:TemplateField HeaderText="Order ID">
                    <ItemTemplate>
                        <asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("order_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="User ID">
                    <ItemTemplate>
                        <asp:Label ID="lblUserId" runat="server" Text='<%# Eval("user_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Order Date">
                    <ItemTemplate>
                        <asp:Label ID="lblOrderDate" runat="server" Text='<%# Eval("Order_Date","{0:dd-MM-yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Total Amount">
                    <ItemTemplate>
                        <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("Total_Amount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Order Status">
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Order_Status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Shipping Address">
                    <ItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Shipping_Address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Payment Method">
                    <ItemTemplate>
                        <asp:Label ID="lblPayment" runat="server" Text='<%# Eval("Payment_Method") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </center>
</asp:Content>
