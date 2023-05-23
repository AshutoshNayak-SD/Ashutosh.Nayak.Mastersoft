using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Ashutosh.Nayak.Mastersoft
{
    public partial class mastersoft : System.Web.UI.Page
    {
        SqlConnection con=new SqlConnection(@"Data Source=Lenovo_Ideapad\SQLEXPRESS;Initial Catalog=Ashutosh;Integrated Security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                btnDelete.Enabled = false;
                FillGridView();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        public void Clear()
        {
            hfId.Value = "";
            txtFirstName.Text = txtLastName.Text = txtEmailID.Text = txtPhoneNo.Text=DropDownList1.SelectedValue = "";
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
            btnInsert.Text = "Insert";
            btnDelete.Enabled=false;
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if(con.State==ConnectionState.Closed)
                con.Open();
            SqlCommand cmd = new SqlCommand("InsertEmployeeRegistration",con);
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id",(hfId.Value==""?0:Convert.ToInt32(hfId.Value)));
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
            cmd.Parameters.AddWithValue("@EmailId", txtEmailID.Text.Trim());
            cmd.Parameters.AddWithValue("@PhoneNo", txtPhoneNo.Text.Trim());
            cmd.Parameters.AddWithValue("@Department",DropDownList1.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@DateofBirth",Calendar1.SelectedDate.ToString());
            cmd.ExecuteNonQuery();
            con.Close();
            string Id = hfId.Value;
            Clear();
            if (hfId.Value =="")
                lblSuccessMessage.Text = "Inserted Succesfully";
            else
                lblSuccessMessage.Text = "Updated  Succesfully";
            FillGridView();
        }
        void FillGridView()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("EmployeeRegistrationViewAll", con);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlda.Fill(dtbl);
            con.Close();
            gvMastersoft.DataSource = dtbl;
            gvMastersoft.DataBind();
        }
    protected void lnk_OnClick(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("EmployeeRegistrationViewById", con);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@Id",Id);
            DataTable dtbl = new DataTable();
            sqlda.Fill(dtbl);
            con.Close();
            hfId.Value = Id.ToString();
            txtFirstName.Text = dtbl.Rows[0]["FirstName"].ToString();
            txtLastName.Text = dtbl.Rows[0]["LastName"].ToString();
            txtEmailID.Text = dtbl.Rows[0]["EmailId"].ToString();
            txtPhoneNo.Text = dtbl.Rows[0]["PhoneNo"].ToString();
            DropDownList1.SelectedValue= dtbl.Rows[0]["Department"].ToString();
            Calendar1.SelectedDate= Convert.ToDateTime(dtbl.Rows[0]["DateofBirth"].ToString());
            btnInsert.Text = "update";
            btnDelete.Enabled = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand sqlcmd = new SqlCommand("EmployeeRegistrationDeletById", con);
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@Id",Convert.ToInt32(hfId.Value));
            sqlcmd.ExecuteNonQuery();
            con.Close();
            Clear();
            FillGridView();
            lblSuccessMessage.Text = "Deleted Succesfully";
        }
    }
}