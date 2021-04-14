using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
//using log4net;

namespace BusinessLogicLayer
{
   public partial  class Globals
    {
        public delegate int ScalarDelegate(string[] args,ref int errorNumber);
        public delegate int ScalarDelegate2(string[] args,ref int errorNumber, ref string errorMessage);
        public delegate DataTable ReaderDelegate(string[] args, ref int errorNumber);
        public delegate DataTable ReaderDelegate2(string[] args, ref int errorNumber, ref string errorMessage);
        //private readonly static ILog log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);
        public static byte[] CreateHash(string data)
        {
            MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
            UTF8Encoding encoder = new UTF8Encoding();

            return md5Hasher.ComputeHash(encoder.GetBytes(data));
        }

        public static int ExecuteScalar(ScalarDelegate scalar, string[] args, ref int errorNumber,Func<MethodBase> method)
        {
            int successful = 0;
            try
            {
                errorNumber = scalar(args,ref errorNumber);
                successful = 1;
            }
            catch (Exception ex)
            {
               // log.Error("Error while executing", ex);
                //TODO: Code to log error.
            }

            return successful;
        }
        public static int ExecuteScalar(ScalarDelegate2 scalar, string[] args, ref int errorNumber,ref string errorMessage, Func<MethodBase> method)
        {
           
            try
            {
                errorMessage = string.Empty;
                errorNumber = scalar(args,ref errorNumber,ref errorMessage);
              
            }
            catch (Exception ex)
            {
                //TODO: Code to log error.
              //  log.Error("Error while executing", ex);
            }

            return errorNumber;
        }

        public static List<T> ExecuteReaderList<T>(ReaderDelegate reader, string[] args, ref int errorNumber, Func<MethodBase> method )
        {
            DataTable dataTable = new DataTable(); ;
            List<T> returnList = new List<T>();
            T newObject ;

            try
            {
                dataTable = reader(args,ref errorNumber);

                if (dataTable == null || dataTable.Rows.Count == 0) { return returnList; }

                foreach (DataRow row in dataTable.Rows)
                {
                    newObject = (T)Activator.CreateInstance(typeof(T));

                    foreach (DataColumn column in dataTable.Columns)
                    {
                        if (!row.IsNull(column.ColumnName))                       
                        {
                            PropertyInfo objectProperty = typeof(T).GetProperty(column.ColumnName);
                            if (objectProperty == null)
                            { }

                            objectProperty.SetValue(newObject, Convert.ChangeType(row[column.ColumnName], objectProperty.PropertyType), null);

                        }
                    }

                    returnList.Add(newObject);
                }
            }
            catch(Exception ex)
            {
               // log.Error("Error while executing, please confirm class properties against returned columns from table.", ex);
                returnList = null;
            }
            finally
            {
                Globals.DisposeDataTable(dataTable);
            }
            return returnList;
        }

        public static List<T> ExecuteReaderList<T>(ReaderDelegate2 reader, string[] args, ref int errorNumber,ref string errorMessage, Func<MethodBase> method)
        {
            DataTable dataTable = null;
            List<T> returnList = new List<T>();
            T newObject;

            try
            {
                dataTable = reader(args, ref errorNumber, ref errorMessage);

                if (dataTable == null || dataTable.Rows.Count == 0) { return returnList; }

                foreach (DataRow row in dataTable.Rows)
                {
                    newObject = (T)Activator.CreateInstance(typeof(T));

                    foreach (DataColumn column in dataTable.Columns)
                    {
                        if (!row.IsNull(column.ColumnName))
                        {
                            PropertyInfo objectProperty = typeof(T).GetProperty(column.ColumnName);
                            if (objectProperty == null)
                            { }

                            var propertyType = objectProperty.PropertyType;
                            if (System.Nullable.GetUnderlyingType(propertyType) != null)
                            {
                                //Nullable type
                                var val = row[column.ColumnName];
                                objectProperty.SetValue(newObject, val);
                            }
                            else
                            {
                                //Not a nullable type
                                objectProperty.SetValue(newObject, Convert.ChangeType(row[column.ColumnName], objectProperty.PropertyType), null);

                            }
                        }
                    }

                    returnList.Add(newObject);
                }
            }
            catch (Exception ex)
            {
               /// log.Error("Error while executing, please confirm class properties against returned columns from table.", ex);
                returnList = null;
            }
            finally
            {
                Globals.DisposeDataTable(dataTable);
            }
            return returnList;
        }
        public static string ValidateIdNumber(string idNumber, ref string fullDate, ref string gender)
        {
            bool valid = true;
            if (idNumber.Length != 13)
            {
                return "Invalid Id Number";
            }

            string dob = (Convert.ToInt32(idNumber.Substring(0, 2)) > (Convert.ToInt32(DateTime.Now.Year) - 2000) ? "19" : "20") + idNumber.Substring(0, 2).ToString() + '/' + idNumber.Substring(2, 2) + '/' + idNumber.Substring(4, 2);

            var tempDate = Convert.ToDateTime(dob);

            //v//ar id_date = tempDate.Day;
            var id_date = tempDate.Day.ToString().Length == 1 ? "0" + tempDate.Day.ToString() : tempDate.Day.ToString();
            var id_month = tempDate.Month.ToString().Length == 1 ? "0" + tempDate.Month.ToString() : tempDate.Month.ToString();
            var id_year = tempDate.Year;

            fullDate = id_year + "/" + (id_month) + "/" + id_date;

            if (!((tempDate.Year.ToString().Substring(2, 2) == idNumber.Substring(0, 2)) && (id_month.ToString() == idNumber.Substring(2, 2)) && (id_date.ToString() == idNumber.Substring(4, 2))))
            {
                valid = false;
            }

            // get the gender
            var genderCode = idNumber.Substring(6, 4);
            gender = Convert.ToInt32(genderCode) < 5000 ? "Female" : "Male";

            // get country ID for citzenship
            var citzenship = Convert.ToInt32(idNumber.Substring(10, 1)) == 0 ? "Yes" : "No";

            int tempTotal = 0;
            int checkSum = 0;
            int multiplier = 1;
            for (int i = 0; i < 13; ++i)
            {
                tempTotal = int.Parse(idNumber.Substring(i, 1)) * multiplier;
                if (tempTotal > 9)
                {
                    tempTotal = int.Parse(tempTotal.ToString().Substring(0, 1)) + int.Parse(tempTotal.ToString().Substring(1, 1));
                }
                checkSum = checkSum + tempTotal;
                multiplier = (multiplier % 2 == 0) ? 1 : 2;
            }
            if ((checkSum % 10) != 0)
            {
                valid = false;
            };

            if (!valid)
            {
                return "Invalid Id Number";
            }
            return "";

        }

        private static void DisposeDataTable(DataTable dataTable)
        {
            if (dataTable != null)
            {
                dataTable.Clear();
                dataTable.Dispose();
                dataTable = null;
            }
        }
    }
}
