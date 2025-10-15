<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/FruitMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OnlineFruitDelivery.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }


        .menu {
            background: #28a745;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }

            .menu h1 {
                margin: 0;
                font-size: 20px;
                font-weight: bold;
            }

            .menu a {
                color: white;
                text-decoration: none;
                margin-left: 15px;
                font-weight: bold;
                transition: 0.3s;
            }

                .menu a:hover {
                    text-decoration: underline;
                }


        .dashboard-container {
            max-width: 900px;
            margin: 30px auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 10px;
        }


        .card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 3px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 5px 12px rgba(0,0,0,0.15);
            }

            .card h3 {
                margin: 0 0 10px;
                font-size: 20px;
                color: #333;
            }

            .card p {
                color: #777;
                font-size: 14px;
            }


       /* .welcome {
            text-align: center;
            margin-top: 20px;
            color: #555;
        }*/
        .welcome {
    text-align: center;
    margin-top: 20px;
    color: #ffffff; /* white text for dark background */
}

        .summary-section {
            text-align: center;
            margin-top: 40px;
        }

        .summary-box {
            display: inline-block;
            background: white;
            border-radius: 12px;
            padding: 20px 30px;
            margin: 10px;
            box-shadow: 0 3px 8px rgba(0,0,0,0.1);
        }

            .summary-box h4 {
                color: #2c7a4b;
                margin-bottom: 5px;
            }

            .summary-box span {
                font-size: 22px;
                font-weight: bold;
                color: white;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="dashboard-container">
        <%--<div class="card">
            <h3>Manage Fruits</h3>
            <p>Add, update, or delete fruit items.</p>
            <a href="ManageFruits.aspx" style="color: #28a745; font-weight: bold;">Go →</a>
        </div>--%>
        <div class="card">
            <h3>Manage Orders</h3>
            <p>View and update customer orders.</p>
            <a href="ManageOrder.aspx" style="color: #28a745; font-weight: bold;">Go →</a>
        </div>
        <div class="card">
            <h3>Manage Users</h3>
            <p>View, block, or manage user accounts.</p>
            <a href="ManageUser.aspx" style="color: #28a745; font-weight: bold;">Go →</a>
        </div>
    </div>
    <div class="summary-section">
        <div class="summary-box">
            <h4>Total Fruits</h4>
            <span>
                <asp:Label ID="lblTotalFruits" runat="server" Text="0"></asp:Label></span>
        </div>
        <div class="summary-box">
            <h4>Total Orders</h4>
            <span>
                <asp:Label ID="lblTotalOrders" runat="server" Text="0"></asp:Label></span>
        </div>
        <div class="summary-box">
            <h4>Total Users</h4>
            <span>
                <asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label></span>
        </div>
        <div class="summary-box">
            <h4>Total Revenue</h4>
            <span>₹<asp:Label ID="lblTotalRevenue" runat="server" Text="0"></asp:Label></span>
        </div>
    </div>


    <div class="welcome">
        <h3>Welcome, <%= Session["Admin"] %> 👋</h3>
        <p>Use the cards above to manage your website efficiently.</p>
    </div>
</asp:Content>
