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
            	        text: '测试数据'
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        formatter: function (params) {
            	            if (params.indicator2) { // is edge
            	                return params.value.weight;
            	            } else {// is node
            	                return params.name
            	            }
            	        }
            	    },
            	    toolbox: {
            	        show : true,
            	        y:'bottom',
            	        feature : {
            	            restore : {show: true},
            	            magicType: {show: true, type: ['force', 'chord']},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    legend: {
            	        x: 'right',
            	        data:['g1','g2', 'g3', 'g4']
            	    },
            	    series : [
            	        {
            	            type:'chord',
            	            radius : ['55%', '75%'],
            	            center : ['50%', '50%'],
            	            padding : 2,
            	            sort : 'descending', // can be 'none', 'ascending', 'descending'
            	            sortSub : 'descending', // can be 'none', 'ascending', 'descending'
            	            startAngle : 90,
            	            clockWise : false,
            	            showScale : true,
            	            showScaleText : true,
            	            itemStyle : {
            	                normal : {
            	                    borderWidth : 0,
            	                    borderColor : '#000',
            	                    chordStyle : {
            	                        borderWidth : 1,
            	                        borderColor : '#333'
            	                    },
            	                    label: {
            	                        show: true,
            	                        color: 'red'
            	                    }
            	                },
            	                emphasis : {
            	                    borderWidth : 0,
            	                    borderColor : '#000',
            	                    chordStyle : {
            	                        borderWidth : 2,
            	                        borderColor : 'black'
            	                    }
            	                }
            	            },
            	            data : [
            	                {
            	                    name : 'g1',
            	                    itemStyle : {
            	                        normal: {
            	                            color: 'rgba(255,30,30,0.5)',
            	                            lineStyle : {
            	                                width: 1,
            	                                color: 'green'
            	                            }
            	                        },
            	                        emphasis: {
            	                            color: 'yellow',
            	                            lineStyle : {
            	                                width: 2,
            	                                color: 'blue'
            	                            }
            	                        }
            	                    }
            	                },
            	                {name : 'g2'},
            	                {name : 'g3'},
            	                {name : 'g4'}
            	            ],
            	            matrix : [
            	                [11975,  5871, 8916, 2868],
            	                [ 1951, 10048, 2060, 6171],
            	                [ 8010, 16145, 8090, 8045],
            	                [ 1013,   990,  940, 6907]
            	            ],
            	            markPoint : {
            	                symbol: 'star',
            	                data : [
            	                    {name : '打酱油的标注', value : 100, x:'5%', y:'50%', symbolSize:32},
            	                    {name : '打酱油的标注', value : 100, x:'95%', y:'50%', symbolSize:32}
            	                ]
            	            }
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
