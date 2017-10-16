using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

namespace ct_project.Models
{
    public class DBConnection
    {
        SqlConnection connection = null;
        SqlCommandBuilder builder = null;
        DataSet ds = null;
        SqlDataAdapter adapter = null;
        void CreateConnection()
        {
            try
            {
                connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\CrimeDB.mdf;Integrated Security=True");
            }
            catch (Exception ex)
            {
                Debug.WriteLine("Error While Connecting to DataBase", ex.Message);
            }
        }
        public DataSet getTable(String table, String query)
        {
            try
            {
                CreateConnection();
                adapter = new SqlDataAdapter(query, connection);
                ds = new DataSet("DS1");
                adapter.Fill(ds, table);
                return ds;
            }
            catch (Exception e)
            {
                Console.WriteLine("Failed to fetch table" + table, e.Message);
                return null;
            }
        }
        //public DataSet GetDataset()
        //{
        //    try
        //    {
        //        CreateConnection();
        //        adapter = new SqlDataAdapter("SELECT * FROM admin", connection);
        //        ds = new DataSet("EmployeeDS");
        //        adapter.Fill(ds, "admin");
        //        connection.Close();
        //        return ds;
        //    }
        //    catch (Exception ex)
        //    {
        //        Debug.WriteLine("Error Creating DataSet", ex.Message);
        //        return new DataSet("Error");
        //    }
        //}
        public bool Commit(string tableName)
        {
            try
            {
                builder = new SqlCommandBuilder(adapter);
                int iscommit=adapter.Update(ds, tableName);
                return true;
            }
            catch(Exception ex)
            {
                Console.WriteLine("Exception while updating datasource: "+ex.Message);
                return false;
            }
        }

    }
}