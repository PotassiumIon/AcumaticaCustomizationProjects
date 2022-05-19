using PX.Data.ReferentialIntegrity.Attributes;
using PX.Data;
using PX.Objects.AP;
using PX.Objects.CR;
using PX.Objects.CS;
using PX.Objects.EP;
using PX.Objects.FS;
using PX.Objects.GL;
using PX.Objects;
using System.Collections.Generic;
using System;

namespace PX.Objects.FS
{
  // Acuminator disable once PX1016 ExtensionDoesNotDeclareIsActiveMethod extension should be constantly active
  public sealed class FSRouteDocumentExt : PXCacheExtension<PX.Objects.FS.FSRouteDocument>
  {
    #region UsrCustomTotalDistance
    [PXString]
    [PXUIField(DisplayName="Total Distance [*]", IsReadOnly = true)]
    [PXUnboundDefault("")]
    public string UsrCustomTotalDistance { get; set; }
    public abstract class usrCustomTotalDistance : PX.Data.BQL.BqlString.Field<usrCustomTotalDistance> { }
    #endregion
  }
}