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
            	        text: 'webkit内核依赖',
            	        subtext: '数据来自网络',
            	        x:'right',
            	        y:'bottom'
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        formatter : "{b}"
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            restore : {show: true},
            	            magicType: {
            	                show: true,
            	                type: ['force', 'chord'],
            	                option: {
            	                    chord: {
            	                        minRadius : 2,
            	                        maxRadius : 10,
            	                        ribbonType: false,
            	                        itemStyle: {
            	                            normal: {
            	                                label: {
            	                                    show: true,
            	                                    rotate: true
            	                                },
            	                                chordStyle: {
            	                                    opacity: 0.2
            	                                }
            	                            }
            	                        }
            	                    },
            	                    force: {
            	                        minRadius : 5,
            	                        maxRadius : 8,
            	                        itemStyle : {
            	                            normal : {
            	                                label: {
            	                                    show: false
            	                                },
            	                                linkStyle : {
            	                                    opacity : 0.5
            	                                }
            	                            }
            	                        }
            	                    }
            	                }
            	            },
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    legend : {
            	        data : ['HTMLElement', 'WebGL', 'SVG', 'CSS', 'Other'],
            	        orient : 'vertical',
            	        x : 'left'
            	    },
            	    noDataEffect: 'none',
            	    series :[{
            	        //FIXME No data
            	        type: 'force',
            	    }],
            	};
            	$.ajax({
            	    url: 'data/webkit-dep.json',
            	    dataType: 'json',
            	    success: function (data) {
            	        option.series[0] = {
            	            type: 'chord',
            	            ribbonType: false,
            	            name: 'webkit-dep',
            	            itemStyle: {
            	                normal: {
            	                    label: {
            	                        show: true,
            	                        rotate: true
            	                    },
            	                    chordStyle: {
            	                        opacity: 0.2
            	                    }
            	                }
            	            },
            	            categories: data.categories,
            	            nodes: data.nodes,
            	            links: data.links,
            	            minRadius: 2,
            	            maxRadius: 10,
            	            gravity: 1.1,
            	            scaling: 1.1,
            	            steps: 20,
            	            large: true,
            	            useWorker: true,
            	            coolDown: 0.995
            	        };

            	        myChart.setOption(option);
            	        myChart.hideLoading();
            	    }
            	});
            
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
