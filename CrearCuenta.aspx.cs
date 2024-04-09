using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REDES_1._2
{
    public partial class Crear_cuenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbl_error.Text = "";
            }
        }

        protected void btn_registrarse_Click(object sender, EventArgs e)
        {
            if (!txt_cc.Text.Equals("") && !txt_nombre.Text.Equals("") && !txt_correo.Text.Equals("") && !txt_ciudad.Text.Equals("")
                && !txt_telefono.Text.Equals("") && !txt_usuario.Text.Equals("") && !txt_contra.Text.Equals(""))
            {
                long cc = long.Parse(txt_cc.Text);
                string nombre = txt_nombre.Text;
                string correo = txt_correo.Text;
                string ciudad = txt_ciudad.Text;
                long tel = long.Parse(txt_telefono.Text);
                string usuario = txt_usuario.Text;
                string contra = txt_contra.Text;
                using (SqlCommand comando = new SqlCommand("INSERT INTO Persona ([cc], [nombre], [correo], [ciudad], [tel]," +
                    "[usuario], [contra]) VALUES (@cc, @nombre, @correo, @ciudad, @tel, @usuario, @contra)", Conexion.GetConexion()))
                {
                    comando.Parameters.AddWithValue("@cc", cc);
                    comando.Parameters.AddWithValue("@nombre", nombre);
                    comando.Parameters.AddWithValue("@correo", correo);
                    comando.Parameters.AddWithValue("@ciudad", ciudad);
                    comando.Parameters.AddWithValue("@tel", tel);
                    comando.Parameters.AddWithValue("@usuario", usuario);
                    comando.Parameters.AddWithValue("@contra", contra);

                    Conexion.GetConexion();
                    int columnasAfectadas = 0;
                    try
                    {
                        columnasAfectadas = comando.ExecuteNonQuery();

                    }
                    catch (Exception ex)
                    {
                        lbl_error.Text = "Revise los datos. Puede que haya una cuenta existente con ese número de cedula.";
                    }
                    if (columnasAfectadas > 0)
                    {
                        Response.Redirect("Login.aspx");
                    }
                }

            } else
            {
                lbl_error.Text = "Existen campos vacios.";
            }
        }
    }
}