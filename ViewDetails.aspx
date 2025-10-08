<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="OnlineFruitDelivery.ViewDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Heading */
        .heading_container h2 {
            font-size: 32px;
            font-weight: 700;
            color: #4CAF50; /* green theme */
            text-align: center;
            position: relative;
            display: inline-block;
            padding-bottom: 8px;
            margin-bottom: 25px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .heading_container h2::after {
            content: "";
            width: 60px;
            height: 3px;
            background: #ff9f00; /* orange underline */
            position: absolute;
            left: 50%;
            bottom: 0;
            transform: translateX(-50%);
            border-radius: 2px;
        }

        /* Container */
        .menu_items {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
            margin-top: 30px;
        }

        /* Card */
        .box {
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            width: 280px; /* fixed width */
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .box:hover {
            transform: translateY(-6px);
            box-shadow: 0px 10px 25px rgba(0,0,0,0.2);
        }

        /* Image */
        .img-box {
            width: 100%;
            height: 200px;
            background: #f5f5f5;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .img-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-bottom: 1px solid #eee;
        }

        /* Details */
        .detail-box {
            padding: 15px;
            text-align: left;
            background: #1f252e; /* dark background */
            color: #fff;
        }

        .detail-box h5 {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 5px;
            color: #4CAF50; /* green for ID */
        }

        .detail-box h4 {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 8px;
            color: #ffffff; /* white for product name */
        }

        .detail-box p {
            font-size: 15px;
            color: #d1d1d1;
            margin: 5px 0;
        }

        .options {
            margin-top: 10px;
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }

        .options h6 {
            font-size: 18px;
            font-weight: 600;
            color: #ff9f00; /* orange price */
            margin: 0;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .box {
                width: 100%;
                max-width: 90%;
            }

            .img-box {
                height: 180px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div>
     
        <div>
        <center>
            <!-- Heading -->
            <div class="heading_container">
                <h2>View Details</h2>
            </div>
            <br />

            <!-- DataList -->
            <asp:DataList ID="DataList1" runat="server"
                CellPadding="10" CellSpacing="30" RepeatDirection="Horizontal"
                RepeatColumns="3" CssClass="menu_items">
                <ItemTemplate>
                    <div class="box">
                        <div class="img-box">
                            <asp:Image ID="Image1" runat="server" CssClass="img-fluid"
                                Height="250px" Width="250px" ImageUrl='<%# Eval("Image") %>' />
                        </div>
                        <div class="detail-box">
                            <h5>🆔 
                                <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </h5>
                            <h4>
                                <asp:Label ID="lblFruitName" runat="server" Text='<%# Eval("FruitName") %>'></asp:Label>
                            </h4>
                            <p>
                                Category: 
                                <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                            </p>
                            <p>
                                Price: ₹ 
                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </center>
    </div>
</asp:Content>
