using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Conference_Registration_System
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if it's the first time loading or postback
            if (IsPostBack)
            {
                // If form submission is successful, save data to session
                if (Page.IsValid)
                {
                    // Save user information to session
                    Session["UserName"] = txtName.Text;
                    Session["UserEmail"] = txtEmail.Text;
                    Session["UserPassword"] = txtPassword.Text;

                    lblStatus.Text = "Registration successful!";
                    lblStatus.ForeColor = System.Drawing.Color.Green;

                    // Redirect to confirmation page
                    Response.Redirect("Confirmation.aspx", false);
                }
            }
        }

        // Dynamically show PayPal email field when PayPal is selected
        protected void ddlPaymentMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPaymentMethod.SelectedValue == "PayPal")
            {
                pnlPayPal.Visible = true;
            }
            else
            {
                pnlPayPal.Visible = false;
            }
        }

        // Button click event to validate and submit
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Session storage and redirection to Confirmation
                Session["UserName"] = txtName.Text;
                Session["UserEmail"] = txtEmail.Text;
                Session["UserPassword"] = txtPassword.Text;
                Response.Redirect("Confirmation.aspx");
            }
        
        }
    }
}


