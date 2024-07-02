using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using CurdAsp.connection;

namespace CurdAsp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(method.str);
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Show();
                BindGender();
                BindState();
            }
        }

        public void BindGender()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblgender", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            rblgenger.DataValueField = "gender_id";
            rblgenger.DataTextField = "gender_name";
            rblgenger.DataSource = dt;
            rblgenger.DataBind();

        }


        public void BindState()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblestate", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlstate.DataValueField = "state_id";
            ddlstate.DataTextField = "state_name";
            ddlstate.DataSource = dt;
            ddlstate.DataBind();
            ddlstate.Items.Insert(0, new ListItem("select", "0"));


        }

        public void BindCity()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblecity where state_id='" + ddlstate.SelectedValue + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlcity.DataValueField = "city_id";
            ddlcity.DataTextField = "city_name";
            ddlcity.DataSource = dt;
            ddlcity.DataBind();
            ddlcity.Items.Insert(0, new ListItem("select    ", "0"));

        }



        protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCity();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (btnsubmit.Text == "Submit")
            {




                con.Open();
                SqlCommand cmd = new SqlCommand("tbleemployee_insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("first_name", txtname.Text.ToString());
                cmd.Parameters.AddWithValue("last_name", txtlname.Text.ToString());
                cmd.Parameters.AddWithValue("gender", rblgenger.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("state", ddlstate.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("city", ddlcity.SelectedValue.ToString());
                cmd.ExecuteNonQuery();
                con.Close();
                Show();
                Clear();
                Response.Write("<script>alert('Data Has Been Succesfully Submitted')</script>");

            }

            if (btnsubmit.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("tbleemployee_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("first_name", txtname.Text.ToString());
                cmd.Parameters.AddWithValue("last_name", txtlname.Text.ToString());
                cmd.Parameters.AddWithValue("gender", rblgenger.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("state", ddlstate.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("city", ddlcity.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("id", ViewState["aa"]);
                cmd.ExecuteNonQuery();
                con.Close();
                Show();
                Clear();
                btnsubmit.Text = "Submit";
            }

        }



        protected void gvtbleemployee_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("tbleemployee_delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                Show();
                ViewState["aa"] = e.CommandArgument;
            }
            else if (e.CommandName == "B")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("tblemployee_edit", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("id", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txtname.Text = dt.Rows[0]["first_name"].ToString();
                txtlname.Text = dt.Rows[0]["last_name"].ToString();
                rblgenger.SelectedValue = dt.Rows[0]["gender"].ToString();
                ddlstate.SelectedValue = dt.Rows[0]["state"].ToString();
                BindCity();
                ddlcity.SelectedValue = dt.Rows[0]["city"].ToString();
                ViewState["aa"] = e.CommandArgument;
                btnsubmit.Text = "Update";
            }
        }

        public void Show()
        {
            
            SqlCommand cmd = new SqlCommand("tbleemployee_show", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
         
            gvtbleemployee.DataSource = dt;
            gvtbleemployee.DataBind();
        }
        public void Clear()
        {
            txtname.Text = string.Empty;
            txtlname.Text = string.Empty;
            rblgenger.ClearSelection();
            ddlstate.ClearSelection();
            ddlcity.ClearSelection();
        }

        protected void btnclear_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login_Page.aspx");

        }


    }
}
    
