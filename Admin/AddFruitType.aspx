<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/FruitMaster.Master" AutoEventWireup="true" CodeBehind="AddFruitType.aspx.cs" Inherits="OnlineFruitDelivery.Admin.AddFruit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: #0b1118; /* deep dark background */
            color: black;
        }

        h2 {
            color: #9ccc65; /* another light green */
        }

        table {
            border: 2px solid #4caf50; /* green border */
            padding: 15px;
            border-collapse: collapse;
            background-color: #e8f5e9; /* very light green */
        }

        td {
            padding: 10px;
            font-size: 16px;
        }

        asp\:TextBox, input[type="text"] {
            padding: 5px;
            border: 1px solid #4caf50;
            border-radius: 4px;
        }

        asp\:Button, input[type="submit"], button {
            background-color: #4caf50;
            color: white;
            padding: 8px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

            asp\:Button:hover, button:hover, input[type="submit"]:hover {
                background-color: #45a049; /* slightly darker green on hover */
            }

        center {
            margin-top: 50px;
        }

        .fruitGreen {
            width: 90%; /* grid size */
            margin: 20px auto; /* center grid */
            border-collapse: collapse;
            font-family: Arial, sans-serif;
            font-size: 14px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15); /* outer box shadow */
            border-radius: 8px;
            overflow: hidden; /* round corners apply properly */
            color: black;
        }

            /* Header */
            .fruitGreen th {
                background: linear-gradient(90deg, #2e7d32, #43a047); /* stylish green */
                color: #fff;
                padding: 12px;
                text-align: center;
                border: 1px solid #1b5e20;
                font-weight: bold;
                text-transform: uppercase;
            }

            /* Cells */
            .fruitGreen td {
                border: 1px solid #c8e6c9;
                padding: 10px;
                text-align: center;
                background-color: #ffffff;
            }

            /* Alternate rows */
            .fruitGreen tr:nth-child(even) td {
                background-color: #f1f8f4;
            }

            /* Hover row */
            .fruitGreen tr:hover td {
                background-color: #dcedc8;
                transition: 0.3s;
            }

            /* Edit Button */
            .fruitGreen .LinkButtonEdit {
                display: inline-block;
                background: #e8f5e9;
                color: #2e7d32;
                font-weight: bold;
                padding: 5px 12px;
                border: 1px solid #2e7d32;
                border-radius: 5px;
                text-decoration: none;
                cursor: pointer;
            }

                .fruitGreen .LinkButtonEdit:hover {
                    background: #2e7d32;
                    color: black;
                }

            /* Delete Button */
            .fruitGreen .LinkButtonDelete {
                display: inline-block;
                background: #ffebee;
                color: #c62828;
                font-weight: bold;
                padding: 5px 12px;
                border: 1px solid #c62828;
                border-radius: 5px;
                text-decoration: none;
                cursor: pointer;
            }

                .fruitGreen .LinkButtonDelete:hover {
                    background: #c62828;
                    color: white;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <center>
        <h2>Add FruitType</h2>
        <table border="3">
            <tr>
                <td>FruitType:</td>
                <td>
                    <asp:TextBox ID="txtnm" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" /></td>
            </tr>
        </table>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="fruitGreen" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="Id">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FruitType">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("FruitType") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButtonEdit" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt" CssClass="LinkButtonEdit">Edit</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt" CssClass="LinkButtonDelete">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </center>
</asp:Content>
