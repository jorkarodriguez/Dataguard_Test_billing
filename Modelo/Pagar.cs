using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Pagar
    {
        public static string totalapagar(int idusuario)
        {
            try {

                EntidadesDataContext context = new EntidadesDataContext();
                var query = context.View_TOTAL_A_PAGAR
                    .Where(t => t.Idusuario == idusuario)
                    .OrderByDescending(t => t.Idusuario)

            .FirstOrDefault();

            
                return query.total.Value.ToString();

            }
            catch (Exception e)
            {

                return null;
            }

            
        }


    }
}
