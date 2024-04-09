<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="REDES_1._2.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>INFORES773</title>
    <link rel="shortcut icon" href="~/img/AntenaOtra.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
</head>
<body class="p-3 mb-2 text-white" style="background-color:#2b3035">
        <nav style="background-color: #212529; border-radius: 8px" class="p-2 navbar navbar-expand-sm navbar-toggleable-sm" >
            <div class="container-fluid ">
                <a class="navbar-brand" href="#" style="color:white">
                   INFORES773
                </a>
            </div>  
            <form runat="server">
                 <ul class="navbar-nav d-grid gap-2 d-md-flex justify-content-md-end">
                     <li>
                         <asp:Button style="background-color: #0A7B18; border-color:transparent;" runat="server" type="button" class="btn btn-outline-dark" Text="Acceder" ID="btn_acceder" OnClick="btn_acceder_Click"></asp:Button></li>
                     <li>
                         <asp:Button style="background-color: #1F618D; border-color:transparent;" runat="server" type="button" class="btn btn-outline-dark text-nowrap" Text="Crear cuenta" ID="btn_crear_cuenta" OnClick="btn_crear_cuenta_Click"></asp:Button></li>
                 </ul>
             </form>
            
        </nav>

        
        <div class="content" style="background-color: #fff; border-radius: 20px; padding: 10px; margin: 10px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);">
            <div class="row justify-content-center">

                    <div class="col-md-5" style="background-color: #fff; border-radius: 20px; padding: 10px; margin: 1px; display: flex; justify-content: center; align-items: center;">
                        <img src="img/img_redes_1.png" style="max-width: 100%; height: auto; margin: 0 auto;"/>
                    </div>

                    <div class="col-md-5" style="background-color: #fff; border-radius: 20px; padding: 10px; margin: 1px; display: flex; justify-content: center; align-items: center;">
                        <img src="img/img_redes_2.png" style="max-width: 100%; height: auto; margin: 0 auto;"/>

                    </div>

                    <div class="col-md-10" style="border-radius:12px; padding: 10px; margin: 1px; display: flex; justify-content: center; align-items: center;">
                        <img src="img/img_redes_3.png" style="max-width: 100%; height: auto; margin: 0 auto;"/>
                    </div>
            </div>
            
        </div>

        <div class="footer" style="background-color: #222; border-radius: 20px; padding: 10px; margin: 10px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);">
        <center><p>&copy; 2024 - Felipe Rincón | Daniel Amaya | Jennifer Acuña | Juan Rodriguez.</p></center>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/4b5617367e.js" crossorigin="anonymous"></script>
    </body>

</html>
