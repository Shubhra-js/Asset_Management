<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAsset.aspx.cs" Inherits="AssetManagement.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <link rel="stylesheet" href="StyleSheet3.css?v=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

<head runat="server">
    <title></title>
</head>
<body>
    <script>
        
        function onSubmitButtonClick() {            
            if ($('#AssetNumber').val() == '') {
                //alert("Not Ok");
                $('#ValidationCheck').text("Asset number is a required field.");
                $('#ValidationCheck').show();                               
                return false;
            }
            else if ($('#AssetType').val() == '') {
               // alert("Not Ok");
                $('#ValidationCheck').text("Asset type is a required field.");
                $('#ValidationCheck').show();
                return false;
            }
            else if ($("input[name='assigned']:checked").val() == undefined) {
                // alert("Not Ok");
                $('#ValidationCheck').text("Assigned is a required field.");
                $('#ValidationCheck').show();
                return false;
            }
            else {
               // alert("OK");
                $('#ValidationCheck').hide();
                return true;
            }
        }
       

      


    </script>
    <form id="form2" runat="server">
      
    <div class="asset-form-layout">

        <div class="image-box">
            <asp:Image ID="AssetImage" runat="server" ImageUrl="~/Images/AM-2.jpg" CssClass="styled-image" />
        </div>

        <div class="form-container">
              <div id="ValidationCheck" style="color:red"></div>
                <h2>Add Asset</h2>

    <div class="form-group">
        <label for="AssetNumber">Asset Number:</label>
        <input type="text" name="AssetNumber" id="AssetNumber"  />
    </div>

    <div class="form-group">
        <label for="AssetType">Asset Type:</label>
        <select name="AssetType" id="AssetType">
            <option value="" disabled="disabled" selected="selected">-- Choose Asset Type --</option>
            <option value="Laptop">Laptop</option>
            <option value="Desktop">Desktop</option>
            <option value="Support Cell">Support Cell</option>
        </select>
    </div>  

    <div class="form-group">
        <label>Assigned?</label>
        <div class="radio-options" id="IsAssigned">
            <label><input type="radio" name="assigned" value="Yes" /> Yes</label>
            <label><input type="radio" name="assigned" value="No" /> No</label>
        </div>
    </div>

    <div class="button-group">
    
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="button" OnClick="btnSubmit_Click" OnClientClick="if(onSubmitButtonClick() == false) return(false);" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="button cancel-button" OnClick="btnCancel_Click" UseSubmitBehavior="false" />
    </div>
</div>
        </div>    
</form>

</body>
</html>
