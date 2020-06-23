using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace facturacionDataguard
{
    public partial class Producto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Productos.AgregarProductodsdecero(TextBox1.Text,float.Parse(TextBox2.Text),TextBox3.Text);
        }
    }
}