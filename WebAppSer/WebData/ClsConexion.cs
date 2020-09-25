using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebData
{
    class ClsConexion
    {
        public string GetConexion()
        {
            return ConfigurationManager.ConnectionStrings["Jan"].ToString();
        }
    }
}
