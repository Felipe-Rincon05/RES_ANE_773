using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace REDES_1._2
{
    public partial class Login : System.Web.UI.Page
    {
        Boolean flag = false;
        SqlCommand comando;
        protected void Page_Load(object sender, EventArgs e)
        {
            flag = false;
            txt_usuario.Focus();
            Session["usuario"] = null;
        }

        protected void btniniciar_Click(object sender, EventArgs e)
        {
            comando = new SqlCommand("SELECT cc, usuario, contra, nombre, correo FROM Persona", Conexion.GetConexion());
            using (SqlDataAdapter adapter = new SqlDataAdapter(comando))
            {
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                string usuario = null, contra = null, nombre = null, correo = null, id_usuario = null;
                foreach (DataRow row in dt.Rows)
                {
                    id_usuario = row["cc"].ToString();
                    usuario = row["usuario"].ToString();
                    contra = row["contra"].ToString();
                    nombre = row["nombre"].ToString();
                    correo = row["correo"].ToString();
                    if (txt_usuario.Text == usuario)
                    {
                        if (txtcontrasena.Text == contra)
                        {
                            Session["correo"] = correo;
                            Session["nombre"] = nombre;
                            Session["id_usuario"] = id_usuario;
                            flag = true;
                            FormsAuthentication.SetAuthCookie(Session["id_usuario"].ToString(), false);
                            Response.Redirect("/Home/Index");
                        }
                    }
                }
                // Conexion.CerrarConexion();
                if (!flag)
                {
                    FormsAuthentication.SignOut();
                    Session["nombre"] = null;
                    Response.Redirect("~/Login.aspx");
                } 
            }
        }
    }
}