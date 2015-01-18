using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace API.Tools
{
    public class ActionParameter : IDataParameter
    {
        public string ParameterName { get; set; }
        public object Value { get; set; }

        // The following aren't yet used but must be implemented per the IDataParameter interface.
        public DbType DbType { get; set; }
        public ParameterDirection Direction { get; set; }
        public bool IsNullable { get { return true; } }
        public string SourceColumn { get; set; }
        public DataRowVersion SourceVersion { get; set; }

        public ActionParameter(string name, object value)
        {
            this.ParameterName = name;
            this.Value = value;
        }
    }

    public class GetAction<T>
    {
        public Func<IDataRecord, T> IDataRecordFunc { get; set; }
        public string ProcedureName { get; set; }

        private List<SqlParameter> _parameters;

        public GetAction()
        {
            _parameters = new List<SqlParameter>();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="parameter"></param>
        /// <remarks>Provide a generic contract for the parameter, but handle specifically.</remarks>
        public void AddParameter(IDataParameter parameter)
        {

            SqlParameter actualParameter = new SqlParameter(parameter.ParameterName, parameter.Value);
            _parameters.Add(actualParameter);
        }

        public  List<T> Execute() {
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

            return result;
        }


    }
}