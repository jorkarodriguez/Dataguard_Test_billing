using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Detalle
    {
        public static object listarFactura(int idusuario)
        {
            EntidadesDataContext context = new EntidadesDataContext();
            var query = from u in context.View_Detallefactura
                        where u.Idusuario==idusuario
                        select u
                       ;
            return query;
        }

        public static object listardetalle()
        {


            EntidadesDataContext context = new EntidadesDataContext();


            try
            {

                var query =
                               context.Detalle_factura
                        .OrderByDescending(t => t.DetallID)
                        .FirstOrDefault();

                return query.DetallID;

            }
            catch(Exception e)
            {

                return null;


            }
           
        }


        public static void creardetalle( int factura, int productos)
        {
            using (EntidadesDataContext objDataContext = new EntidadesDataContext())
            {
                Detalle_factura objEmp = new Detalle_factura();
                // fields to be insert
                objEmp.Factura = factura;
                objEmp.Productos = productos;
                objDataContext.Detalle_factura.InsertOnSubmit(objEmp);
                // executes the commands to implement the changes to the database
                objDataContext.SubmitChanges();
            }
        }


        public static void creardetalleinicial()
        {
            using (EntidadesDataContext objDataContext = new EntidadesDataContext())
            {
                Detalle_factura objEmp = new Detalle_factura();
                // fields to be insert
                objEmp.Factura = null;
                objEmp.Productos = null;
                objDataContext.Detalle_factura.InsertOnSubmit(objEmp);
                // executes the commands to implement the changes to the database
                objDataContext.SubmitChanges();
            }
        }


    }
}
