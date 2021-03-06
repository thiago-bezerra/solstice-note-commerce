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

  <title>Entrada em Estoque | LapTop Computadores</title>

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
  <!-- Select2 -->
  <link rel="stylesheet" href="../../static/plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="../../static/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- *********************************************************************************** -->
  <!-- /PAGE PLUGIN STYLES -->
  <!-- *********************************************************************************** -->



  <!-- *********************************************************************************** -->
  <!-- PAGE CUSTOM STYLES -->
  <!-- *********************************************************************************** -->
  <link rel="stylesheet" href="/note-commerce/static/custom/general/css/tables.css">
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
              <h1>Entrada em Estoque</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="/note-commerce/pages/admin/dashboard.jsp">Admin Home</a></li>
                <li class="breadcrumb-item active">Entrada em Estoque</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">

          <form action="/note-commerce/admin/stockHistory" method="POST">
            <input type="hidden" name="operation" value="save">
            <div class="row d-flex justify-content-center">
              <div class="col col-8">
                <div class="card card-default">
                  <div class="card-body">
                    <div class="row">
                      <div class="col col-12">
                        <div class="form-group">
                          <label for="laptop">Laptop<span class="text-danger text-bold"> *</span></label>
                          <select class="form-control select2bs4" style="width: 100%;" name="idProduct" id="idProduct" required>
                          </select>
                        </div>
                      </div>
                      <div class="col col-3">
                        <div class="form-group">
                          <label for="amount">Quantidade<span class="text-danger text-bold"> *</span></label>
                          <input type="text" class="form-control" name="quantity" id="quantity" required>
                        </div>
                      </div>
                      <div class="col col-4">
                        <div class="form-group">
                          <label for="amount">Data<span class="text-danger text-bold"> *</span></label>
                          <input type="date" class="form-control" name="date" id="date" required>
                        </div>
                      </div>
                      <div class="col col-4">
                        <div class="form-group">
                          <label for="amount">Horário<span class="text-danger text-bold"> *</span></label>
                          <input type="time" class="form-control" name="time" id="time" required>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="row d-flex justify-content-center">
              <div class="col col-4">
                <a href="/note-commerce/admin/stockHistory?operation=consult" class="btn btn-block btn-danger"
                  role="button">Cancelar</a>
              </div>
              <div class="col col-4">
                <button type="submit" class="btn btn-block btn-primary">Dar Entrada</button>
              </div>
            </div>
          </form>

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
<!-- Select2 -->
<script src="../../static/plugins/select2/js/select2.full.min.js"></script>
<!-- InputMask -->
<script src="../../static/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<!-- *********************************************************************************** -->
<!-- /PAGE PLUGINS SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->
<!-- <script src="/note-commerce/static/custom/admin/sales/js/sales.js"></script> -->
<!-- *********************************************************************************** -->
<!-- /PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->
<script>
  $(document).ready(() => {

    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })

    $('#quantity').inputmask('numeric', {
      digits: 0,
      min: 1,
      max: 5000,
      allowMinus: true,
      autoUnmask: true,
      removeMaskOnSubmit: true
    });

    //$('#time').inputmask("hh:mm");

    $.ajax({
      url: '/note-commerce/shop/products?operation=consult',
      type: 'GET',
      dataType: 'json',
      success: function (json) {
        const products = json;
        console.log('products:', products)
        products.forEach(p => {
          $('#idProduct').append(new Option(p.title, p.id, false, false));
        });
      }
    });


  })
</script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>