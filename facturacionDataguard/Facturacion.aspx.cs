using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace facturacionDataguard
{
    public partial class Facturacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Calendar1.Visible = false;
            if (!IsPostBack)
            {
                listar();
              
            }

         

            GridView1.DataSource = Detalle.listarFactura(int.Parse(DropDownList1.SelectedItem.Value));
            GridView1.DataBind();


        }

        private void listar()
        {
            DropDownList1.AppendDataBoundItems = true;
            DropDownList1.DataSource = Clientes.listarcliente();
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataValueField = "idusuario";
            DropDownList1.DataBind();

            DropDownList2.AppendDataBoundItems = true;
            DropDownList2.Items.Add("Seleccione...");
            DropDownList2.DataSource = Productos.listarproducto();
            DropDownList2.DataTextField = "nombre";
            DropDownList2.DataValueField = "ProductoId";
            DropDownList2.DataBind();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)

        {
            try
            {
                int valor = (int)Detalle.listardetalle();
                Crearfactura.AgregarFactura(TextBox1.Text, int.Parse(DropDownList1.SelectedItem.Value), valor + 1, Calendar1.SelectedDate);
                int ultimafactura = (int)Crearfactura.listarultimafactura();
                Detalle.creardetalle(ultimafactura, valor + 1);
            }
            catch(Exception)
            {

                Detalle.creardetalleinicial();
                int valor = (int)Detalle.listardetalle();
                Crearfactura.AgregarFactura(TextBox1.Text, int.Parse(DropDownList1.SelectedItem.Value), valor + 1, Calendar1.SelectedDate);
                int ultimafactura = (int)Crearfactura.listarultimafactura();
                Detalle.creardetalle(ultimafactura, valor + 1);




            }
            
        }

        protected void DropDownList1_TextChanged(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
            GridView1.DataSource = Detalle.listarFactura(int.Parse(DropDownList1.SelectedItem.Value));
            GridView1.DataBind();

            string total  = Pagar.totalapagar(int.Parse(DropDownList1.SelectedItem.Value));

            if (total != null)
            {
                Label6.Text = "TOTAL A PAGAR ES:   Q" + total.ToString();
            }
            else {
                Label6.Text = "TOTAL A PAGAR ES: ";
            }
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int valor = (int)Detalle.listardetalle();
            Productos.AgregarProducto(DropDownList2.SelectedItem.Text,int.Parse(TextBox2.Text),TextBox3.Text,valor);
            GridView1.DataSource = Detalle.listarFactura(int.Parse(DropDownList1.SelectedItem.Value));
            GridView1.DataBind();
            string total = Pagar.totalapagar(int.Parse(DropDownList1.SelectedItem.Value));

            if (total != null)
            {
                Label6.Text = "TOTAL A PAGAR ES:   Q" + total.ToString();
            }
            else
            {
                Label6.Text = "TOTAL A PAGAR ES: ";
            }
        }
    }
}