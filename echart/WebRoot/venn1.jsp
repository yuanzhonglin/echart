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
            	    title : {
            	        text: '访问 vs 咨询',
            	        subtext: '配置的例子'
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        formatter: "{b}: {c}"
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    calculable : false,
            	    series : [
            	        {
            	            name:'韦恩图',
            	            type:'venn',
            	            itemStyle: {
            	                normal: {
            	                    label: {
            	                        show: true,
            	                        textStyle: {
            	                            fontFamily: 'Arial, Verdana, sans-serif',
            	                            fontSize: 16,
            	                            fontStyle: 'italic',
            	                            fontWeight: 'bolder'
            	                        }
            	                    },
            	                    labelLine: {
            	                        show: false,
            	                        length: 10,
            	                        lineStyle: {
            	                            // color: 各异,
            	                            width: 1,
            	                            type: 'solid'
            	                        }
            	                    }
            	                },
            	                emphasis: {
            	                    color: '#cc99cc',
            	                    borderWidth: 3,
            	                    borderColor: '#996699'
            	                }
            	            },
            	            data:[
            	                {
            	                    value:100, 
            	                    name:'访问',
            	                    itemStyle: {
            	                        normal: {
            	                            color: '#99cccc'
            	                        },
            	                        emphasis: {
            	                            color: '#2ec7c0',
            	                            borderWidth: 3,
            	                            borderColor: '#ffffcc'
            	                        }
            	                    }   
            	                },
            	                {
            	                    value:50, 
            	                    name:'咨询',
            	                    itemStyle: {
            	                        normal: {
            	                            color: '#99ccff'
            	                        }
            	                    }  
            	                },
            	                {
            	                    value:20, 
            	                    name:'公共',
            	                    itemStyle: {
            	                        normal: {
            	                            color: '#9999cc'
            	                        },
            	                        emphasis: {
            	                            color: '#ccffcc'
            	                        }
            	                    }  
            	                }
            	            ]
            	        }
            	    ]
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
