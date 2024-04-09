using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace REDES_1._2.Controllers
{
    public class Comentario
    {
        public string nombre_persona { get; set; }
        public string fecha { get; set; }
        public string comentario { get; set; }

        public Comentario(string nombre_persona, string fecha, string comentario)
        {
            this.nombre_persona = nombre_persona;
            this.fecha = fecha;
            this.comentario = comentario;
        }

    }
}