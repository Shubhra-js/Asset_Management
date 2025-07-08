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
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
        }

        private void BindGrid()
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-6C4VJC5\\SQLEXPRESS;Initial Catalog=AssetManagement;Integrated Security=True");
            // SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.Asset order by AssetId desc", con);
            SqlCommand cmd = new SqlCommand("sp_GetAllAssets", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            ViewState["gridState"] = dt;
            GridView1.DataSource = dt;
            GridView1.DataBind();         
            con.Close();
        }


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void btnAsset_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddAsset.aspx");
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {       
            string AssetId = GridView1.Rows[e.NewEditIndex].Cells[1].Text;
            string AssetNumber = GridView1.Rows[e.NewEditIndex].Cells[2].Text;
            string AssetType = GridView1.Rows[e.NewEditIndex].Cells[3].Text;
            string isUsable = GridView1.Rows[e.NewEditIndex].Cells[4].Text;
            string isAssigned = GridView1.Rows[e.NewEditIndex].Cells[5].Text;
            Response.Redirect("EditAsset.aspx?assetId="+ AssetId + "&assetNumber="+AssetNumber+"&assetType="+AssetType + "&isUsable=" + isUsable + "&isAssigned=" + isAssigned);

        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e) {
            string assetId = GridView1.DataKeys[e.RowIndex].Value.ToString();
            
            using (SqlConnection conn = new SqlConnection("Data Source=DESKTOP-6C4VJC5\\SQLEXPRESS;Initial Catalog=AssetManagement;Integrated Security=True"))
            {              
                SqlCommand cmd = new SqlCommand("sp_ModifyAsset", conn);         
                cmd.Parameters.AddWithValue("@AssetId", assetId);
                cmd.Parameters.AddWithValue("@Action", "Delete");
                cmd.CommandType = CommandType.StoredProcedure;

                conn.Open();
                cmd.ExecuteNonQuery();
            }
            BindGrid();
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            string searchTerm = searchBox.Text.ToLower();
                if (ViewState["gridState"] == null)
                    return;

                DataTable dt = ViewState["gridState"] as DataTable;

                DataTable dtNew = dt.Clone();
                foreach (DataRow row in dt.Rows)
                    if (row["AssetNumber"].ToString().ToLower().Contains(searchTerm) )
                    {
                        dtNew.Rows.Add(row.ItemArray);
                    }
                

                //rebind the grid
                GridView1.DataSource = dtNew;
                GridView1.DataBind();
            
        }


        protected void resetSearchButton_Click(object sender, EventArgs e)
        {
            //always check if the viewstate exists before using it
            if (ViewState["gridState"] == null)
                return;

            //cast the viewstate as a datatable
            DataTable dt = ViewState["gridState"] as DataTable;

            //rebind the grid
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }


    }
}