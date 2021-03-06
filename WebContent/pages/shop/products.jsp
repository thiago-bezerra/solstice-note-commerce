<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>Produtos | LapTop Computadores</title>

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
  <!-- iCheck bootstrap -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- *********************************************************************************** -->
  <!-- /PAGE PLUGIN STYLES -->
  <!-- *********************************************************************************** -->



  <!-- *********************************************************************************** -->
  <!-- PAGE CUSTOM STYLES -->
  <!-- *********************************************************************************** -->
  <link rel="stylesheet" href="/note-commerce/static/custom/shop/products/css/products.css">
  <!-- *********************************************************************************** -->
  <!-- /PAGE CUSTOM STYLES -->
  <!-- *********************************************************************************** -->
</head>



<body class="hold-transition layout-top-nav">

  <c:set var="loggedUser" value="${sessionScope.loggedUser}" />

  <div class="wrapper">
    <!-- *********************************************************************************** -->
    <!-- SHOP/CUSTOMER NAVBAR -->
    <!-- *********************************************************************************** -->
    <jsp:include page="/fragments/shop/navbar.jsp"></jsp:include>
    <!-- *********************************************************************************** -->
    <!-- /SHOP/CUSTOMER NAVBAR -->
    <!-- *********************************************************************************** -->



    <!-- *********************************************************************************** -->
    <!-- PAGE CONTENT -->
    <!-- *********************************************************************************** -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container">



        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">



          <div class="row">
            <div class="col-md-3 sticky-top">
              <div class="card card-primary card-outline">
                <div class="card-body box-profile">

                  <h4 class="text-center mb-4">Filtros</h4>

                  <form id="products-filter" method="POST">


                    <div class="row">
                      <div class="form-group text-xs mb-2 w-100">
                        <label for="maximum-price">Preço Mínimo</label>
                        <input type="number" min="0" max="100000" step="50" name="minimum-price"
                          class="form-control form-control-sm" placeholder="R$ 1000">
                      </div>
                    </div>

                    <div class="row">
                      <div class="form-group text-xs mb-2 w-100">
                        <label for="maximum-price">Preço Máximo</label>
                        <input type="number" min="0" max="100000" step="50" name="maximum-price"
                          class="form-control form-control-sm" placeholder="R$ 5000">
                      </div>
                    </div>
                    <div class="row mb-2">
                      <div class="col col-6 text-left">
                        <button type="button" class="btn btn-xs btn-secondary" id="clear-button">Limpar</button>
                      </div>
                      <div class="col col-6 text-right">
                        <button type="button" class="btn btn-xs btn-primary float-right">Aplicar</button>
                      </div>
                    </div>
                    <div class="row">
                      <ul class="list-group list-group-unbordered w-100">
                        <li class="list-group-item">
                          <div class="row mb-2">
                            <div class="col col-10">
                              <span class="text-sm">Marca</span>
                            </div>
                            <div class="col col-2">
                              <button type="button" class="btn btn-tool pull-right" data-toggle="collapse"
                                data-target="#filter-group-brand">
                                <i class="fas fa-minus"></i></button>
                            </div>
                          </div>
                          <div id="filter-group-brand" class="collapse show">
                            <div class="icheck-primary">
                              <input type="checkbox" id="brand-acer" name="brand[]" value="acer">
                              <label for="brand-acer">Acer</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="brand-asus" name="brand[]" value="asus">
                              <label for="brand-asus">Asus</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="brand-dell" name="brand[]" value="dell">
                              <label for="brand-dell">Dell</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="brand-hp" name="brand[]" value="hp">
                              <label for="brand-hp">Hp</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="brand-lenovo" name="brand[]" value="lenovo">
                              <label for="brand-lenovo">Lenovo</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="brand-positivo" name="brand[]" value="positivo">
                              <label for="brand-positivo">Positivo</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="brand-samsung" name="brand[]" value="samsung">
                              <label for="brand-samsung">Samsung</label>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item">
                          <div class="row mb-2">
                            <div class="col col-10">
                              <span class="text-sm">Memória RAM</span>
                            </div>
                            <div class="col col-2">
                              <button type="button" class="btn btn-tool pull-right" data-toggle="collapse"
                                data-target="#filter-group-ram">
                                <i class="fas fa-minus"></i></button>
                            </div>
                          </div>
                          <div id="filter-group-ram" class="collapse show">
                            <div class="icheck-primary">
                              <input type="checkbox" id="ram-2gb" name="ram[]" value="2gb">
                              <label for="ram-2gb">2GB</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="ram-4gb" name="ram[]" value="4gb">
                              <label for="ram-4gb">4GB</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="ram-8gb" name="ram[]" value="8gb">
                              <label for="ram-8gb">8GB</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="ram-16gb" name="ram[]" value="16gb">
                              <label for="ram-16gb">16GB</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="ram-others" name="ram[]" value="others">
                              <label for="ram-others">Outros</label>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item">
                          <div class="row mb-2">
                            <div class="col col-10">
                              <span class="text-sm">Tamanho do Monitor</span>
                            </div>
                            <div class="col col-2">
                              <button type="button" class="btn btn-tool pull-right" data-toggle="collapse"
                                data-target="#filter-group-monitor">
                                <i class="fas fa-minus"></i></button>
                            </div>
                          </div>
                          <div id="filter-group-monitor" class="collapse show">
                            <div class="icheck-primary">
                              <input type="checkbox" id="monitor-upto11" name="monitor[]" value="0-11">
                              <label for="monitor-upto11">até 11 polegadas</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="monitor-11-13" name="monitor[]" value="11-13">
                              <label for="monitor-11-13">11 - 13 polegadas</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="monitor-13-15" name="monitor[]" value="13-15">
                              <label for="monitor-13-15">13 - 15 polegadas</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="monitor-15-17" name="monitor[]" value="15-17">
                              <label for="monitor-15-17">15 - 17 polegadas</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="monitor-above17" name="monitor[]" value="17-99">
                              <label for="monitor-above17">acima de 17 pol.</label>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item">
                          <div class="row mb-2">
                            <div class="col col-10">
                              <span class="text-sm">Armazenamento</span>
                            </div>
                            <div class="col col-2">
                              <button type="button" class="btn btn-tool pull-right" data-toggle="collapse"
                                data-target="#filter-group-storage">
                                <i class="fas fa-minus"></i></button>
                            </div>
                          </div>
                          <div id="filter-group-storage" class="collapse show">
                            <div class="icheck-primary">
                              <input type="checkbox" id="storage-hd" name="storage-hd" value="storage-hd">
                              <label for="storage-hd">Com HD</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="storage-ssd" name="storage-ssd" value="storage-ssd">
                              <label for="storage-ssd">Com SSD</label>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item">
                          <div class="row mb-2">
                            <div class="col col-10">
                              <span class="text-sm">Sistema Operacional</span>
                            </div>
                            <div class="col col-2">
                              <button type="button" class="btn btn-tool pull-right" data-toggle="collapse"
                                data-target="#filter-group-os">
                                <i class="fas fa-minus"></i></button>
                            </div>
                          </div>
                          <div id="filter-group-os" class="collapse show">
                            <div class="icheck-primary">
                              <input type="checkbox" name="os-windows" id="os-windows" value="os-windows">
                              <label for="os-windows">Windows</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" name="os-linux" id="os-linux" value="os-linux">
                              <label for="os-linux">Linux</label>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </form>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
            <!-- /.col -->

            <div class="col-md-9">
              <div class="row" id="products-row">

              </div>
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->



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
  </div>
  <!-- ./wrapper -->



  <!-- *********************************************************************************** -->
  <!-- PAGE EXTRA HTML -->
  <!-- *********************************************************************************** -->
  <template id="product-card">
    <div class="col col-4">
      <div class="card card-primary product-card">
        <div class="ribbon-wrapper ribbon-lg d-none">
          <div class="ribbon"></div>
        </div>
        <a href="#" id="product-image-link">
          <div class="card-body text-center">
            <img id="product-image" class="img-fluid">
          </div>
        </a>
        <div class="card-footer">
          <div class="row mb-3">
            <a href="#" id="product-name-link" class="product-desc text-sm">
            </a>
          </div>
          <div class="row">
            <div class="col-10">
              <span class="font-weight-bold" id="product-price"></span>
            </div>
            <div class="col-2">
              <button class="btn btn-sm btn-success" name="addProduct" type="submit">
                <i class="fas fa-cart-plus"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>

  <template id="no-products-message">
    <div class="w-100 text-center">
      <i class="fas fa-heart-broken" style="font-size: 80pt;"></i>
      <h2>Nenhum produto encontrado!</h2>
      <h3> Tente uma pesquisa mais ampla!</h3>
    </div>
  </template>
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

<!-- *********************************************************************************** -->
<!-- /PAGE PLUGINS SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->
<script src="/note-commerce/static/custom/shop/products/js/products.js"></script>
<!-- *********************************************************************************** -->
<!-- /PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->
<script>
</script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>