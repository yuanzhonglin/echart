<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<script type="text/javascript" src="js/echarts/echarts.js" ></script> 
	<meta charset="utf-8">
    <script type="text/javascript">
	   // 路径配置  
	   require.config({  
	       paths: {  
	           echarts: 'js/echarts'  
	       }  
	   });  
	    // 使用  
	    require(  
	        [  
	            'echarts',  
	            'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载  
	        ],  
        function (ec) {  
            // 基于准备好的dom，初始化echarts图表  
            var myChart = ec.init(document.getElementById('main'));   
              
            option = {
            	    tooltip : {
            	        trigger: 'axis'
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            dataZoom : {show: true},
            	            dataView : {show: true},
            	            magicType : {show: true, type: ['line', 'bar']},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    dataZoom : {
            	        show : true,
            	        realtime : true,
            	        //orient: 'vertical',   // 'horizontal'
            	        //x: 0,
            	        y: 36,
            	        //width: 400,
            	        height: 20,
            	        //backgroundColor: 'rgba(221,160,221,0.5)',
            	        //dataBackgroundColor: 'rgba(138,43,226,0.5)',
            	        //fillerColor: 'rgba(38,143,26,0.6)',
            	        //handleColor: 'rgba(128,43,16,0.8)',
            	        //xAxisIndex:[],
            	        //yAxisIndex:[],
            	        start : 40,
            	        end : 60
            	    },
            	    xAxis : [
            	        {
            	            type : 'category',
            	            boundaryGap : false,
            	            data : function (){
            	                var list = [];
            	                var n = 0;
            	                while (n++ < 150) {
            	                    list.push(n);
            	                }
            	                return list;
            	            }()
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'value'
            	        }
            	    ],
            	    series : [
            	        {
            	            name:'dz',
            	            type:'line',
            	            data:function (){
            	                var list = [];
            	                for (var i = 1; i <= 150; i++) {
            	                    list.push(Math.round(Math.random()* 30));
            	                }
            	                return list;
            	            }()
            	        }
            	    ],
            	    calculable:false
            	};

            
            // 为echarts对象加载数据   
            myChart.setOption(option);   
        }  
    );  
    </script>
  </head>
  
  <body>
   <div id="main" style="width: 600px;height:400px;"></div> 
  </body>
</html>
