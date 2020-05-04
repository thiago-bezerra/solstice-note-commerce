<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="isTrade" value="${param.type == 'exchange'}" />

<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>Minhas ${isTrade ? 'Trocas' : 'Devoluções'} | LapTop Computadores</title>

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
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container">
          <div class="col-sm-6 mb-3">
            <h1>Minhas ${isTrade ? 'Trocas' : 'Devoluções'}</h1>
          </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">
          <div class="card card-default">
            <div class="card-body table-responsive">
              <table id="products-table" class="table table-borderless table-striped">
                <thead>
                  <tr>
                    <th>Data do pedido</th>
                    <th>Venda relacionada</th>
                    <th>Produto</th>
                    <th>Quantidade</th>
                    <th>Nº Rastreamento</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${trades}" var="trade">
                    <tr>
                      <td><span class="dt-date-sort">${trade.getFormattedISORequestDate()}"</span>${trade.getFormattedRequestDate()}</td>
                      <td><a href="/note-commerce/customer/sales?operation=consult&show_modal=${trade.sale.id}">${trade.sale.identifyNumber}</a></td>
                      <td><a href="/note-commerce/admin/products?operation=consult&table_filter=${trade.saleItem.product.title}">${trade.saleItem.product.title}</a></td>
                      <td>${trade.productQuantity}</td>
                      <td>${trade.trackingNumber}</td>
                      <td>
<c:choose>
  <c:when test="${isTrade}">
	<c:choose>
	  <c:when test="${trade.status.name() == 'AWAITING_AUTHORIZATION'}">
	                        <span class="badge bg-warning">Aguardando autorização</span>
	  </c:when>
	  <c:when test="${trade.status.name() == 'DENIED'}">
	                        <span class="badge bg-danger">Recusada</span>
	  </c:when>
	  <c:when test="${trade.status.name() == 'AUTHORIZED'}">
	                        <span class="badge bg-info">Aguardando retorno de produto</span>
	  </c:when>
	  <c:when test="${trade.status.name() == 'PRODUCT_RECEIVED'}">
	                        <span class="badge bg-success">Produto recebido</span>
	  </c:when>
	  <c:when test="${trade.status.name() == 'REPLACEMENT_ON_DELIVERY'}">
	                        <span class="badge bg-info">Produto em entrega</span>
	  </c:when>
	  <c:when test="${trade.status.name() == 'REPLACEMENT_DELIVERED'}">
	                        <span class="badge bg-success">Produto entregue</span>
	  </c:when>
	</c:choose>
  </c:when>
  <c:otherwise>
	<c:choose>
	  <c:when test="${trade.status.name() == 'AWAITING_AUTHORIZATION'}">
	                        <span class="badge bg-warning">Aguardando autorização</span>
	  </c:when>
	  <c:when test="${trade.status.name() == 'DENIED'}">
	                        <span class="badge bg-danger">Recusado</span>
	  </c:when>
	  <c:when test="${trade.status.name() == 'AUTHORIZED'}">
	                        <span class="badge bg-info">Aguardando retorno de produto</span>
	  </c:when>
	  <c:when test="${trade.status.name() == 'PRODUCT_RECEIVED'}">
	                        <span class="badge bg-success">Produto devolvido</span>
	  </c:when>
	</c:choose>
  </c:otherwise>
</c:choose>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
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
<!-- *********************************************************************************** -->
<!-- /PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->
<script type="text/javascript">
</script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>