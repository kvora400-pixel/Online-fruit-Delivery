<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="OnlineFruitDelivery.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
        }
        .contact-form {
            width: 400px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 8px rgba(0,0,0,0.2);
        }
        .contact-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-control {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
        }
        input[type=text], input[type=email], textarea {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        textarea {
            height: 100px;
        }
        .btn-submit {
            background: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background: #45a049;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="heading">
        <h1>contact us</h1>
        <p><a href="home.html">home >></a> contact </p>
    </div>

    <section class="contact">

        <div class="icons-container">

            <div class="icons">
                <i class="fas fa-phone"></i>
                <h3>our number</h3>
                <p>+123-456-7890</p>
                <p>+111-222-3333</p>
            </div>

            <div class="icons">
                <i class="fas fa-envelope"></i>
                <h3>our email</h3>
                <p>shaikhanas#gmail.com</p>
                <p>anasbhai@gmail.com</p>
            </div>

            <div class="icons">
                <i class="fas fa-map-marker-alt"></i>
                <h3>our address</h3>
                <p>mumbai, india - 400104</p>
            </div>

        </div>

         <div class="contact-form">
            <h2>Contact Us</h2>
            
            <div class="form-control">
                <label for="txtName">FullName</label>
                <asp:TextBox ID="txtName" runat="server" />
            </div>
            
            <div class="form-control">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />
            </div>
            
            <div class="form-control">
                <label for="txtSubject">Subject</label>
                <asp:TextBox ID="txtSubject" runat="server" />
            </div>
            
            <div class="form-control">
                <label for="txtMessage">Message</label>
                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" />
            </div>
            
            <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn-submit" OnClick="btnSubmit_Click" />
            
            <br /><br />
            <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
        </div>
       <%-- <div class="row">

            <form action="">
                <h3>get in touch</h3>
                <div class="inputBox">
                    <input type="text" placeholder="enter your name" class="box">
                    <input type="email" placeholder="enter your email" class="box">
                </div>
                <div class="inputBox">
                    <input type="number" placeholder="enter your number" class="box">
                    <input type="text" placeholder="enter your subject" class="box">
                </div>
                <textarea placeholder="your message" cols="30" rows="10"></textarea>
                <input type="submit" value="send message" class="btn">
            </form>

            <iframe class="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30153.788252261566!2d72.82321484621745!3d19.141690214227783!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7b63aceef0c69%3A0x2aa80cf2287dfa3b!2sJogeshwari%20West%2C%20Mumbai%2C%20Maharashtra%20400047!5e0!3m2!1sen!2sin!4v1633968347413!5m2!1sen!2sin" allowfullscreen="" loading="lazy"></iframe>

        </div>--%>

    </section>




</asp:Content>
