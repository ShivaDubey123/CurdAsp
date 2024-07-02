<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CurdAsp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <style>
        body {
            background-color: #f0f0f0;
            background-image: url('../image/mediamodifier-Zd_KEvlWcFw-unsplash.jpg');
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: black;
        }


        .container {
            width: 85%;
            margin: auto;
            background-color: rgba(0,0,0,0.2);
            padding: 20px;
            border-radius: 10px;
            max-width: 500px;
            margin: 25px auto;
            scrollbar-3dlight-color: crimson;
            padding: 40px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 25px;
        }

        .form-table {
            width: 100%;
            margin-bottom: 2px;
        }


            .form-table td {
                padding: 7px;
                font-variant: small-caps;
            }

            .form-table input[type=text],
            .form-table select {
                width: calc(80% - 12px);
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 20px;
                box-sizing: border-box;
                font-size: 14px;
                background-color: white;
            }

            .form-table .btn {
                padding: 8px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }



        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin: 2px
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: content-box;
        }




        .form-table .btn.home {
            background-color: #e7e7e7;
            color: #333;
        }

        .form-table .btn:hover {
            background-color: #45a049;
        }

        .grid-view {
            margin-top: 20px;
            border-collapse: collapse;
            background: azure;
        }

            .grid-view th,
            .grid-view td {
                padding: 6px;
                text-align: left;
                border-bottom: 1px solid #ddd;
                text-align: center;
                border: revert-layer;
                border-right: inset;
                border-color: grey;
                border-style: dotted;
                border-width: thin;
                font-size: small;
            }

            .grid-view th {
                background-color: white;
                font-weight: 600;
                font-family: serif;
                color: black;
                font-family: math;
            }

            .grid-view td button {
                padding: 6px 12px;
                background-color: antiquewhite;
                color: red;
                border: none;
                border-radius: 8px;
                cursor: pointer;
            }

                .grid-view td button.delete {
                    background-color: red;
                }

                .grid-view td button:hover {
                    background-color: #0056b3;
                }


        .btn.home {
            background-color: #6c757d;
        }

        .btn.delete {
            background-color: #dc3545;
        }

        .auto-style1 {
            height: 56px;
        }

        .auto-style2 {
            height: 43px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div class="container">

            <div>
                <h2 style="text-align: center; font-family:cursive; font-size: 24px; font-style:revert" font-family: cursive; ><b>Registration Form </b></h2>
            </div>

            <table class="form-table">
                <tr>
                    <td>First Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Last Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtlname" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtlname" runat="server" CssClass="form-control"></asp:TextBox>
                      
                    </td>
                </tr>
                <tr>
                    <td>Gender<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="rblgenger" ErrorMessage="*" ForeColor="Red" ></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButtonList ID="rblgenger" runat="server" RepeatColumns="3"></asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td>State<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlstate" ErrorMessage="*" ForeColor="Red" InitialValue="0" SetFocusOnError="True" ValidateRequestMode="Enabled" ViewStateMode="Enabled"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="ddlstate" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged" AutoPostBack="true" runat="server" CssClass="form-control"></asp:DropDownList>
                       
                    </td>
                </tr>
                <tr>
                    <td>City<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlcity" InitialValue="0" 
ViewStateMode="Enabled" ValidateRequestMode="Enabled" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlcity" runat="server" CssClass="form-control"></asp:DropDownList>
                       
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnhome" runat="server" Text="Home" OnClick="btnclear_Click" CssClass="btn home" /><asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" CssClass="btn" /></td>
                </tr>
            </table>

            <table class="grid-view">
                <tr>
                    <td>
                        <asp:GridView ID="gvtbleemployee" runat="server" AutoGenerateColumns="false" OnRowCommand="gvtbleemployee_RowCommand1">
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate><%# Eval("id") %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FirstName">
                                    <ItemTemplate><%# Eval("first_name") %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="LastName">
                                    <ItemTemplate><%# Eval("last_name") %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gender">
                                    <ItemTemplate><%# Eval("gender_name") %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="City">
                                    <ItemTemplate><%# Eval("city_name") %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="State">
                                    <ItemTemplate><%# Eval("state_name") %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="*">
                                    <ItemTemplate>
                                        <asp:Button ID="btnedit" runat="server" Text="Edit" CommandArgument='<%# Eval("id") %>' CommandName="B" CssClass="btn" ValidationGroup="RequiredFieldValidator" />    </ItemTemplate>
                              </asp:TemplateField>
                                 <asp:TemplateField HeaderText="*">
                                      <ItemTemplate>
                                        <asp:Button ID="btndelete" runat="server" Text="Delete" CommandArgument='<%# Eval("id") %>' CommandName="A" CssClass="btn delete" ValidationGroup="RequiredFieldValidator"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
   
</body>
</html>
