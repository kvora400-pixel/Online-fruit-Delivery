<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="OnlineFruitDelivery.Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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

            /* underline effect */
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
        /* Container Grid */
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
            width: 260px; /* fixed card width */
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
            height: 180px; /* fixed image height */
            background: #f5f5f5;
            display: flex;
            align-items: center;
            justify-content: center;
        }

            .img-box img {
                width: 100%;
                height: 100%;
                object-fit: cover; /* keeps aspect ratio */
                border-bottom: 1px solid #eee;
            }

        /* Details */
        .detail-box {
            padding: 15px;
            text-align: left;
            background: #1f252e; /* dark background */
            color: #fff; /* font color white */
        }

            .detail-box h5 {
                font-size: 18px;
                font-weight: 600;
                color: #ffffff; /* fruit name white */
                margin-bottom: 6px;
            }

            .detail-box p {
                font-size: 14px;
                color: #d1d1d1; /* lighter gray */
                margin: 3px 0;
            }

        .options {
            margin-top: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

            .options h6 {
                font-size: 16px;
                font-weight: 600;
                color: #ff9f00; /* orange price */
                margin: 0;
            }

        /* Common button style */
        .btn-cart, .btn-view {
            display: inline-block;
            padding: 10px 18px;
            font-size: 15px;
            font-weight: bold;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            color: #fff;
            transition: all 0.3s ease;
            margin: 5px 3px 0 3px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
        }

        /* Add to Cart button */
        .btn-cart {
            background: linear-gradient(45deg, #001f3f, #003366); /* Navy gradient */
        }

            .btn-cart:hover {
                background: linear-gradient(45deg, #003366, #001f3f);
                transform: translateY(-2px);
                box-shadow: 0 6px 10px rgba(0,0,0,0.3);
            }

        /* View Details button */
        .btn-view {
            background: linear-gradient(45deg, #0056b3, #0073e6); /* Blue gradient */
        }

            .btn-view:hover {
                background: linear-gradient(45deg, #0073e6, #0056b3);
                transform: translateY(-2px);
                box-shadow: 0 6px 10px rgba(0,0,0,0.3);
            }

        .fruit-btn {
            background: linear-gradient(45deg, #ff7b00, #ffbb33);
            color: white;
            border: none;
            padding: 12px 28px;
            border-radius: 30px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(255, 150, 50, 0.4);
            font-family: 'Segoe UI', sans-serif;
        }

            .fruit-btn:hover {
                background: linear-gradient(45deg, #ff9800, #ffcc66);
                transform: scale(1.05);
                box-shadow: 0 6px 15px rgba(255, 150, 50, 0.5);
            }

            .fruit-btn:active {
                transform: scale(0.97);
            }

        .label-normal {
            font-family: 'Segoe UI', sans-serif;
            font-size: 18px;
            color: #333;
            font-weight: 500;
            padding: 3px 5px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="heading">
        <h1>our shop</h1>
        <p><a href="home.html">home >></a> shop </p>
    </div>

    <section class="category">

        <%---<h1 class="title">our <span>category</span> <a href="#">view all >></a> </h1>

        <div class="box-container">

            <a href="#" class="box">
                <img src="image/cat-1.png" alt="">
                <h3>fresh fruits</h3>

            </a>

            <a href="#" class="box">
                <img src="image/cat-2.png" alt="">
                <h3>vegetables</h3>
            </a>

            <a href="#" class="box">
                <img src="image/cat-3.png" alt="">
                <h3>organic spices</h3>
            </a>

            <a href="#" class="box">
                <img src="image/cat-4.png" alt="">
                <h3>fresh meat</h3>
            </a>

            <a href="#" class="box">
                <img src="image/cat-5.png" alt="">
                <h3>organic wheat</h3>
            </a>

        </div>

    </section>--%>
        <center>
            <p>
                <asp:Button ID="Button1" runat="server" Text="View Cart" CssClass="fruit-btn" OnClick="Button1_Click" />
                <asp:Label ID="Label3" runat="server" CssClass="label-normal"></asp:Label>
            </p>

            <section class="fruit_section layout_padding">
                <div class="container">
                    <div class="heading_container heading_center">
                        <h2>Our Fruits Category</h2>
                    </div>
                </div>

                <center>
                    <asp:DataList ID="DataList1" runat="server"
                        CellPadding="10" CellSpacing="50" RepeatDirection="Horizontal"
                        RepeatColumns="3" CssClass="menu_items" OnItemCommand="DataList1_ItemCommand1">
                        <ItemTemplate>
                            <div class="box">
                                <div class="img-box">
                                    <asp:Image ID="Image1" runat="server" CssClass="img-fluid"
                                        Height="150px" Width="150px" ImageUrl='<%# Eval("Image") %>' />
                                </div>
                                <div class="detail-box">
                                    <h5><%# Eval("FruitName") %></h5>
                                    <p>Category: <%# Eval("Category") %></p>
                                    <p>Quantity: <%# Eval("Quantity") %></p>
                                    <div class="options">
                                        <h6>₹ <%# Eval("Price") %></h6>
                                    </div>
                                </div>
                                <br />
                                <!-- Add to Cart Button -->
                                <asp:LinkButton ID="lnkCart" runat="server"
                                    CommandName="cmd_add"
                                    CommandArgument='<%# Eval("Id") %>'
                                    CssClass="btn-cart">🛒 Add to Cart</asp:LinkButton>
                                &nbsp;
                <!-- View Details Button -->
                                <asp:LinkButton ID="lnkView" runat="server"
                                    CommandName="cmd_view"
                                    CommandArgument='<%# Eval("Id") %>'
                                    CssClass="btn-view">👁 View Details</asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </center>
            </section>

            <br />
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Previous</asp:LinkButton>
            &nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Next</asp:LinkButton>
        </center>
        <%--<section class="products">

    <h1 class="title"> our <span>products</span> <a href="#">view all >></a> </h1>

    <div class="box-container">

        <div class="box">
            <div class="icons">
                <a href="#" class="fas fa-shopping-cart"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-eye"></a>
            </div>
            <div class="image">
                <img src="image/product-1.jpg" alt="">
            </div>
            <div class="content">
                <h3>organic food</h3>
                <div class="price">$18.99</div>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                </div>
            </div>
        </div>

        <div class="box">
            <div class="icons">
                <a href="#" class="fas fa-shopping-cart"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-eye"></a>
            </div>
            <div class="image">
                <img src="image/product-2.jpg" alt="">
            </div>
            <div class="content">
                <h3>organic food</h3>
                <div class="price">$18.99</div>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                </div>
            </div>
        </div>

        <div class="box">
            <div class="icons">
                <a href="#" class="fas fa-shopping-cart"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-eye"></a>
            </div>
            <div class="image">
                <img src="image/product-3.jpg" alt="">
            </div>
            <div class="content">
                <h3>organic food</h3>
                <div class="price">$18.99</div>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                </div>
            </div>
        </div>

        <div class="box">
            <div class="icons">
                <a href="#" class="fas fa-shopping-cart"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-eye"></a>
            </div>
            <div class="image">
                <img src="image/product-4.jpg" alt="">
            </div>
            <div class="content">
                <h3>organic food</h3>
                <div class="price">$18.99</div>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                </div>
            </div>
        </div>

        <div class="box">
            <div class="icons">
                <a href="#" class="fas fa-shopping-cart"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-eye"></a>
            </div>
            <div class="image">
                <img src="image/product-5.jpg" alt="">
            </div>
            <div class="content">
                <h3>organic food</h3>
                <div class="price">$18.99</div>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                </div>
            </div>
        </div>

        <div class="box">
            <div class="icons">
                <a href="#" class="fas fa-shopping-cart"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-eye"></a>
            </div>
            <div class="image">
                <img src="image/product-6.jpg" alt="">
            </div>
            <div class="content">
                <h3>organic food</h3>
                <div class="price">$18.99</div>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                </div>
            </div>
        </div>

        <div class="box">
            <div class="icons">
                <a href="#" class="fas fa-shopping-cart"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-eye"></a>
            </div>
            <div class="image">
                <img src="image/product-7.jpg" alt="">
            </div>
            <div class="content">
                <h3>organic food</h3>
                <div class="price">$18.99</div>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                </div>
            </div>
        </div>

        <div class="box">
            <div class="icons">
                <a href="#" class="fas fa-shopping-cart"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-eye"></a>
            </div>
            <div class="image">
                <img src="image/product-8.jpg" alt="">
            </div>
            <div class="content">
                <h3>organic food</h3>
                <div class="price">$18.99</div>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                </div>
            </div>
        </div>

    </div>

</section>--%>
    </section>
</asp:Content>
