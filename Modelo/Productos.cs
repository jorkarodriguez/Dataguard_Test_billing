using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Productos
    {
        public static object listarproducto()
        {
            EntidadesDataContext context = new EntidadesDataContext();
            var query = from u in context.Producto
                        select u;
            return query;
        }

        public static void AgregarProducto(string NOMBRE,float PRECIO, String DESCRIPCION, int DETALLE)
        {
            using (EntidadesDataContext objDataContext = new EntidadesDataContext())
            {
               Producto objEmp = new Producto();
                // fields to be insert
                objEmp.Nombre = NOMBRE  ;
                objEmp.Precio = PRECIO;
                objEmp.Descripcion =DESCRIPCION ;
                objEmp.Detalle = DETALLE;
                objDataContext.Producto.InsertOnSubmit(objEmp);
                // executes the commands to implement the changes to the database
                objDataContext.SubmitChanges();
            }
        }
        public static void AgregarProductodsdecero(string NOMBRE, float PRECIO, String DESCRIPCION)
        {
            using (EntidadesDataContext objDataContext = new EntidadesDataContext())
            {
                Producto objEmp = new Producto();
                // fields to be insert
                objEmp.Nombre = NOMBRE;
                objEmp.Precio = PRECIO;
                objEmp.Descripcion = DESCRIPCION;
                objEmp.Detalle = null;
                objDataContext.Producto.InsertOnSubmit(objEmp);
                // executes the commands to implement the changes to the database
                objDataContext.SubmitChanges();
            }
        }
    }
}
