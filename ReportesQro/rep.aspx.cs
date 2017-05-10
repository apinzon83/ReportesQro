using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ReportesQro
{
    public partial class rep : System.Web.UI.Page
    {
        #region variables
        srQro.Service1Client sc;
        string cadenaConexionQro = "Data Source=10.9.21.150:1521/PDBORCL; User Id = QroDev; Password=QroDev123;";
        string cadenaConexionSJR = "Data Source=192.168.1.50:1521/ORCL;   User Id = c##QroDev; Password=QroDev123;";
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            //loader.Visible = false;
            //HtmlPage.RegisterScriptableObject("pagina", this);
        }

        #region metodos
        [WebMethod]
        [ScriptMethod]
        public static void cargarTotales(int entrega)
        {
            Debug.WriteLine("Entra a cargarTotales con id_entrega = " + entrega);
        }
        #endregion
    }
}