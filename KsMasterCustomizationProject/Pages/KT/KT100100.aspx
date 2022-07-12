<%@ Page Language="C#" MasterPageFile="~/MasterPages/ListView.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="KT100100.aspx.cs" Inherits="Page_KT100100" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPages/ListView.master" %>

<asp:Content ID="cont1" ContentPlaceHolderID="phDS" Runat="Server">
	<px:PXDataSource ID="ds" runat="server" Visible="True" Width="100%"
        TypeName="KsMasterCustomizationProject.InvoiceStatementMessageMaint"
        PrimaryView="InvoiceStatementMessage"
        >
		<CallbackCommands>

		</CallbackCommands>
	</px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phL" runat="Server">
	<px:PXGrid ID="grid" runat="server" DataSourceID="ds" Width="100%" Height="150px" SkinID="Primary" AllowAutoHide="false">
		<Levels>
			<px:PXGridLevel DataMember="InvoiceStatementMessage">
			    <Columns>
				<px:PXGridColumn DataField="MessageType" Width="70" />
				<px:PXGridColumn DataField="CorporateRegionID" Width="140" />
				<px:PXGridColumn DataField="StateID" Width="180" />
				<px:PXGridColumn DataField="OrganizationID" Width="140" />
				<px:PXGridColumn DataField="BranchID" Width="140" />
				<px:PXGridColumn DataField="Descr" Width="70" ></px:PXGridColumn>
				<px:PXGridColumn DataField="StartDate" Width="90" />
				<px:PXGridColumn DataField="EndDate" Width="90" /></Columns>
			</px:PXGridLevel>
		</Levels>
		<AutoSize Container="Window" Enabled="True" MinHeight="150" />
		<ActionBar >
		</ActionBar>
	</px:PXGrid>
</asp:Content>
