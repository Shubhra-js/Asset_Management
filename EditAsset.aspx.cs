using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagement
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string assetId = Request.QueryString["assetId"];
                hdnAssetId.Value = assetId;
                string assetNumber = Request.QueryString["assetNumber"];
                string assetType = Request.QueryString["assetType"];
                txtAssetNumber.Text = assetNumber;
                txtAssetType.Value = assetType;
                string isUsable = Request.QueryString["isUsable"];
                string isAssigned = Request.QueryString["isAssigned"];

                if (isUsable == "Yes")
                    usableYes.Checked=true;
                else if (isUsable == "No")
                    usableNo.Checked = true;

                if (isAssigned == "Yes")
                    assignedYes.Checked = true;
                else if (isAssigned == "No")
                    assignedNo.Checked = true;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string AseetId = Request.Form["hdnAssetId"];
           string AssetNumber = Request.Form["txtAssetNumber"];
           string AssetType = Request.Form["txtAssetType"];
          string Assigned = Request.Form["Assigned"];
            string Usable = Request.Form["usable"];
            
            using (SqlConnection conn = new SqlConnection("Data Source=DESKTOP-6C4VJC5\\SQLEXPRESS;Initial Catalog=AssetManagement;Integrated Security=True"))
            { 
                SqlCommand cmd = new SqlCommand("sp_ModifyAsset", conn);
                cmd.Parameters.AddWithValue("@AssetNumber", AssetNumber);
                cmd.Parameters.AddWithValue("@AssetType", AssetType);
                cmd.Parameters.AddWithValue("@IsAssigned", Assigned);
                cmd.Parameters.AddWithValue("@IsUsable", Usable);
                cmd.Parameters.AddWithValue("@AssetId", AseetId);
                cmd.Parameters.AddWithValue("@Action", "Update");
                cmd.CommandType = CommandType.StoredProcedure;

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("Asset.aspx");
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Asset.aspx");
        }



    }
}