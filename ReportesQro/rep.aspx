<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rep.aspx.cs" Inherits="ReportesQro.rep" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reporte Avance</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/local.css" />

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

    <!-- you need to include the shieldui css and js assets in order for the charts to work -->
    <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
    <link id="gridcss" rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/dark-bootstrap/all.min.css" />

    <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
    <script type="text/javascript" src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" >Digitalizacion Queretaro</a>
                <div >
                    <%--<select id="mySelect" class="select_ctrl">
                        <option value="0"></option>
                        <option value="1">Entrega 1</option>
                        <option value="2">Entrega 2</option>
                        <option value="3">Entrega 3</option>
                    </select>--%>
                    <button id="btn_e1" class="button" onclick="traerEntrega()" value="1">Entrega 1</button>
                    <button id="btn_e2" class="button" onclick="traerEntrega()" value="2">Entrega 2</button>
                    <button id="btn_e3" class="button" onclick="traerEntrega()" value="3">Entrega 3</button>
                </div>
            </div>
       </nav>

       <div id="page-wrapper" >
            <div class="row">
                <div class="col-lg-12">
                    <h1>Tablero de Control 
                        <small><asp:label ID="lbd_delegacion" runat="server"> San Juan del Rio  - Entrega </asp:label></small>
                        <small><asp:label ID="lbl_entrega" runat="server" Text="50"></asp:label></small>
                    </h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="loader" id="ctrl_loader" runat="server" hidden="true"></div>
                    <h2><small>Ultima Actualizacion: <asp:Label ID="lbl_f_ultima_actua" runat="server">5/1/2017 13:32</asp:Label></small></h2>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-database"></i> Totales Generales</h3>
                        </div>
                        <div class="panel-body">
                            <ul class="server-stats">
                                <li>
                                    <div class="stat">
                                        <div class="info">
                                            <label style="width:200px">Status : </label>
                                            <input id="txt_status" runat="server" readonly="true" value="En Proceso" style=" width:100px; color:green"/>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="stat">
                                        <div class="info">
                                            <label style="width:200px">Fecha de entrega : </label>
                                            <input id="txt_f_entrega" runat="server" readonly="true" value="15/5/2017" style="width:100px"/>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="stat">
                                        <div class="info">
                                            <label style="width:200px">Total cajas termiandas : </label>
                                            <input id="txt_total_cajas_terminadas" runat="server" readonly="true" value="230" style="width:100px"/>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="stat">
                                        <div class="info">
                                            <label style="width:200px">Promedio tramites por caja : </label>
                                            <input id="txt_promedio_tramites_por_caja" runat="server" readonly="true" value="259" style="width:100px"/>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="stat">
                                        <div class="info">
                                            <label style="width:200px">Promedio hojas por caja : </label>
                                            <input id="txt_promedio_hojas_por_caja" runat="server" readonly="true" value="2987" style="width:100px"/>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="stat">
                                        <div class="info">
                                            <label style="width:200px">Total Claves Catastrales : </label>
                                            <input id="Text1" runat="server" readonly="true" value="50794" style="width:100px"/>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="stat">
                                        <div class="info">
                                            <label>Hojas hasta entrega : <asp:Label ID="lbl_hojas_hasta_entrega" runat="server">92% / 764634 / 824599</asp:Label></label>
                                            <div class="progress progress-small">
                                                <div style="width: 92%;" class="progress-bar progress-bar-success" id="pb_hojas_hasta_entrega"></div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart"></i> Tramites</h3>
                        </div>
                        <div class="panel-body">
                            <ul class="server-stats">
                                <li>
                                    <div class="key pull-right">Cajas</div>
                                    <div class="stat">
                                        <div class="info"><asp:Label ID="lbl_cajas" runat="server">96% / 250 / 259 / (22 - 281)</asp:Label></div>
                                        <div class="progress progress-small">
                                            <div style="width: 96%;" class="progress-bar progress-bar-success" id="pb_cajas"></div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="key pull-right">Hojas</div>
                                    <div class="stat">
                                        <div class="info"><asp:Label ID="Label1" runat="server">92% / 710952 / 771390</asp:Label></div>
                                        <div class="progress progress-small">
                                            <div style="width: 92%;" class="progress-bar progress-bar-success" id="pb_hojas"></div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="key pull-right">Capturados</div>
                                    <div class="stat">
                                        <div class="info"><asp:Label ID="lbl_capturados" runat="server">96% / 68731 / 70966</asp:Label></div>
                                        <div class="progress progress-small">
                                            <div style="width: 96%;" class="progress-bar progress-bar-success" id="pb_capturados"></div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="key pull-right">Escaneados</div>
                                    <div class="stat">
                                        <div class="info"><asp:Label ID="lbl_escaneados" runat="server">91% / 64088 / 70966</asp:Label></div>
                                        <div class="progress progress-small">
                                            <div style="width: 50%;" class="progress-bar progress-bar-info" id="pb_escaneados"></div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="key pull-right">Indexados</div>
                                    <div class="stat">
                                        <div class="info"><asp:Label ID="lbl_indexados" runat="server">91% / 65088 / 70966</asp:Label></div>
                                        <div class="progress progress-small">
                                            <div style="width: 35%;" class="progress-bar progress-bar-warning" id="pb_indexados"></div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
              
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Produccion diaria</h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-chart1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /#wrapper -->

    <script type="text/javascript">
        jQuery(function ($) {
            var performance = [12, 43, 34, 22, 12, 33, 4, 17, 22, 34, 54, 67],
                visits = [123, 323, 443, 32],
                traffic = [
                {
                    Caja: "235", Capturados: 323, Change: 53, Porcentaje: 23, Objetivo: 600
                },
                {
                    Caja: "240", Capturados: 345, Change: 34, Porcentaje: 45, Objetivo: 567
                },
                {
                    Caja: "245", Capturados: 567, Change: 67, Porcentaje: 23, Objetivo: 456
                },
                {
                    Caja: "250", Capturados: 234, Change: 23, Porcentaje: 56, Objetivo: 890
                },
                {
                    Caja: "255", Capturados: 111, Change: 78, Porcentaje: 12, Objetivo: 345
                }];


            $("#shieldui-chart1").shieldChart({
                theme: "dark",

                primaryHeader: {
                    text: "Produccion"
                },
                exportOptions: {
                    image: false,
                    print: false
                },
                dataSeries: [{
                    seriesType: "area",
                    collectionAlias: "Tramites Terminados",
                    data: performance
                }]
            });

            $("#shieldui-chart2").shieldChart({
                theme: "dark",
                primaryHeader: {
                    text: "Traffic Per week"
                },
                exportOptions: {
                    image: false,
                    print: false
                },
                dataSeries: [{
                    seriesType: "pie",
                    collectionAlias: "traffic",
                    data: visits
                }]
            });

            $("#shieldui-grid1").shieldGrid({
                dataSource: {
                    data: traffic
                },
                sorting: {
                    multiple: true
                },
                rowHover: false,
                paging: false,
                columns: [
                { field: "Caja", width: "170px", title: "Caja" },
                { field: "Capturados", title: "Capturados" },                
                { field: "Porcentaje", title: "Porcentaje", format: "{0} %" },
                { field: "Objetivo", title: "Objetivo" },
                ]
            });

            var lbl = document.getElementById("lbl_entrega");
            lbl.text = $("#mySelect:selected").text();
        });        

        /* When the user clicks on the button, toggle between hiding and showing the dropdown content */
        function myFunction() {
            var menu = document.getElementById("myDropdown");
            menu.classList.toggle("show");
        }

        function traerEntrega() {
            document.getElementById("lbl_entrega").text = document.getElementById("btn_e1").value;
        }

        // Close the dropdown menu if the user clicks outside of it
        window.onclick = function (event)
        {
            if (event.target.classname=='dropbtn')
            {
                var dropdowns = document.getElementsByClassName("dropdown-content");
                var i;
                for (i = 0; i < dropdowns.length; i++)
                {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show'))
                    { openDropdown.classList.remove('show'); }
                }
            }
        }
            //else {
            //    document.getElementById("ctrl_loader").Visible = false;
            //    alert(event.toString());
            //}

        function function_Start_Load() {
            document.getElementById("ctrl_loader").Visible = true;
        }
        function function_entrega() {
            var btn = document.getElementById("btn_e1").value;
            
            var lbl = document.getElementById("lbl_entrega");
            lbl.text = Date.now.toString();
        }
    </script>
</body>
</html>
