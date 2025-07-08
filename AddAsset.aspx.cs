using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagement
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void InsertAsset(string AssetNumber,string AssetType, string Assigned)
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-6C4VJC5\\SQLEXPRESS;Initial Catalog=AssetManagement;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("sp_ModifyAsset", con);
            cmd.Parameters.AddWithValue("@AssetNumber", AssetNumber);
            cmd.Parameters.AddWithValue("@AssetType", AssetType);
            cmd.Parameters.AddWithValue("@IsAssigned", Assigned);
            cmd.Parameters.AddWithValue("@IsUsable", "Yes");            
            cmd.Parameters.AddWithValue("@Action", "Insert");
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string AssetNumber = Request.Form["AssetNumber"];
            string AssetType = Request.Form["AssetType"];            
            string Assigned = Request.Form["Assigned"];
            InsertAsset(AssetNumber, AssetType, Assigned);
            Response.Redirect("Asset.aspx");
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Asset.aspx");
        }

    }
}