using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace API.Tools
{
    public class GetAction<T>
    {
        public Func<IDataRecord, T> IDataRecordFunc { get; set; }
        public string ProcedureName { get; set; }

        private List<SqlParameter> _parameters;

        public GetAction()
        {
            _parameters = new List<SqlParameter>();
        }

        public void AddParameter(SqlParameter parameter)
        {
            _parameters.Add(parameter);
        }

        public  T[] Execute() {
            List<T> result = new List<T>();
            SqlConnection conn = SongChartsDatabase.Connection();
            SqlCommand command;

            command = new SqlCommand(this.ProcedureName, conn);
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 200;

            foreach (SqlParameter p in _parameters)
            {
                command.Parameters.Add(p);
            }

            try
            {
                conn.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    result.Add(this.IDataRecordFunc.Invoke(reader));
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                command.Dispose();
                command = null;
                conn.Close();
                conn.Dispose();
                conn = null;
            }

            if (result == null) return null;
            return result.ToArray();
        }


    }
}