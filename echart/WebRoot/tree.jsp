<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
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
            	        text: '树图',
            	        subtext: '虚构数据'
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
            	            name:'树图',
            	            type:'tree',
            	            orient: 'vertical',  // vertical horizontal
            	            rootLocation: {x: 'center',y: 50}, // 根节点位置  {x: 100, y: 'center'}
            	            nodePadding: 1,
            	            itemStyle: {
            	                normal: {
            	                    label: {
            	                        show: false,
            	                        formatter: "{b}"
            	                    },
            	                    lineStyle: {
            	                        color: '#48b',
            	                        shadowColor: '#000',
            	                        shadowBlur: 3,
            	                        shadowOffsetX: 3,
            	                        shadowOffsetY: 5,
            	                        type: 'curve' // 'curve'|'broken'|'solid'|'dotted'|'dashed'

            	                    }
            	                },
            	                emphasis: {
            	                    label: {
            	                        show: true
            	                    }
            	                }
            	            },
            	            
            	            data: [
            	                {
            	                    name: '根节点',
            	                    value: 6,
            	                    children: [
            	                        {
            	                            name: '节点1',
            	                            value: 4,
            	                            children: [
            	                                {
            	                                    name: '叶子节点1',
            	                                    value: 4
            	                                },
            	                                {
            	                                    name: '叶子节点2',
            	                                    value: 4
            	                                },
            	                                {
            	                                    name: '叶子节点3',
            	                                    value: 2
            	                                },
            	                                 {
            	                                    name: '叶子节点4',
            	                                    value: 2
            	                                },
            	                                {
            	                                    name: '叶子节点5',
            	                                    value: 2
            	                                },
            	                                {
            	                                    name: '叶子节点6',
            	                                    value: 4
            	                                }
            	                            ]
            	                        },
            	                        {
            	                            name: '节点2',
            	                            value: 4,
            	                            children: [{
            	                                name: '叶子节点7',
            	                                value: 4
            	                            },
            	                            {
            	                                name: '叶子节点8',
            	                                value: 4
            	                            }]
            	                        },
            	                        {
            	                            name: '节点3',
            	                            value: 1,
            	                            children: [
            	                                {
            	                                    name: '叶子节点9',
            	                                    value: 4
            	                                },
            	                                {
            	                                    name: '叶子节点10',
            	                                    value: 4
            	                                },
            	                                {
            	                                    name: '叶子节点11',
            	                                    value: 2
            	                                },
            	                                 {
            	                                    name: '叶子节点12',
            	                                    value: 2
            	                                }
            	                            ]
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
