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
              
            effectIndex = ++effectIndex % effect.length;
            myChart.showLoading({
                text : effect[effectIndex],
                effect : effect[effectIndex],
                textStyle : {
                    fontSize : 20
                }
            });
            option = {
                tooltip : {
                    trigger: 'axis'
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        magicType : {show: true, type: ['line', 'bar']},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                legend: {
                    data:['蒸发量','降水量']
                },
                xAxis : [
                    {
                        type : 'category',
                        data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                    }
                ],
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                series : [
                    {
                        name:'蒸发量',
                        type: effectIndex % 2 == 0 ? 'bar' : 'line',
                        data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
                    },
                    {
                        name:'降水量',
                        type: effectIndex % 2 == 0 ? 'bar' : 'line',
                        data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
                    }
                ]
            };
            clearTimeout(loadingTicket);
            loadingTicket = setTimeout(function (){
                myChart.hideLoading();
                myChart.setOption(option);
            },2200);
            
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
