using Antlr.Runtime;
using Rotativa;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace REDES_1._2.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        static List<Comentario> lista = new List<Comentario>();
        private static double pire_g;
        public static double Pire_g
        {
            get { return pire_g; }
            set { pire_g = value; }
        }
        private static string grafica_pobla;
        public static string Grafica_pobla
        {
            get { return grafica_pobla; }
            set { grafica_pobla = value; }
        }
        private static string grafica_ocupa;
        public static string Grafica_ocupa
        {
            get { return grafica_ocupa; }
            set { grafica_ocupa = value; }
        }
        public ActionResult Index()
        {
            Session["pire"] = "";
            Session["error_señal"] = "";
            Session["flag_pire"] = "";
            Session["potencia_senal"] = "";
            Session["ganancia_senal"] = "";
            Session["latencia_senal"] = "";
            Session["frecuencia_antena"] = "";
            Session["altura_antena"] = "";
            Session["tamano_antena"] = "";
            Session["flag_1000"] = "";
            Session["err_p1000"] = "";
            Session["respuesta_1000W"] = "";
            Session["err_antena"] = "";
            Session["men_30"] = "";
            Session["E_pobla"] = "";
            Session["E_ocupa"] = "";
            Session["H_pobla"] = "";
            Session["H_ocupa"] = "";
            Session["err_Min30"] = "";
            Session["acep_Min30"] = "";
            Session["recom_E_pobla"] = "";
            Session["recom_H_pobla"] = "";
            Session["recom_E_ocupa"] = "";
            Session["recom_H_ocupa"] = "";
            Session["may_30"] = "";
            Session["respuesta_may30"] = "";
            Session["err_may30"] = "";
            Session["d_poblacional"] = "";
            Session["d_ocupacional"] = "";
            Session["flag_grafica"] = "";
            Session["g_ocupacional"] = "";
            Session["g_poblacional"] = "";
            lista.Clear();
            SqlCommand comando;
            comando = new SqlCommand("SELECT comentario, id_persona, FORMAT(fecha, 'dd/MM/yyyy hh:mm tt') fecha FROM Comentarios", Conexion.GetConexion());
            using (SqlDataAdapter adapter = new SqlDataAdapter(comando))
            {
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                string comentario = null, id_persona = null, fecha = null;
                foreach (DataRow row in dt.Rows)
                {
                    comentario = row["comentario"].ToString();
                    id_persona = row["id_persona"].ToString();
                    fecha = row["fecha"].ToString();
                    string nombre = null;
                    SqlCommand comand;
                    comand = new SqlCommand("SELECT nombre FROM Persona p JOIN Comentarios c ON c.id_persona = p.cc " +
                        "WHERE c.id_persona = " + long.Parse(id_persona), Conexion.GetConexion());
                    using (SqlDataAdapter adap = new SqlDataAdapter(comand))
                    {
                        DataTable dt1 = new DataTable();
                        adap.Fill(dt1);
                        foreach (DataRow row1 in dt1.Rows)
                        {
                            nombre = row1["nombre"].ToString();
                        }
                        Comentario com = new Comentario(nombre, fecha, comentario);
                        lista.Add(com);
                    }
                    
                    
                }
            }
            return View(lista);
        }

        public ActionResult Creditos()
        {
            return View();
        }
        public void CerrarSesion()
        {
            Session["nombre"] = null;
            Session["correo"] = null;
            Session["id_usuario"] = null;
            FormsAuthentication.SignOut();
            Response.Redirect("~/Inicio.aspx");
        }

        [HttpPost]
        public ActionResult GuardarComentario(string txt_comentario)
        {
            if (txt_comentario != null || !txt_comentario.Equals(""))
            {
                using (SqlCommand comando = new SqlCommand("INSERT INTO " +
                "Comentarios([comentario], [id_persona]) VALUES (@comentario, @id_persona)", Conexion.GetConexion()))
                {
                    comando.Parameters.AddWithValue("@comentario", txt_comentario);
                    comando.Parameters.AddWithValue("@id_persona", int.Parse(Session["id_usuario"].ToString()));

                    try
                    {
                        comando.ExecuteNonQuery();
                        lista.Clear();
                    }
                    catch (Exception ex) { }
                }
            }
            
            return RedirectToAction("Index", lista);
        }

        [HttpPost]
        public ActionResult Pire(string txt_potencia, string txt_ganancia, string txt_latencia)
        {
            try
            {
                Session["error_señal"] = "";
                double potencia = double.Parse(txt_potencia);
                double ganancia = double.Parse(txt_ganancia);
                double latencia = double.Parse(txt_latencia);
                double pire_aux = potencia + ganancia - latencia;
                pire_aux = pire_aux - 30;
                pire_g = Math.Pow(10, (pire_aux / 10));
                if (pire_g <= 2)
                {
                    Session["pire"] = "LA ESTACIÓN CUMPLE CON LA NORMATIVA. DEBIDO A\n" +
                        "Según las recomendaciones de la ITU-T K.52 para las instaciones con un PIRE menor a 2W la instalación es inerentemente conforme a la normativa";
                } else
                {
                    Session["flag_pire"] = "true";
                    Session["pire"] = "";
                }
                if (pire_g >= 1000)
                {
                    Session["flag_pire"] = "";
                    Session["flag_1000"] = "true";
                }
                Session["potencia_senal"] = potencia;
                Session["ganancia_senal"] = ganancia;
                Session["latencia_senal"] = latencia;
            } catch (Exception ex) {
                Session["error_señal"] = "Por favor llene todos los campos.";
            }
            return View("Index", lista);

        }

        [HttpPost]
        public ActionResult Distancia(string txt_frecuencia, string txt_altura, string txt_tamano)
        {
            double frecuencia = double.Parse (txt_frecuencia);
            double altura = double.Parse (txt_altura);
            double tamano = double.Parse (txt_tamano);
            double r_ocupacional = 0, r_poblacional = 0, pire_f = 0;
            if (frecuencia <= 30 && frecuencia >= 0.1)
            {
                Session["men_30"] = "true";
                Session["may_30"] = "";
                Session["flag_grafica"] = "";
            }
            else if (frecuencia > 30) {
                Session["may_30"] = "true";
                Session["men_30"] = "";
            }
            else if (frecuencia < 0.1 || frecuencia > 300000)
            {
                Session["err_antena"] = "La frecuencia digitada no es valida.";
            }
            else if (frecuencia > 30 && frecuencia <= 400)
            {
                r_poblacional = 0.319 * Math.Sqrt(pire_g);
                r_ocupacional = 0.143 * Math.Sqrt(pire_g);
            }
            else if (frecuencia > 400 && frecuencia <= 2000)
            {
                pire_f = pire_g / frecuencia;
                r_poblacional = 6.38 * Math.Sqrt(pire_f);
                r_ocupacional = 2.92 * Math.Sqrt(pire_f);
            }
            else if (frecuencia > 2000 && frecuencia <= 300000)
            {
                r_poblacional = 0.143 * Math.Sqrt(pire_g);
                r_ocupacional = 0.0638 * Math.Sqrt(pire_g);
            }
            if (frecuencia > 0.1)
            {
                Session["err_antena"] = "";
            }

            
            // double d_poblacional = Math.Sqrt(Math.Pow(r_poblacional, 2) - Math.Pow(altura, 2));
            double landa = 300000000 / (frecuencia * 1000000);
            double d_ocupacional = 3 * landa;
            // double d_poblacional = Math.Max(d_ocupacional, (2 * Math.Pow(tamano, 2)) / landa);
            // double d_ocupacional = Math.Sqrt(Math.Pow(r_ocupacional, 2) - Math.Pow(altura, 2));
            Session["frecuencia_antena"] = frecuencia;
            Session["altura_antena"] = altura;
            Session["tamano_antena"] = tamano;
            // Session["d_poblacional"] = d_poblacional;
            Session["d_ocupacional"] = d_ocupacional;
            return View("Index", lista);
        }

        [HttpPost]
        public ActionResult P1000W(string txt_emisora)
        {
            if (txt_emisora.Equals("NO"))
            {
                Session["flag_pire"] = "true";
                Session["err_p1000"] = "";
                Session["respuesta_1000W"] = "NO";
            } else if (txt_emisora.Equals("SI")) {
                Session["respuesta_1000W"] = "SI";
                Session["err_p1000"] = "Según la resolución 733 de ANE para estaciones que operen con un PIRE mayor o igual a 1000 W " +
                    "y exista una o varias estaciones que operen con un PIRE mayor o igual a 1000 y estas estén ubicadas a una distancia " +
                    "de 100 metros. En estos casos se deberá presentar a la ANE la DCER con las mediciones siguiendo el procedimiento " +
                    "indicado en la sección 3.4.";
                Session["flag_pire"] = "";
            } else
            {
                Session["err_p1000"] = "Selccione una opción.";
            }
            return View("Index", lista);
        }

        [HttpPost]
        public ActionResult Men30(string txt_E_pobla, string txt_H_pobla, string txt_E_ocupa, string txt_H_ocupa)
        {
            double frecuencia = double.Parse(Session["frecuencia_antena"].ToString());
            double E_pobla = double.Parse(txt_E_pobla);
            double H_pobla = double.Parse(txt_H_pobla);
            double E_ocupa = Convert.ToDouble(txt_E_ocupa);
            double H_ocupa = Convert.ToDouble(txt_H_ocupa);
            double E_ocupa_r = 660 / Math.Pow(frecuencia, 0.7);
            double H_ocupa_r = 4.9 / frecuencia;
            double E_pobla_r = 300 / Math.Pow(frecuencia, 0.7);
            double H_pobla_r = 2.2 / frecuencia;
            Session["E_pobla"] = E_pobla;
            Session["H_pobla"] = H_pobla;
            Session["E_ocupa"] = E_ocupa;
            Session["H_ocupa"] = H_ocupa;
            Session["recom_E_pobla"] = "El campo Einc recomendado es de " + E_ocupa_r.ToString("0.##") + " Vm⁻¹";
            Session["recom_H_pobla"] = "El campo Hinc recomendado es de " + H_ocupa_r.ToString("0.##") + " Am⁻¹";
            Session["recom_E_ocupa"] = "El campo Einc recomendado es de " + E_pobla_r.ToString("0.##") + " Vm⁻¹";
            Session["recom_H_ocupa"] = "El campo Hinc recomendado es de " + H_pobla_r.ToString("0.##") + " Am⁻¹";
            if (E_pobla <= E_pobla_r && E_ocupa <= E_ocupa_r && H_pobla <= H_pobla_r && H_ocupa <= H_ocupa_r)
            {
                Session["acep_Min30"] = "Los campos Einc y Hinc, en distacias poblacional y operacional cumplen con la " +
                    "resolución ANE 773.";
            } else
            {
                Session["err_Min30"] = "Para frecuencias de 100 kHz a 30 MHz, independientemente de las distinciones de zona de campo lejano " +
                    "o campo cercano, el cumplimiento se demuestra si ni Einc ni Hinc exceden los valores de nivel de referencia mencionados.";
            }
            return View("Index", lista);
        }

        [HttpPost]
        public ActionResult May30(string txt_imt)
        {
            if (txt_imt.Equals("NO"))
            {
                double frecuencia = 0, tamano = 0, landa = 0, d_ocupacional = 0, d_poblacional = 0;
                Session["err_may30"] = "";
                Session["respuesta_may30"] = "NO";
                Session["flag_grafica"] = "true";
                Session["d_poblacional"] = "";
                frecuencia = double.Parse(Session["frecuencia_antena"].ToString());
                tamano = double.Parse(Session["tamano_antena"].ToString());
                landa = 300000000 / (frecuencia * 1000000);
                d_ocupacional = 3 * landa;
                d_poblacional = Math.Max(d_ocupacional, (2 * Math.Pow(tamano, 2)) / landa);
                Session["d_poblacional"] = d_poblacional;
                Dist_grafica();
            }
            else if (txt_imt.Equals("SI"))
            {
                double frecuencia = 0, tamano = 0, landa = 0, d_poblacional = 0, opc1 = 0;
                Session["err_may30"] = "";
                Session["respuesta_may30"] = "SI";
                Session["d_poblacional"] = "";
                frecuencia = double.Parse(Session["frecuencia_antena"].ToString());
                tamano = double.Parse(Session["tamano_antena"].ToString());
                landa = 300000000 / (frecuencia * 1000000);
                opc1 = Math.Pow(tamano, 2) / (4 * landa);
                d_poblacional = Math.Max(landa, Math.Max(tamano, opc1));
                Session["d_poblacional"] = d_poblacional;
                Session["flag_grafica"] = "true";
                Dist_grafica();
            }
            else
            {
                Session["err_may30"] = "Selccione una opción.";
                Session["flag_grafica"] = "";
            }
            
            return View("Index", lista);
        }

        public void Dist_grafica()
        {
            double altura = double.Parse(Session["altura_antena"].ToString());
            double d_poblacional = double.Parse(Session["d_poblacional"].ToString());
            double d_ocupacional = double.Parse(Session["d_ocupacional"].ToString());
            double g_ocupa = 0, g_pobla = 0;
            if (altura >= d_ocupacional)
            {
                Session["g_ocupacional"] = "0 m";
                grafica_ocupa = "0 m";
            } else
            {
                g_ocupa = d_ocupacional - altura;
                Session["g_ocupacional"] = g_ocupa.ToString("0.##") + " m";
                grafica_ocupa = g_ocupa.ToString("0.##") + " m";
            }

            if (altura >= d_poblacional)
            {
                Session["g_poblacional"] = "0 m";
                grafica_pobla = "0 m";
            } else
            {
                g_pobla = d_poblacional - altura;
                Session["g_poblacional"] = g_pobla.ToString("0.##") + " m";
                grafica_pobla = g_pobla.ToString("0.##") + " m";
            }

            if (g_pobla <= g_ocupa )
            {
                Session["g_poblacional"] = "0 m";
                grafica_pobla = "0 m";
            }
        }

        public ActionResult Report()
        {
            // Session["gr_poblacional"] = Session["g_poblacional"].ToString();
            // Session["gr_ocupacional"] = Session["g_ocupacional"].ToString();
            Session["g_ocupacional"] = grafica_ocupa;
            Session["g_poblacional"] = grafica_pobla;

            return View();
        }

        public ActionResult ExportarPDF()
        {
            return new ActionAsPdf("Report")
            { 
                FileName = "RES773.pdf",
                PageSize = Rotativa.Options.Size.A4,
                PageMargins = new Rotativa.Options.Margins(1, 1, 1, 1)
            };
        }
    }
}