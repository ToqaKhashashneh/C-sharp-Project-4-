﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminRooms.aspx.cs" Inherits="Library_Website.Ammar.AdminRooms" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Manage Rooms</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />


    
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


<link href="\Rudaina\css\bootstrap.min.css" rel="stylesheet">

<link href="\Rudaina\css\style.css" rel="stylesheet">
    
    <style>
        .btn-link {
        color: #747d88 !important;
        text-decoration: none !important;
    }

    a {
        text-decoration: none !important;
    }
        body {
            background-color: #f8f9fa;
        }
       
        .btn-group-custom .btn {
            min-width: 120px;
        }
        .room-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 15px;
        }
        .room-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            background: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .room-card:hover {
            transform: translateY(-5px);
        }
        .room-card h5 {
            margin-bottom: 10px;
        }
    </style>

    <script type="text/javascript">
        function confirmDelete(roomId) {
            if (confirm("Are you sure you want to delete this room?")) {
                document.getElementById('<%= HiddenFieldRoomId.ClientID %>').value = roomId;
                document.getElementById('<%= btnConfirmDelete.ClientID %>').click();
            }
            return false;
        }
    </script>
</head>
<body>

        <!-- Navbar start -->
<div class="container-fluid fixed-top">
    <div class="container topbar bg-primary d-none d-lg-block"  style="visibility:hidden!important;">
        <div class="d-flex justify-content-between">
            <div class="top-info ps-2">
                <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">123 Street, New York</a></small>
                <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">Email@Example.com</a></small>
            </div>
            <div class="top-link pe-2">
                <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>
                <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a>
            </div>
        </div>
    </div>
    <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
            <a href="index.html" class="navbar-brand"><h1 class="text-primary display-6">Lengo Loop</h1></a>
            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
            </button>
            <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                <div class="navbar-nav mx-auto">
                 
                    <a href="/Rudaina/Dashboard.aspx" class="nav-item nav-link">Dashboard</a>
                    <div class="nav-item dropdown">
                        <a href="/Rudaina/BookManagment.aspx" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Book Management</a>
                        <div class="dropdown-menu m-0 bg-secondary rounded-0">
                            <a href="/Rudaina/Dashboard.aspx" class="dropdown-item">Modify Books</a>
                            <a href="/Rudaina/Requests.aspx" class="dropdown-item">Request</a>
                          
                        </div>
                    </div>
                    <div class="nav-item dropdown">
    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Rooms mangment</a>
    <div class="dropdown-menu m-0 bg-secondary rounded-0">
        <a href="AdminRooms.aspx" class="dropdown-item">Admin rooms</a>
        <a href="EditRoom.aspx" class="dropdown-item">Edit room</a>
        <a href="AddRoom.aspx" class="dropdown-item">Add room</a>
        <a href="Requests.aspx" class="dropdown-item">Request</a>
    </div>
</div>        
                    <a href='<%= ResolveUrl("~/Rudaina/Home1.aspx") %>' class="btn btn-primary" style="background-color: #7d0ed7ba; border: none; margin-left: 40px;">Log Out</a>

                  
                </div>
            </div>
        </nav>
    </div>
</div>
<!-- Navbar End -->


    <form id="form1" runat="server" style="margin-top: 180px;">
        <div class="container mt-4">
            
            <!-- Header Section -->
            <div class="header-container">
                <h2 class="text-primary">Manage Rooms</h2>
                <div class="btn-group-custom" style="margin-top: 4%;">
                    <asp:Button ID="btnRequests" runat="server" CssClass="btn btn-primary" Text="Requests" PostBackUrl="Requests.aspx" />
                    <asp:Button ID="btnAddRoom" runat="server" CssClass="btn btn-primary" Text="Add Room" PostBackUrl="AddRoom.aspx" />
                         <asp:Button ID="Export" runat="server" CssClass="btn btn-primary" Text="Export" onclick="Export_Click" />
                </div>
            </div>

            <!-- Room Cards Grid -->
            <div class="room-container" runat="server" id="RoomContainer" style="margin-top: 4%;" ></div>

            <!-- Hidden Field to Store Room ID for Deletion -->
            <asp:HiddenField ID="HiddenFieldRoomId" runat="server" />

            <!-- Button to Trigger Server-side Deletion -->
            <asp:Button ID="btnConfirmDelete" runat="server" CssClass="d-none" OnClick="ConfirmDelete_Click" />
        </div>
    </form>

         <!-- Footer Start -->
<div class="container-fluid  text-white-50 footer pt-5 mt-5" style="background-color: #000000;">
    <div class="container py-5">
        <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
            <div class="row g-4">
                <div class="col-lg-3">
                    <a href="#">
                        <h1 class="text-primary mb-0">Lengo Loop</h1>
                        <p class="text-secondary mb-0">Educational Institue</p>
                    </a>
                </div>
                <div class="col-lg-6">
                    <div class="position-relative mx-auto">
                        <input class="form-control border-0 w-100 py-3 px-4 rounded-pill" type="number" placeholder="Your Email">
                        <button type="submit" class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white" style="top: 0; right: 0;">Subscribe Now</button>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="d-flex justify-content-end pt-3">
                        <a class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-youtube"></i></a>
                        <a class="btn btn-outline-secondary btn-md-square rounded-circle" href=""><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row g-5">
            <div class="col-lg-3 col-md-6">
                <div class="footer-item">
                    <h4 class="text-light mb-3">Why People Like us!</h4>
                    <p class="mb-4">typesetting, remaining essentially unchanged. It was 
                        popularised in the 1960s with the like Aldus PageMaker including of Lorem Ipsum.</p>
                    <a href="" class="btn border-secondary py-2 px-4 rounded-pill text-primary">Read More</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="d-flex flex-column text-start footer-item">
                    <h4 class="text-light mb-3">Shop Info</h4>
                    <a class="btn-link" href="">About Us</a>
                    <a class="btn-link" href="">Contact Us</a>
                    <a class="btn-link" href="">Privacy Policy</a>
                    <a class="btn-link" href="">Terms & Condition</a>
                    <a class="btn-link" href="">Return Policy</a>
                    <a class="btn-link" href="">FAQs & Help</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="d-flex flex-column text-start footer-item">
                    <h4 class="text-light mb-3">Account</h4>
                    <a class="btn-link" href="">My Account</a>
                    <a class="btn-link" href="">Shop details</a>
                    <a class="btn-link" href="">Shopping Cart</a>
                    <a class="btn-link" href="">Wishlist</a>
                    <a class="btn-link" href="">Order History</a>
                    <a class="btn-link" href="">International Orders</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6"
                <div class="footer-item">
                    <h4 class="text-light mb-3">Contact</h4>
                    <p>Address: 1429 Netus Rd, NY 48247</p>
                    <p>Email: LengoLoop@gmail.com</p>
                    <p>Phone: +0123 4567 8910</p>
                    <p>Payment Accepted</p>
                    <img src="img/payment.png" class="img-fluid" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Footer End -->
</body>
</html>








