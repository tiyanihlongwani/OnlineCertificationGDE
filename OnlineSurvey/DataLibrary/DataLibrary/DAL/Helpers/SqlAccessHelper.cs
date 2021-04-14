using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//using log4net;
using System.Reflection;

namespace DataAccessLayer
{
    public class SqlAccessHelper
    {
        //private static readonly ILog Log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);
        private string _connectionString = string.Empty;

        public SqlAccessHelper(string connectionString)
        {
            _connectionString = connectionString;
        }

        public void DisposeConnection(ref SqlConnection connection )
        {
            if(connection != null)
            {
                if(connection.State != ConnectionState.Closed)
                {
                    connection.Close();
                    connection.Dispose();
                    connection = null;
                }
            }
        }

        public void DisposeCommand(ref SqlCommand cmd)
        {
            if (cmd != null)
            {
                if (cmd.Parameters != null)
                {
                    cmd.Parameters.Clear();
                    cmd.Dispose();
                    cmd = null;
                }
            }
        }

        public void DisposeConnection(ref DataTable table)
        {
            if (table != null)
            {
                table.Clear();
                table.Dispose();
                table = null;                

            }
        }

        public void AddParamCmd(ref SqlCommand cmd, string parameterID, SqlDbType sqlType,int parameterSize,ParameterDirection parameterDirection, object parameterValue)
        {
            if (cmd == null) { throw new ArgumentNullException("cmd"); }

            if (parameterID == string.Empty) { throw new ArgumentOutOfRangeException("paramID"); }

            SqlParameter parameter = new SqlParameter();

            parameter.ParameterName = parameterID;
            
            parameter.SqlDbType = sqlType;
            parameter.Direction = parameterDirection;
            if(parameterSize > 0) { parameter.Size = parameterSize; }
            if (parameterValue != null) { parameter.Value = parameterValue; }

            cmd.Parameters.Add(parameter);

        }

        public void SetCommandType(ref SqlCommand cmd, CommandType cmdType,string cmdText )
        {
            cmd.CommandType = cmdType;
            cmd.CommandText = cmdText;
        }

        public void ExecuteScalarCmd(ref SqlCommand cmd, ref int errorNumber)
        {
            SqlConnection conn = null;
            bool connected = false;

            try
            {
                if (cmd == null) { throw new ArgumentNullException("cmd"); }

                conn = new SqlConnection(_connectionString);

                cmd.Connection = conn;

                for (int i = 0; i < 2; i++)
                {
                    try
                    {
                        conn.Open();
                        connected = true;
                        break;
                    }
                    catch (SqlException ex)
                    {
                        //Log.Fatal("Error while trying to connect to the database ",ex);
                        if (ex.ErrorCode == 53)
                        {
                            System.Threading.Thread.Sleep(1000);
                        }
                    }
                }

                if (!connected) { throw new Exception("Could Not connect to SQL Server after 2 tries"); }

                cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                //TODO:Log exception to log file.
                //Log.Fatal("An error occurred while processing ",ex);
            }
            finally
            {
                DisposeConnection(ref conn);
                connected = false;
                GC.Collect();
            }            

        }

        public DataTable ExecuteReaderCmd(ref SqlCommand cmd)
        {
            SqlConnection conn = null;
            bool connected = false;
            SqlDataAdapter dataAdapter = null;
            DataTable returnTable = new DataTable();            

            try
            {
                if (cmd == null) { throw new ArgumentNullException("cmd"); }

                conn = new SqlConnection(_connectionString);

                cmd.Connection = conn;

                for (int i = 0; i < 2; i++)
                {
                    try
                    {
                        conn.Open();
                        connected = true;
                        break;
                    }
                    catch (SqlException ex)
                    {
                        //Log.Fatal("Error while trying to connect to the database ", ex);
                        if (ex.ErrorCode == 53)
                        {
                            System.Threading.Thread.Sleep(1000);
                        }
                    }
                }

                if (!connected) { throw new Exception("Could Not connect to SQL Server after 2 tries"); }

                dataAdapter = new SqlDataAdapter(cmd);               
                dataAdapter.Fill(returnTable);
            }
            catch (Exception ex)
            {

                //TODO:Log exception to log file.
                //Log.Fatal("An error occurred while processing ", ex);
               
            }
            finally
            {
                if (dataAdapter != null)
                {
                    dataAdapter.Dispose();
                    dataAdapter = null;
                }
               
                DisposeConnection(ref conn);
                connected = false;
                GC.Collect();
            }
            return returnTable;

        }
    }
}
