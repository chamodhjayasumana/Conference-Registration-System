<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Conference_Registration_System.Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Conference Registration</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <h2>Conference Registration</h2>
            
            <!-- Update Panel for dynamic form updates -->
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <label for="txtName">Full Name:</label>
                    <asp:TextBox ID="txtName" runat="server" />
                    <asp:RegularExpressionValidator ID="regNameValidator" runat="server" 
                        ControlToValidate="txtName" ValidationExpression="^[a-zA-Z\s]+$" 
                        ErrorMessage="Name should only contain letters and spaces." ForeColor="Red" />
                    <br />

                    <label for="txtEmail">Email Address:</label>
                    <asp:TextBox ID="txtEmail" runat="server" />
                    <asp:RegularExpressionValidator ID="regEmailValidator" runat="server" 
                        ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
                        ErrorMessage="Please enter a valid email address." ForeColor="Red" />
                    <br />

                    <label for="txtPassword">Password:</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                    <asp:RegularExpressionValidator ID="regPasswordValidator" runat="server" 
                        ControlToValidate="txtPassword" ValidationExpression="^(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,}$" 
                        ErrorMessage="Password must be at least 8 characters, with at least one number and one special character." ForeColor="Red" />
                    <br />

                    <label for="ddlPaymentMethod">Select Payment Method:</label>
                    <asp:DropDownList ID="ddlPaymentMethod" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPaymentMethod_SelectedIndexChanged">
                        <asp:ListItem Text="Select" Value="" />
                        <asp:ListItem Text="Credit Card" Value="CreditCard" />
                        <asp:ListItem Text="PayPal" Value="PayPal" />
                    </asp:DropDownList>

                    <asp:Panel ID="pnlPayPal" runat="server" Visible="false">
                        <label for="txtPayPalEmail">PayPal Email:</label>
                        <asp:TextBox ID="txtPayPalEmail" runat="server" />
                        <asp:RegularExpressionValidator ID="regPayPalEmailValidator" runat="server" 
                            ControlToValidate="txtPayPalEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
                            ErrorMessage="Please enter a valid PayPal email address." ForeColor="Red" />
                    </asp:Panel>

                    <br />
                    <asp:Button ID="btnSubmit" runat="server" Text="Register" OnClick="btnSubmit_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>

            <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>