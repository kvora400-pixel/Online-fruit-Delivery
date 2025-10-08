<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/FruitMaster.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="OnlineFruitDelivery.Admin.ManageUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        /* GridView container */
        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-family: Arial, sans-serif;
            font-size: 14px;
        }

        /* Table header - green theme */
        .gridview th {
            background-color: #27ae60; /* dark green */
            color: white;
            padding: 10px;
            text-align: center;
        }

        /* Table rows */
        .gridview td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        /* Row hover effect */
        .gridview tr:hover {
            background-color: #d5f5e3; /* light green on hover */
        }

        /* Delete button style - green theme */
        .gridview a,
        .gridview asp\\:LinkButton {
            color: #c0392b; /* red for delete button */
            text-decoration: none;
            font-weight: bold;
        }

        /* Delete button hover */
        .gridview a:hover,
        .gridview asp\\:LinkButton:hover {
            color: white;
            background: #c0392b;
            padding: 5px 10px;
            border-radius: 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

     <center>
        <h2>User List</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview"  Width="748px" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="Id">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Password">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </center>
</asp:Content>
