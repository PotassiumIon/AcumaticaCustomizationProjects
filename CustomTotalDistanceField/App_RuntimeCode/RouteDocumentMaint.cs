using PX.Common;
using PX.Data;
using PX.Data.DependencyInjection;
using PX.LicensePolicy;
using PX.Objects.Common;
using PX.Objects.CR;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using PX.Objects;
using PX.Objects.FS;

namespace PX.Objects.FS
{
  public class RouteDocumentMaint_Extension : PXGraphExtension<RouteDocumentMaint>
  {
    #region Event Handlers

    protected void FSRouteDocument_RowSelected(PXCache cache, PXRowSelectedEventArgs e)
    {
      // Instance of Data Access Class
      var row = (FSRouteDocument)e.Row;

      // Calculates Total Distance in KM
      if (row != null && row.TotalDistance != null) {
        double distanceKM = Math.Round((double)row.TotalDistance * (double)1.60934, 2);
        cache.SetValueExt(row, "usrCustomTotalDistance", $"{row.TotalDistanceFriendly} / {distanceKM} km");
      }
      
    }

    #endregion
  }
}