<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearCuenta.aspx.cs" Inherits="REDES_1._2.Crear_cuenta" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="shortcut icon" href="~/img/AntenaOtra.png" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
        <title>Crear cuenta</title>
        <style>
            input[type=number]::-webkit-inner-spin-button, 
            input[type=number]::-webkit-outer-spin-button { 
            -webkit-appearance: none; 
            margin: 0; 
            }

            input[type=number] { -moz-appearance:textfield; }
        </style>
    </head>
    <body class="p-3 mb-2 text-white" style="background-color:#2b3035">
        <nav style="background-color: #212529; border-radius: 8px; top: 0px; left: 0px;" class="navbar p-2" >
            <div class="container-fluid ">
                <a class="navbar-brand" href="#" style="color:white">
                   INFORES773
                </a>
            </div>    
        </nav>
        <div style=" display: flex;  min-height: 80vh; align-items: center;" class="container mt-4 col-lg-7">
            <div class="card col-sm-10 p-3" >
                <div class="card-body" >
                    <h3 style="color:#1F618D;" class="text-center">CREAR CUENTA</h3>
                    <form class="form-sign" id="form1" runat="server">
                       <div class="form-group">
                            <asp:Label ID="lblnombre" runat="server" Text="Nombre:"></asp:Label>
                            <asp:TextBox style=" background-color: #1F618D; border-color: transparent; color:white;" ID="txt_nombre" runat="server" CssClass="form-control" placeholder="Ingrese su nombre" AutoCompleteType="Disabled"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblcc" runat="server" Text="Cedula:"></asp:Label>
                            <asp:TextBox TextMode="Number" oninput="this.value = this.value.replace(/[^0-9]/g, '')" pattern="[0-9]*" style=" background-color: #1F618D; border-color: transparent; color:white;" ID="txt_cc" runat="server" CssClass="form-control" placeholder="Ingrese su cédula de ciudadanía" AutoCompleteType="Disabled"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblcorreo" runat="server" Text="Correo:"></asp:Label>
                            <asp:TextBox style=" background-color: #1F618D; border-color: transparent; color:white;" ID="txt_correo" runat="server" CssClass="form-control" placeholder="Ingrese su correo electrónico" AutoCompleteType="Disabled"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblciudad" runat="server" Text="Ciudad:"></asp:Label>
                            <asp:TextBox style=" background-color: #1F618D; border-color: transparent; color:white;" ID="txt_ciudad" runat="server" CssClass="form-control" placeholder="Ingrese su ciudad" AutoCompleteType="Disabled"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lbltelefono" runat="server" Text="Teléfono:"></asp:Label>
                            <asp:TextBox TextMode="Number" oninput="this.value = this.value.replace(/[^0-9]/g, '')" pattern="[0-9]*" style=" background-color: #1F618D; border-color: transparent; color:white;" ID="txt_telefono" runat="server" CssClass="form-control" placeholder="Ingrese su número de teléfono" AutoCompleteType="Disabled"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblusuario" runat="server" Text="Usuario:"></asp:Label>
                            <asp:TextBox style=" background-color: #1F618D; border-color: transparent; color:white;" ID="txt_usuario" runat="server" CssClass="form-control" placeholder="Ingrese su nombre de usuario" AutoCompleteType="Disabled"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblcontra" runat="server" Text="Contraseña:"></asp:Label>
                            <asp:TextBox style=" background-color: #1F618D; border-color: transparent; color:white;" ID="txt_contra" runat="server" CssClass="form-control" placeholder="Ingrese su contraseña" AutoCompleteType="Disabled"></asp:TextBox>
                        </div>
                        <br />
                        <asp:Button runat="server" style="margin-top: 10px; width: 100%; border-color: #134566; --bs-btn-hover-bg: #1E6CA0" type="submit" class="btn btn-outline" Text="Registrarse" ID="btn_registrarse" OnClick="btn_registrarse_Click"></asp:Button>
                    </form>
                    <br />
                    <asp:Label ID="lbl_error" runat="server" CssClass="text-danger"></asp:Label>
                </div>
            </div>
        </div>
        <br />
        <div class="footer" style="background-color: #222; border-radius: 20px; padding: 10px; margin: 10px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);">
            <center><p>&copy; 2024 - Felipe Rincón | Daniel Amaya | Jennifer Acuña | Juan Rodriguez.</p></center>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/4b5617367e.js" crossorigin="anonymous"></script>
        
    </body>
</html>
