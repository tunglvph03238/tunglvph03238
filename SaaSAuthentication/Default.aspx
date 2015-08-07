<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="SaaSAuthentication._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to my SaaS application!
    </h2>
    <p>
        Once you're logged in, go to <a href="/SaaS/">/Saas/</a> to see your tenant.
    </p>
</asp:Content>
