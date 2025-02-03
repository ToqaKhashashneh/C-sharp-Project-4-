﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="All books.aspx.cs" Inherits="Library_Website.Toqa.All_books" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>aaaaaaaaa</title>
    <%--<link rel="stylesheet" href="All books.css">--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">


    <style>

        .card {
            transition: transform 0.3s, box-shadow 0.3s;

        }

            .card .card-img-top:hover {
                transform: scale(1.05);
                box-shadow: 0 1vw 2vw rgba(0, 0, 0, 0.3);
            }

            .card-img-top { 
    height: 29vw;}

            .filter-container {
    margin: 40px 0px 30px 0px;
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 0px;
    font-size: 16px;
    color: #888;
    display: flex;
    align-items: center;
    width: 250px;
    justify-content: space-between;
    cursor: pointer;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        margin-left: 37vw;

}
    .filter-container select {
        font-size: 14px;
        padding: 6px 10px;
        border: none;
        border-radius: 5px;
        outline: none;
        background-color: #fff;
        color: #555;
        cursor: pointer;
        transition: border 0.3s ease;
        width: 100%;
        height: 100%;
    }

        .filter-container select:focus {
            border-color: #007bff; 
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); 
        }

    </style>




</head>
<body>
    <form id="form1" runat="server">
        <div>

            <!-- Search  -->

            <div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="input-group">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search here..." />
                            <asp:Button ID="btnSearch" runat="server" Text="🔍" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                            <asp:Label ID="searchresult" runat="server" Visible="false" />
                        </div>
                    </div>
                </div>
            </div>


            <!--Search-->
            <!--filter-->
            <div class="filter-container">
    <asp:DropDownList ID="filterOptions" runat="server" OnSelectedIndexChanged="btnSearch_Click" AutoPostBack="true">
        <asp:ListItem Value="all">All Books</asp:ListItem>
        <asp:ListItem Value="available">Available Only</asp:ListItem>
        <asp:ListItem Value="notAvailable">Not Available</asp:ListItem>
    </asp:DropDownList>
</div>

            <!--filter-->

            <div class="container my-5">
                <h1 class="text-center mb-4">Books Collection</h1>
                <div class="row">

<div class="container">
    <div class="row" id="booksContainer" runat="server"></div>
</div>


<%--              <script>
                  function borrowBook(bookId) {
                      fetch("BorrowBookHandler.aspx?bookId=" + encodeURIComponent(bookId))
                          .then(response => {
                              if (!response.ok) {
                                  console.error("Error: Failed to process request.");
                                  return;
                              }
                              return response.text();
                          })
                          .then(data => {
                              console.log("Redirecting to BorrowBook.aspx with bookId:", bookId);
                              window.location.href = "BorrowBook.aspx?bookId=" + encodeURIComponent(bookId);
                          })
                          .catch(error => console.error('Fetch Error:', error));
                  }
              </script>
--%>

                    


        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    




</body>
</html>
