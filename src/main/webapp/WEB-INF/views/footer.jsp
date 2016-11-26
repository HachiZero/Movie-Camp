<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<footer class="page-footer teal accent-4">
<!--      
     <div class="container">
      <div class="row">
        <div class="col l6 s12">
          <h5 class="white-text">Footer Content</h5>
          <p class="grey-text text-lighten-4">You can use rows and columns here to organize your footer content.</p>
        </div>
        <div class="col l4 offset-l2 s12">
          <h5 class="white-text">Links</h5>
          <ul>
            <li><a class="grey-text text-lighten-3" href="#!">Link 1</a></li>
            <li><a class="grey-text text-lighten-3" href="#!">Link 2</a></li>
            <li><a class="grey-text text-lighten-3" href="#!">Link 3</a></li>
            <li><a class="grey-text text-lighten-3" href="#!">Link 4</a></li>
          </ul>
        </div>
      </div>
    </div>
 -->      
    <div class="footer-copyright">
      <div class="container">
	      © 2016 Copyright Text
	      <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
      </div>
    </div>
	
	
	<!--jQuery & materialize.js-->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
 	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
 	
 	
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script> -->
    <script type="text/javascript" src="../resources/js/materialize.min.js"></script>
    
    <!-- internal -->
    <script type="text/javascript" src="../resources/js/index.js"></script>
    <script type="text/javascript" src="../resources/js/jscookie.js"></script>
    
	<!-- fullpage -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.8.8/vendors/scrolloverflow.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.8.8/jquery.fullPage.js"></script>
	<!-- slick -->
	<script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>	
	
	<!-- datatables -->
	<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>	
	<script src="https://cdn.datatables.net/1.10.12/js/dataTables.uikit.min.js"></script>
	
	<!-- highcharts --> <!-- highcharts 우선 선언되야 사용가능하기 때문에 r_msgChart.jsp에 적용 -->
	<!-- 	
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/data.js"></script>
	<script src="https://code.highcharts.com/modules/drilldown.js"></script> 
	-->
	
	<script type="text/javascript">
	$(document).ready(function() {
	    $('#ex').DataTable({
	    	scrollCollapse: true,
	    	"ordering": false,
	        "info": false,
	        "bFilter": false,
	    });
	});
	</script>	
</footer>