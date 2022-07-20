<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormDetail.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="KT100101.aspx.cs" Inherits="Page_KT100101" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPages/FormDetail.master" %>

<asp:Content ID="cont1" ContentPlaceHolderID="phDS" Runat="Server">
	<px:PXDataSource PageLoadBehavior="PopulateSavedValues" ID="ds" runat="server" Visible="True" Width="100%"
        TypeName="KsMasterCustomizationProject.APInvoiceVendorDuplicatesInq"
        PrimaryView="MasterView"
        >
		<CallbackCommands>
			<px:PXDSCallbackCommand Name="Cancel" ></px:PXDSCallbackCommand></CallbackCommands>
	</px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phF" Runat="Server">
	<px:PXFormView ID="form" runat="server" DataSourceID="ds" DataMember="MasterView" Width="100%" Height="100px" AllowAutoHide="false">
		<Template>
			<px:PXLayoutRule ID="PXLayoutRule1" runat="server" StartRow="True"></px:PXLayoutRule>
			<px:PXSelector CommitChanges="True" runat="server" ID="CstPXSelector13" DataField="RefNbr" ></px:PXSelector>
			<px:PXSelector CommitChanges="True" runat="server" ID="CstPXSelector12" DataField="InvoiceNbr" ></px:PXSelector></Template>
	
		<AutoSize MinHeight="100" Enabled="True" Container="Parent" ></AutoSize>
		<AutoSize Enabled="True" ></AutoSize></px:PXFormView>
</asp:Content>
<asp:Content ID="cont3" ContentPlaceHolderID="phG" Runat="Server">
	<px:PXGrid AutoAdjustColumns="" SyncPosition="True" Width="100%" SkinID="Primary" Height="" runat="server" ID="grid">
		<Levels>
			<px:PXGridLevel DataMember="DetailsView" >
				<Columns>
					<px:PXGridColumn LinkCommand="ViewInvoice" DataField="RefNbr" Width="140" ></px:PXGridColumn>
					<px:PXGridColumn DataField="VendorID" Width="140" ></px:PXGridColumn>
					<px:PXGridColumn DataField="Vendor__AcctName" Width="280" ></px:PXGridColumn>
					<px:PXGridColumn DataField="InvoiceDate" Width="90" ></px:PXGridColumn>
					<px:PXGridColumn DataField="DocDesc" Width="280" ></px:PXGridColumn>
					<px:PXGridColumn DataField="CuryOrigDocAmt" Width="100" ></px:PXGridColumn></Columns>
				<RowTemplate></RowTemplate></px:PXGridLevel></Levels>
		<ActionBar>
			<Actions>
				<Refresh Enabled="False" ></Refresh></Actions></ActionBar>
		<AutoSize MinHeight="600" Container="Window" Enabled="True" ></AutoSize>
		<AutoSize Container="Parent" ></AutoSize>
		<AutoSize MinHeight="300" ></AutoSize></px:PXGrid></asp:Content>
