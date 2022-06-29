    #region AutoAddDetailItems
    public PXAction<PX.Objects.FS.FSServiceOrder> AutoAddDetailItems;

    public SelectFrom<InventoryItem>.View inventoryItems;

    [PXButton(CommitChanges = true)]
    [PXUIField(DisplayName = "Auto Add", Visible = true)]
    protected void autoAddDetailItems()
    {

      // Finds the ids for related inventory items
      int shrdelivid = 0;
      int shrconsoleid = 0;
      int shrtoterid = 0;
      int shrschedcid = 0;
      int shrschedtid = 0;

      foreach (InventoryItem item in inventoryItems.Select())
      {
        if (item.InventoryCD != null && item.InventoryCD.Contains("SHR-DELIV")) shrdelivid = (int)item.InventoryID;
        if (item.InventoryCD != null && item.InventoryCD.Contains("SHRCONSOLE")) shrconsoleid = (int)item.InventoryID;
        if (item.InventoryCD != null && item.InventoryCD.Contains("SHR-SCHEDC")) shrschedcid = (int)item.InventoryID;
        if (item.InventoryCD != null && item.InventoryCD.Contains("SHRTOTER")) shrtoterid = (int)item.InventoryID;
        if (item.InventoryCD != null && item.InventoryCD.Contains("SHR-SCHEDT")) shrschedtid = (int)item.InventoryID;
      }

      // Creates and inserts service order detail record for SHR-DELIV item
      FSSODet line = Base.ServiceOrderDetails.Insert();
      line.BranchID = Base.Accessinfo.BranchID;
      line.EstimatedQty = (decimal)1.0;
      line.BillableQty = (decimal)1.0;
      line.InventoryID = shrdelivid;
      Base.ServiceOrderDetails.Update(line);

      // Adds detail lines for the contract
      foreach (FSContractPeriodDet item in Base.BillServiceContractPeriodDetail.Select())
      {
        if (item.InventoryID == shrschedcid)
        {
          line = Base.ServiceOrderDetails.Insert();
          line.BranchID = Base.Accessinfo.BranchID;
          line.EstimatedQty = item.Qty;
          line.BillableQty = item.Qty;
          line.InventoryID = shrconsoleid;
          Base.ServiceOrderDetails.Update(line);
        }
        else if (item.InventoryID == shrschedtid)
        {
          line = Base.ServiceOrderDetails.Insert();
          line.BranchID = Base.Accessinfo.BranchID;
          line.EstimatedQty = item.Qty;
          line.BillableQty = item.Qty;
          line.InventoryID = shrtoterid;
          Base.ServiceOrderDetails.Update(line);
        }
      }
      
    }

    protected void FSServiceOrder_RowSelected(PXCache cache, PXRowSelectedEventArgs e)
    {

      var row = (FSServiceOrder)e.Row;

      FSServiceOrderExt ext = cache.GetExtension<FSServiceOrderExt>(row);

      // Constraints for Auto Add button
      if (
        row.SrvOrdType != null &&
        row.SrvOrdType == "MVMT" &&
        row.BillServiceContractID != null &&
        ext.UsrServiceDescription != null &&
        ext.UsrServiceDescription.Contains(ServiceOrderDescriptions.ShreddingContainerDelivery)
        )
      {
        AutoAddDetailItems.SetEnabled(true);
      }
      else
      {
        AutoAddDetailItems.SetEnabled(false);
      }
    }
    #endregion