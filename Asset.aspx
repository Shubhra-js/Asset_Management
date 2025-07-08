<%@ Page Title="Asset Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Asset.aspx.cs" Inherits="AssetManagement.Contact" %>
           

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="StyleSheet1.css?v=3" />
   <style type="text/css">
     .hidden
     {
         display:none;
     }
    </style>

    <div class="grid-side">
        <h1 id="title" class="page-title"><%: Title %></h1>
    </div>

    <main aria-labelledby="title" class="main-layout">

        <div class="image-box">
            <asp:Image ID="AssetImage" runat="server" ImageUrl="~/Images/AM-2.jpg" CssClass="styled-image" />
        </div>

            
            <div class="grid-section">
            <asp:Button ID="btnAddAsset" runat="server" Text="Add Asset" CssClass="button" OnClick="btnAsset_Click" />

            <div class="grid-container">
                    <asp:TextBox ID="searchBox" runat="server" CssClass="search-box"></asp:TextBox>
                    <asp:Button ID="searchButton" runat="server" Text="search" OnClick="searchButton_Click" CssClass="button"/>
                    <asp:Button ID="reset" runat="server" Text="reset" OnClick="resetSearchButton_Click" CssClass="button" />
                <br />
                <br />
                <asp:GridView ID="GridView1"
                    runat="server"
                    AutoGenerateColumns="false"
                    CssClass="grid"
                    PageSize="10"
                    DataKeyNames="AssetId"
                    AllowPaging="true"
                    OnPageIndexChanging="GridView1_PageIndexChanging"
                    OnRowEditing="GridView1_RowEditing"                  
                    OnRowDeleting="GridView1_RowDeleting">                  
                    <%--   <rowstyle Height="20px" />
        <alternatingrowstyle  Height="20px"/>--%>
                    <Columns>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                        <asp:BoundField DataField="AssetId" HeaderText="Asset Id" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                        <asp:BoundField DataField="AssetNumber" HeaderText="Asset Name" />
                        <asp:BoundField DataField="AssetType" HeaderText="Asset Type" />
                        <asp:BoundField DataField="IsUsable" HeaderText="Usable" />
                        <asp:BoundField DataField="IsAssigned" HeaderText="Assigned" />
                    </Columns>
                </asp:GridView>
            </div>
                </div>

    </main>
</asp:Content>



