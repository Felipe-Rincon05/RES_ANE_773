<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="REDES_1._2.Consultas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>INFORES773</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
</head>
<body class="p-3 mb-2 bg-dark text-white">
    <nav class="navbar bg-body-tertiary fixed-top " data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">INFORES773</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel">INFORES773</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Creditos</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Daniel Amaya Montes
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">setnomleinad@gmail.com</a></li>
                                <li><a class="dropdown-item" href="#">1000270957</a></li>
                                <li>
                                <hr class="dropdown-divider" />
                                </li>
                                <li><a class="dropdown-item" href="#">Salir</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <br />
    <br />
    <br />

    <div class="row justify-content-center">
            <!-- Informacion de la res773 -->
            <div class="col-md-8 bg-danger" style="background-color: #fff; border-radius: 20px; padding: 5px; margin: 5px;">
                <h1>Primera Mitad</h1>
                <p>Contenido de la primera mitad.</p>
            </div>
            <!-- Comentarios de los usuarios -->
            <div class="col-md-3 bg-primary" style="background-color: #fff; border-radius: 20px; padding: 5px; margin: 5px;">
                <h1>Segunda Mitad</h1>
                <p>Contenido de la segunda mitad.</p>
            </div>
    </div>
    
    <div class="footer" style="background-color: #222; border-radius: 20px; padding: 10px; margin: 10px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);">
        <center><p>&copy; 2024 - Felipe Rincón | Daniel Amaya | Jennifer Acuña | Juan Rodriguez.</p></center>
    </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/4b5617367e.js" crossorigin="anonymous"></script>
</body>

</html>
