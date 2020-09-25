using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebData.Clases
{
    public class ClsAct
    {
        SqlCommand sqlCommand = null;
        SqlConnection sqlConnection = null;
        SqlParameter sqlParameter = null;
        SqlDataAdapter sqlDataAdapter = null;

        string stConexion;

        public ClsAct()
        {
            ClsConexion obclsConexion = new ClsConexion();
            stConexion = obclsConexion.GetConexion();
        }

        public string stInsertarAct(string Descr)
        {
            try
            {
                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("InsertarAct", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.Add(new SqlParameter("@Descr", Descr));

                
                sqlCommand.ExecuteNonQuery();

                return "Registro exitoso";
            }

            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }
    }

}
