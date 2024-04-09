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
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
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
    <div class="content" style="background-color: #fff; border-radius: 20px; padding: 20px; margin: 20px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.5); display: flex; justify-content: center;">
        <div class="col-sm-10 p-3" style="text-align: center; color:black">
            <h2>CREDITOS</h2>
            <p>
                Este proyecto fue desarrollado por estudiantes de la Universidad Distrital como proyecto de la materia de Redes Inalámbricas. <br/> 
                Agradecemos el apoyo y la orientación brindados por nuestro profesor durante todo el proceso de desarrollo.<br />
    
                Este proyecto fue concebido con el propósito de crear una aplicación dedicada a evaluar el cumplimiento de la Resolución 773 (2023) de la ANE. 
                Su función principal es permitir a los usuarios conocer las características de su estación transmisora de radiocomunicaciones y 
                obtener un análisis detallado del cumplimiento de dicha resolución. La aplicación ofrece una interfaz intuitiva, gráficos explicativos y 
                enlaces directos al texto relevante de la Resolución 773 para respaldar los resultados obtenidos.
            </p>
            <a href="https://www.udistrital.edu.co/inicio" style="display: block;">
                <img src="img/logo_ud.png" style="max-width: 20%; height: auto; margin: 0 auto;" alt="Logo de la Universidad Distrital"/>
            </a>
            <p>
                <br />
                Equipo de desarrollo: <br />
                Daniel Amaya Montes | <a href="mailto:damayam@udistrital.edu.co">damayam@udistrital.edu.co</a> <br />
                Andres Felipe Rincon Ortiz | <a href="mailto:andrfrincono@udistrital.edu.co">andrfrincono@udistrital.edu.co</a> <br />
                Juan Esteban Rodriguez Marta | <a href="mailto:jerogriguezm@udistrital.edu.co">jerogriguezm@udistrital.edu.co</a> <br />
                Jennifer Acuña Amado | <a href="mailto:jdacunaa@udistrital.edu.co">jdacunaa@udistrital.edu.co</a> <br /><br />

                Agradecimientos: <br />
                Marlon Patiño Bernal | <a href="mailto:marlonpb@udistrital.edu.co">marlonpb@udistrital.edu.co</a> <br />

            </p>
        </div>
    </div>

    <div class="footer" style="background-color: #222; border-radius: 20px; padding: 20px; margin: 20px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);">
    <center><p>&copy; 2024 - Felipe Rincón | Daniel Amaya | Jennifer Acuña | Juan Rodriguez.</p></center>
    </div>

        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/4b5617367e.js" crossorigin="anonymous"></script>
</body>

</html>

