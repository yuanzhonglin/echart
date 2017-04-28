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
            	        text: '手机占有率',
            	        subtext: '数据下钻例子，虚构数据'
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
            	    hoverable : true,
            	    series : [
            	        {
            	            name:'手机占有率',
            	            type:'treemap',
            	            center: ['40%', '50%'],
            	            size: ['50%', '80%'],
            	            itemStyle: {
            	                normal: {
            	                    label: {
            	                        show: true,
            	                        formatter: "{b}"
            	                    },
            	                    borderWidth: 1,
            	                    borderColor: '#ccc',
            	                    childBorderWidth: 1,
            	                    childBorderColor: '#fff'
            	                },
            	                emphasis: {
            	                    label: {
            	                        show: true
            	                    },
            	                    color: '#cc99cc',
            	                    borderWidth: 3,
            	                    borderColor: '#996699'
            	                }

            	            },
            	            data:[
            	                {
            	                    name: '三星',
            	                    itemStyle: {
            	                        normal: {
            	                            color: '#99cccc',
            	                        }
            	                    },
            	                    value: 6,
            	                    children: [
            	                        {
            	                            name: 'S4',
            	                            value: 6,
            	                            children: [
            	                                {
            	                                    name: '2012',
            	                                    value: 6
            	                                },
            	                                {
            	                                    name: '2013',
            	                                    value: 4
            	                                },
            	                                {
            	                                    name: '2014',
            	                                    value: 3
            	                                }
            	                            ]
            	                        },
            	                        {
            	                            name: 'note 3',
            	                            value: 6
            	                        },
            	                        {
            	                            name: 'S5',
            	                            value: 4
            	                        },
            	                        {
            	                            name: 'S6',
            	                            value: 3
            	                        }
            	                    ]
            	                },
            	                {
            	                    name: '小米',
            	                    itemStyle: {
            	                        normal: {
            	                            color: '#99ccff',
            	                        }
            	                    },
            	                    value: 4
            	                },
            	                {
            	                    name: '苹果',
            	                    itemStyle: {
            	                        normal: {
            	                            color: '#9999cc',
            	                        }
            	                    },
            	                    value: 4
            	                },
            	                {
            	                    name: '魅族',
            	                    itemStyle: {
            	                        normal: {
            	                            color: '#ccff99',
            	                        }
            	                    },
            	                    value: 3
            	                },
            	                {
            	                    name: '华为',
            	                    itemStyle: {
            	                        normal: {
            	                            color: '#ccffcc',
            	                        }
            	                    },
            	                    value: 2
            	                },
            	                {
            	                    name: '联想',
            	                    itemStyle: {
            	                        normal: {
            	                            color: '#ccccff',
            	                        }
            	                    },
            	                    value: 2
            	                },
            	                {
            	                    name: '中兴',
            	                    itemStyle: {
            	                        normal: {
            	                            color: '#ffffcc',
            	                            childBorderWidth: 2,
            	                            childBorderColor: '#000'
            	                        }
            	                    },
            	                    value: 1,
            	                    children: [
            	                        {
            	                            name: '努比亚',
            	                            value: 6
            	                        },
            	                        {
            	                            name: '大星星',
            	                            value: 5
            	                        }
            	                    ]
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
