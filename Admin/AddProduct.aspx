<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/FruitMaster.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="OnlineFruitDelivery.Admin.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
        }

        .form-container {
            width: 400px;
            margin: 50px auto;
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 2px 6px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
    font-weight: bold;       /* makes the text bold */
    color: #333;             /* dark gray for better visibility */
    font-size: 16px;         /* bigger font so it's readable */
    display: block;          /* ensures each label is on a new line */
    margin-bottom: 5px;      /* spacing between label and input */
}


        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        asp\:Label {
    font-family: Arial, sans-serif;
    font-size: 14px;
    color: #333;
}
        input[type=text], input[type=number], input[type=file], select, asp\:TextBox, asp\:DropDownList, asp\:FileUpload {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .btn {
            background: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            width: 100%;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn:hover {
            background: #45a049;
        }

        #<%= lblMessage.ClientID %> {
            display: block;
            text-align: center;
            margin-top: 15px;
            font-weight: bold;
        }
       
/* GridView container */

.fruit-grid {
    width: 95%;
    margin: 20px auto;
    border-collapse: separate;
    border-spacing: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15); /* shadow */
    border-radius: 12px;
    overflow: hidden; /* round corner apply */
}

/* Header styling */
.fruit-grid th {
    background: linear-gradient(135deg, #4CAF50, #2e7d32); /* gradient green */
    color: #fff;
    padding: 12px 15px;
    text-align: center;
    font-weight: bold;
    border-bottom: 2px solid #2e7d32;
}

/* Rows styling */
.fruit-grid tr {
    transition: background 0.3s ease;
}

/* Alternate row colors */
.fruit-grid tr:nth-child(even) {
    background-color: #f1f8f4;
}

.fruit-grid tr:nth-child(odd) {
    background-color: #ffffff;
}

/* Row hover effect */
.fruit-grid tr:hover {
    background-color: #c8e6c9;
    cursor: pointer;
}

/* Cell styling */
.fruit-grid td {
    padding: 12px 15px;
    text-align: center;
    border-bottom: 1px solid #ddd;
    color: #333;
    font-size: 14px;
}

/* Last row border remove */
.fruit-grid tr:last-child td {
    border-bottom: none;
}

/* LinkButton styling */
.fruit-grid a {
    display: inline-block;
    color: #2e7d32;
    text-decoration: none;
    font-weight: bold;
    padding: 6px 12px;
    margin: 2px;
    border-radius: 6px;
    border: 1px solid #2e7d32;
    transition: all 0.3s ease;
}

.fruit-grid a:hover {
    background-color: #2e7d32;
    color: #fff;
    text-decoration: none;
}

/* Image styling */
.fruit-grid img {
    border-radius: 8px;
    border: 1px solid #4caf50;
    height: 60px;
    width: 60px;
    object-fit: cover;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<div class="form-container">
        <h2>Add New Fruit</h2>

        <div class="form-group">
            <label>FruitName:</label>
            <asp:TextBox ID="txtFruitName" runat="server" placeholder="Enter fruit name"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Category:</label>
            <asp:DropDownList ID="drpdwn" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpdwn_SelectedIndexChanged">
                <asp:ListItem>--Select Category--</asp:ListItem>
               <%-- <asp:ListItem>Fresh Fruits</asp:ListItem>
                <asp:ListItem>Dried Fruits</asp:ListItem>
                <asp:ListItem>Exotic Fruits</asp:ListItem>--%>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Price:</label>
            <asp:TextBox ID="txtPrice" runat="server" TextMode="Number" placeholder="Enter price"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Quantity:</label>
            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" placeholder="Enter quantity"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Image:</label>
            <asp:FileUpload ID="fldimg" runat="server" />
        </div>

        <asp:Button ID="btnAddFruit" runat="server" Text="Add Fruit" CssClass="btn" OnClick="btnAddFruit_Click"  />

        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>

    </div>     

    <br />
    <br />
    <center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" CssClass="fruit-grid">
        <Columns>
            <asp:TemplateField HeaderText="Id">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FruitName">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("FruitName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField> 
            <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton ID="Edit" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="Delete" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        </center>
</asp:Content>
