<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditAsset.aspx.cs" Inherits="AssetManagement.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

     <link rel="stylesheet" href="StyleSheet2.css?v=1" />
</head>
<body>
    <script>
        function onbtnUpdate_Click() {            
            if ($('#txtAssetNumber').val() === '') {
                $('#ValidationCheck').text("Asset number is a required field.").show();
                return false;
            } else if ($('#txtAssetType').val() === '') {
                $('#ValidationCheck').text("Asset type is a required field.").show();
                return false;
            }
            else if ($("input[name='assigned']:checked").val() == undefined) {           
                $('#ValidationCheck').text("Assigned is a required field.").show();
                return false;
            }
            else if ($("input[name='usable']:checked").val() == undefined) {            
                $('#ValidationCheck').text("Usable is a required field.").show();
                return false;
            } else {
                $('#ValidationCheck').hide();
                return true;
            }
        }

    </script>
    <form id="form1" runat="server">
        <div class="asset-form-layout">
     <div class="image-box">
     <asp:Image ID="AssetImage" runat="server" ImageUrl="~/Images/AM-2.jpg" CssClass="styled-image" />
 </div>

    
    <div class="form-container">
         <div id="ValidationCheck" style="color:red"></div>
        <h2>Edit Asset</h2> 
         <div class="form-group">
             <label for="txtAssetNumber">Asset Number:</label>
             <asp:TextBox ID="txtAssetNumber" runat="server" CssClass="form-group" name="AssetNumber"/>
         </div>

       
        <div class="form-group">
            <label for="ddlAssetType">Asset Type:</label>
            <select name="AssetType" id="txtAssetType" runat="server">
                <option value="" disabled="disabled" selected="selected">-- Choose Asset Type --</option>
                <option value="Laptop">Laptop</option>
                <option value="Desktop">Desktop</option>
                <option value="Support Cell">Support Cell</option>
            </select>
        </div>

         <div class="form-group">
     <label>Assigned?</label>
     <div class="radio-options" id="IsAssigned" >
         <label><input type="radio" name="assigned" value="Yes" id="assignedYes" runat="server"/> Yes</label>
         <label><input type="radio" name="assigned" value="No"  id="assignedNo" runat   ="server"/> No</label>
     </div>
 </div>

         <div class="form-group">
     <label>Usable?</label>
     <div class="radio-options" id="IsUsable">
         <label><input type="radio" name="usable" value="Yes" id="usableYes" runat="server"/> Yes</label>
         <label><input type="radio" name="usable" value="No" id="usableNo" runat="server"/> No</label>
     </div>
 </div>

        <asp:HiddenField ID="hdnAssetId" runat="server" value="" ClientIDMode="Static" />
            
        <div class="button-group">
            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="button" OnClick="btnUpdate_Click" OnClientClick="if(onbtnUpdate_Click() == false) return(false);" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="button cancel-button" OnClick="btnCancel_Click" UseSubmitBehavior="false" />
        </div>
    </div>
        </div>

        


    </form>
</body>

</html>
