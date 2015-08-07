<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="SaaSAuthentication.Account.Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <h2>
                        Create a New Account
                    </h2>
                    <p>
                        Use the form below to create a new account.
                    </p>
                    <p>
                        Passwords are required to be a minimum of <%= Membership.MinRequiredPasswordLength %> characters in length.
                    </p>
                    <span class="failureNotification">
                        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                    </span>
                    <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification" 
                         ValidationGroup="RegisterUserValidationGroup"/>
                    <div class="accountInfo">
                        <fieldset class="register">
                            <legend>Account Information</legend>
                            <p>
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                <asp:TextBox ID="Email" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" 
                                     CssClass="failureNotification" ErrorMessage="E-mail is required." ToolTip="E-mail is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                                     CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic" 
                                     ErrorMessage="Confirm Password is required." ID="ConfirmPasswordRequired" runat="server" 
                                     ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                     CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                            </p>

                            <p>
                                <asp:Label ID="Label1" runat="server" AssociatedControlID="txtCompanyName">Company Name:</asp:Label>
                                <asp:TextBox ID="txtCompanyName" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Email" 
                                     CssClass="failureNotification" ErrorMessage="Company Name is required." ToolTip="Company Name is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="Label2" runat="server" AssociatedControlID="txtCompanyUrl">Company Url:</asp:Label>
                                <asp:TextBox ID="txtCompanyUrl" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Email" 
                                     CssClass="failureNotification" ErrorMessage="Company Url is required." ToolTip="Company Url is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>

                            <p>
                                <asp:Label ID="Label3" runat="server" AssociatedControlID="txtCompanyUrl">Subscription Plan:</asp:Label>
                                <asp:DropDownList ID="ddlSubscriptionPlan" runat="server">
                                <asp:ListItem>Free</asp:ListItem>
                                <asp:ListItem>Professional</asp:ListItem>
                                <asp:ListItem>Enterprise</asp:ListItem>
                                </asp:DropDownList>
                            </p>

                        </fieldset>
                        <p class="submitButton">
                            <asp:Button ID="CreateUserButton" runat="server" Text="Create User" 
                                 ValidationGroup="RegisterUserValidationGroup" 
                                onclick="CreateUserButton_Click"/>
                        </p>
                    </div>

<%--
    <asp:CreateUserWizard ID="RegisterUser" runat="server" EnableViewState="false" OnCreatedUser="RegisterUser_CreatedUser">
        <LayoutTemplate>
            <asp:PlaceHolder ID="wizardStepPlaceholder" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="navigationPlaceholder" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
        <WizardSteps>
            <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
                <ContentTemplate>
                   
                </ContentTemplate>
                <CustomNavigationTemplate>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>--%>
</asp:Content>
