using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
  public  class  Clientes
    {
        public static object listarcliente()
        {
            EntidadesDataContext context = new EntidadesDataContext();
            var query = from u in context.Tb_cliente
                        select u;
            return query;
        }
        public static void crearcliente(string nombre, string apellido,string nit)
        {
            using (EntidadesDataContext objDataContext = new EntidadesDataContext())
            {
                Tb_cliente objEmp = new Tb_cliente();
                // fields to be insert
                objEmp.Nombre = nombre;
                objEmp.Apellido = apellido;
                objEmp.NIT = nit;
                objDataContext.Tb_cliente.InsertOnSubmit(objEmp);
                // executes the commands to implement the changes to the database
                objDataContext.SubmitChanges();
            }
        }

    }
}
