<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Facturacion.aspx.cs" Inherits="facturacionDataguard.Facturacion" %>

<!doctype html>
<html lang="en" class="h-100">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>Sticky Footer Navbar Template · Bootstrap</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sticky-footer-navbar/">

    <!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href=" css/sticky-footer-navbar.css" rel="stylesheet">
  </head>
  <body class="d-flex flex-column h-100">
    <header>
  <!-- Fixed navbar -->
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="#">Facturacion Dataguard</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="/usuario.aspx">nuevo Usuario <span class="sr-only">(current)</span></a>
        </li>
           <li class="nav-item active">
          <a class="nav-link" href="/Producto.aspx">nuevo producto <span class="sr-only">(current)</span></a>
        </li>
      </ul>
    </div>
  </nav>
</header>

<!-- Begin page content -->
<main role="main" class="flex-shrink-0">
  <div class="container">
    <form id="form1" runat="server">
     <div class="form-row">
    <div class="col-md-12">
        <asp:Label ID="Label1" runat="server" Text="Selecione cliente"></asp:Label>
        <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server" class="form-control" OnTextChanged="DropDownList1_TextChanged">
             <asp:ListItem Value="0">&lt;Seleccione un Item&gt;</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="col-md-6">

        <asp:Label ID="Label2" runat="server" Text="Encabezado de la factura"></asp:Label>

        <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>


    </div>
           <div class="col-md-6">
       <asp:Label ID="Label3" runat="server" Text="fecha"></asp:Label>
       <asp:Calendar ID="Calendar1" runat="server"  ></asp:Calendar>
       
    </div>

         <div class="col-md-12">
             <asp:Button ID="Button1" runat="server" CssClass="btn-primary" Text="Generar Factura" OnClick="Button1_Click" />
         </div>

              <div class=" mt-lg-5 col-md-12">

                   <asp:Label ID="Label5" runat="server" Text="Seleccione un producto"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" class="form-control"></asp:DropDownList>

                  
                   <asp:Button ID="Button2" runat="server" CssClass="btn-primary" Text="Agregar Producto" OnClick="Button2_Click" />
    </div>

           <div class=" mt-lg-5 col-md-6">

               <asp:TextBox ID="TextBox2" runat="server">precio</asp:TextBox>
 </div>
           <div class=" mt-lg-5 col-md-6">
               <asp:TextBox ID="TextBox3" runat="server">descripcion</asp:TextBox>
         
 </div>

         <div class=" mt-lg-5 col-md-12">

         <asp:Label ID="Label4" runat="server" Text="Detalle"></asp:Label>

                 
       <asp:GridView ID="GridView1" runat="server"  class="table table-hover table-dark" ></asp:GridView>
 </div>
   <div class="col-md-12">
         <asp:Label ID="Label6" runat="server" CssClass="text-success" Font-Size="Large" Text="TOTAL A PAGAR ES "></asp:Label>
 </div>
  </div>
    </form>
  </div>
</main>

<footer class="footer mt-auto py-3">
  <div class="container">
    <span class="text-muted">Place sticky footer content here.</span>
  </div>
</footer>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>

