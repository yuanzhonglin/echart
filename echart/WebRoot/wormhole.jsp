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
            	    color : (function (){
            	        var zrColor = require('zrender/tool/color');
            	        return zrColor.getStepColors('yellow', 'red', 28);
            	    })(),
            	    title : {
            	        text: '浏览器占比变化',
            	        subtext: '纯属虚构',
            	        x:'right',
            	        y:'bottom'
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        backgroundColor : 'rgba(0,0,250,0.2)'
            	    },
            	    legend: {
            	       // orient : 'vertical',
            	        //x : 'center',
            	        data: function (){
            	                var list = [];
            	                for (var i = 1; i <=28; i++) {
            	                    list.push(i + 2000);
            	                }
            	                return list;
            	            }()
            	    },
            	    toolbox: {
            	        show : true,
            	        orient : 'vertical',
            	        y:'center',
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	   polar : [
            	       {
            	           indicator : [
            	               { text: 'IE8-', max: 400},
            	               { text: 'IE9+', max: 400},
            	               { text: 'Safari', max: 400},
            	               { text: 'Firefox', max: 400},
            	               { text: 'Chrome', max: 400}
            	            ],
            	            center : ['50%', 240],
            	            radius : 150
            	        }
            	    ],
            	    calculable : false,
            	    series : (function (){
            	        var series = [];
            	        for (var i = 1; i <= 28; i++) {
            	            series.push({
            	                name:'浏览器（数据纯属虚构）',
            	                type:'radar',
            	                symbol:'none',
            	                itemStyle: {
            	                    normal: {
            	                        lineStyle: {
            	                          width:1
            	                        }
            	                    },
            	                    emphasis : {
            	                        areaStyle: {color:'rgba(0,250,0,0.3)'}
            	                    }
            	                },
            	                data:[
            	                  {
            	                    value:[
            	                        (40 - i) * 10,
            	                        (38 - i) * 4 + 60,
            	                        i * 5 + 10,
            	                        i * 9,
            	                        i * i /2
            	                    ],
            	                    name:i + 2000
            	                  }
            	                ]
            	            })
            	        }
            	        return series;
            	    })()
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
