using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Crearfactura
    {
        public static void AgregarFactura(string encabezado, int nombre , int detalle,DateTime fecha)
        {
            using (EntidadesDataContext objDataContext = new EntidadesDataContext())
            {
                Tb_Factura objEmp = new Tb_Factura();
                // fields to be insert
                objEmp.Encabezado = encabezado;
                objEmp.Cliente = nombre;
                objEmp.Detalle = detalle;
                objEmp.fecha = fecha;
                objDataContext.Tb_Factura.InsertOnSubmit(objEmp);
                // executes the commands to implement the changes to the database
                objDataContext.SubmitChanges();
            }
        }

        public static object listarultimafactura()
        {
            EntidadesDataContext context = new EntidadesDataContext();
            var query =
                context.Tb_Factura
         .OrderByDescending(t => t.FacturaId)
         .FirstOrDefault();
            return query.FacturaId;
        }


        public static object listarfacturacliente(int idusuario)
        {
            EntidadesDataContext context = new EntidadesDataContext();
            var query = from u in context.Tb_Factura
                        where u.Cliente == idusuario
                        select u
                       ;
            return query;
        }


    }
}
