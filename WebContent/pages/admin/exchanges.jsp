<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>Trocas | LapTop Computadores</title>

  <!-- *********************************************************************************** -->
  <!-- REQUIRED STYLES -->
  <!-- *********************************************************************************** -->
  <jsp:include page="/fragments/general/styles.jsp"></jsp:include>
  <!-- *********************************************************************************** -->
  <!-- /REQUIRED STYLES -->
  <!-- *********************************************************************************** -->



  <!-- *********************************************************************************** -->
  <!-- PAGE PLUGIN STYLES -->
  <!-- *********************************************************************************** -->
  <!-- DataTables -->
  <link rel="stylesheet" href="../../static/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
  <!-- *********************************************************************************** -->
  <!-- /PAGE PLUGIN STYLES -->
  <!-- *********************************************************************************** -->



  <!-- *********************************************************************************** -->
  <!-- PAGE CUSTOM STYLES -->
  <!-- *********************************************************************************** -->
  <!-- Custom CSS -->
  <link rel="stylesheet" href="../../static/custom/general/css/tables.css">
  <!-- *********************************************************************************** -->
  <!-- /PAGE CUSTOM STYLES -->
  <!-- *********************************************************************************** -->
</head>



<body class="hold-transition sidebar-mini sidebar-collapse">

  <c:set var="loggedUser" value="${sessionScope.loggedUser}" />

  <div class="wrapper">
    <!-- *********************************************************************************** -->
    <!-- ADMIN SIDEBAR AND NAVBAR -->
    <!-- *********************************************************************************** -->
    <jsp:include page="/fragments/admin/navbar.jsp"></jsp:include>
    <jsp:include page="/fragments/admin/sidebar.jsp"></jsp:include>
    <!-- *********************************************************************************** -->
    <!-- /ADMIN SIDEBAR AND NAVBAR -->
    <!-- *********************************************************************************** -->



    <!-- *********************************************************************************** -->
    <!-- PAGE CONTENT -->
    <!-- *********************************************************************************** -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Trocas</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="dashboard.html">Admin Home</a></li>
                <li class="breadcrumb-item active">Trocas</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">

          <div class="card card-default">
            <div class="card-header">
              <h3 class="card-title">Lista de Trocas</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                    class="fas fa-minus"></i></button>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body table-responsive">
              <table id="products-table" class="table table-borderless table-striped">
                <thead>
                  <tr>
                    <th>Data do pedido de troca</th>
                    <th>Venda relacionada</th>
                    <th>Produto</th>
                    <th>Nº Rastreamento</th>
                    <th>Status</th>
                    <th>Ações</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><span class="dt-date-sort">2020-01-12</span>12/01/2020</td>
                    <td><a href="sales.html">324543535</a></td>
                    <td class="truncate-text" style="max-width: 200px;"><a href="/note-commerce/admin/products?operation=consult">Notebook HP Novo i5-15251 GTX 01804tI</a></td>
                    <td></td>
                    <td><span class="badge bg-warning">Em troca</span></td>
                    <td class="text-center">
                      <button type="button" class="btn btn-xs btn-info"><i class="fas fa-hands-helping"></i> Autorizar troca</button>
                    </td>
                  </tr>
                  <tr>
                    <td><span class="dt-date-sort">2010-01-12</span>12/01/2010</td>
                    <td><a href="sales.html">6568768</a></td>
                    <td class="truncate-text" style="max-width: 200px;"><a href="/note-commerce/admin/products?operation=consult">Notebook HP Novo i5-15251 GTX 01804tI</a></td>
                    <td>0-678678678</td>
                    <td><span class="badge bg-info">Troca Autorizada</span></td>
                    <td class="text-center">
                      <button type="button" class="btn btn-xs btn-success"><i class="fas fa-check"></i> Marcar como Trocado</button>
                    </td>
                  </tr>
                  <tr>
                    <td><span class="dt-date-sort">2010-01-12</span>12/01/2010</td>
                    <td><a href="sales.html">234234</a></td>
                    <td class="truncate-text" style="max-width: 200px;"><a href="/note-commerce/admin/products?operation=consult">Notebook HP Novo i5-15251 GTX 01804tI</a></td>
                    <td></td>
                    <td><span class="badge bg-warning">Em troca</span></td>
                    <td class="text-center">
                      <button type="button" class="btn btn-xs btn-info"><i class="fas fa-hands-helping"></i> Autorizar troca</button>
                    </td>
                  </tr>
                  <tr>
                    <td><span class="dt-date-sort">2020-05-05</span>05/05/2020</td>
                    <td><a href="sales.html">324543535</a></td>
                    <td class="truncate-text" style="max-width: 200px;"><a href="/note-commerce/admin/products?operation=consult">Notebook HP Novo i5-15251 GTX 01804tI</a></td>
                    <td>0-768686</td>
                    <td><span class="badge bg-success">Trocado</span></td>
                    <td class="text-center">
                      <small>Sem Ações</small>
                    </td>
                  </tr>
                  <tr>
                    <td><span class="dt-date-sort">2020-01-12</span>12/01/2020</td>
                    <td><a href="sales.html">345345</a></td>
                    <td class="truncate-text" style="max-width: 200px;"><a href="/note-commerce/admin/products?operation=consult">Notebook HP Novo i5-15251 GTX 01804tI</a></td>
                    <td></td>
                    <td><span class="badge bg-warning">Em troca</span></td>
                    <td class="text-center">
                      <button type="button" class="btn btn-xs btn-info"><i class="fas fa-hands-helping"></i> Autorizar troca</button>
                    </td>
                  </tr>
                  <tr>
                    <td><span class="dt-date-sort">2020-01-12</span>12/01/2020</td>
                    <td><a href="sales.html">0-00-090908</a></td>
                    <td class="truncate-text" style="max-width: 200px;"><a href="/note-commerce/admin/products?operation=consult">Notebook HP Novo i5-15251 GTX 01804tI</a></td>
                    <td>0-12312312</td>
                    <td><span class="badge bg-info">Troca Autorizada</span></td>
                    <td class="text-center">
                      <button type="button" class="btn btn-xs btn-success"><i class="fas fa-check"></i> Marcar como Trocado</button>
                    </td>
                  </tr>
                  <tr>
                    <td><span class="dt-date-sort">2020-03-24</span>24/03/2020</td>
                    <td><a href="sales.html">324543535</a></td>
                    <td class="truncate-text" style="max-width: 200px;"><a href="/note-commerce/admin/products?operation=consult">Notebook HP Novo i5-15251 GTX 01804tI</a></td>
                    <td></td>
                    <td><span class="badge bg-warning">Em troca</span></td>
                    <td class="text-center">
                      <button type="button" class="btn btn-xs btn-info"><i class="fas fa-hands-helping"></i> Autorizar troca</button>
                    </td>
                  </tr>
                  <tr>
                    <td><span class="dt-date-sort">2020-04-13</span>13/04/2020</td>
                    <td><a href="sales.html">324543535</a></td>
                    <td class="truncate-text" style="max-width: 200px;"><a href="/note-commerce/admin/products?operation=consult">Notebook HP Novo i5-15251 GTX 01804tI</a></td>
                    <td>0-09808080</td>
                    <td><span class="badge bg-success">Trocado</span></td>
                    <td class="text-center">
                      <small>Sem Ações</small>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>


        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content -->
    </div>
    <!-- *********************************************************************************** -->
    <!-- /PAGE CONTENT -->
    <!-- *********************************************************************************** -->



    <!-- Main Footer -->
    <footer class="main-footer">
      <!-- To the right -->
      <div class="float-right d-none d-sm-inline">
        <a target="_blank" href="https://github.com/thiago-bezerra/solstice-note-commerce">GitHub</a>
      </div>
      <!-- Default to the left -->
      <strong>Desenvolvido por</strong>
      <img src="/note-commerce/static/custom/general/img/solstice_logo.png" style="height: 25px;">
    </footer>
    
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
      <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
  </div>
  <!-- ./wrapper -->



  <!-- *********************************************************************************** -->
  <!-- PAGE EXTRA HTML -->
  <!-- *********************************************************************************** -->

  <!-- *********************************************************************************** -->
  <!-- /PAGE EXTRA HTML -->
  <!-- *********************************************************************************** -->
</body>



<!-- *********************************************************************************** -->
<!-- REQUIRED SCRIPTS -->
<!-- *********************************************************************************** -->
<jsp:include page="/fragments/general/scripts.jsp"></jsp:include>
<!-- *********************************************************************************** -->
<!-- /REQUIRED SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PAGE PLUGINS SCRIPTS -->
<!-- *********************************************************************************** -->
  <script src="../../static/plugins/datatables/jquery.dataTables.js"></script>
  <script src="../../static/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
<!-- *********************************************************************************** -->
<!-- /PAGE PLUGINS SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->
  <!-- <script src="../../static/custom/admin/exchanges/js/exchanges.js"></script> -->
<!-- *********************************************************************************** -->
<!-- /PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->
  <script>
    $(document).ready(() => {

      $('#products-table').DataTable({
        columnDefs: [
          {
            targets: [4], // Colunas de: [Ações]
            searchable: false,
            orderable: false
          }
        ],
        // Internacionalização Português-Brasil - https://datatables.net/plug-ins/i18n/Portuguese-Brasil
        language: { "sEmptyTable": "Nenhum registro encontrado", "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros", "sInfoEmpty": "Mostrando 0 até 0 de 0 registros", "sInfoFiltered": "(Filtrados de _MAX_ registros)", "sInfoPostFix": "", "sInfoThousands": ".", "sLengthMenu": "_MENU_ resultados por página", "sLoadingRecords": "Carregando...", "sProcessing": "Processando...", "sZeroRecords": "Nenhum registro encontrado", "sSearch": "Pesquisar", "oPaginate": { "sNext": "Próximo", "sPrevious": "Anterior", "sFirst": "Primeiro", "sLast": "Último" }, "oAria": { "sSortAscending": ": Ordenar colunas de forma ascendente", "sSortDescending": ": Ordenar colunas de forma descendente" }, "select": { "rows": { "0": "Nenhuma linha selecionada", "1": "Selecionado 1 linha", "_": "Selecionado %d linhas" } } }
      });

    })
  </script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>