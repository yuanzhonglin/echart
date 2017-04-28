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
            	        subtext: '虚构数据'
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
            	    hoverable : true,
            	    series : [
            	        {
            	            name:'矩形图',
            	            type:'treemap',
            	            itemStyle: {
            	                normal: {
            	                    label: {
            	                        show: true,
            	                        formatter: "{b}: {c}",
            	                        textStyle: {
            	                            color: '#00ffdd',
            	                            fontFamily: 'Times New Roman",Georgia,Serif',
            	                            fontSize: 20,
            	                            fontStyle: 'italic',
            	                            fontWeight:  'bolder'
            	                        }
            	                    },
            	                    borderWidth: 1,
            	                    borderColor: '#000'
            	                },
            	                emphasis: {
            	                    label: {
            	                        show: true,
            	                        textStyle: {
            	                            color: '#0000ff',
            	                            fontFamily: 'Times New Roman",Georgia,Serif',
            	                            fontSize: 18,
            	                            fontStyle: 'normal',
            	                            fontWeight:  'bold'
            	                        }
            	                    },
            	                    color: '#cc99cc',
            	                    borderWidth: 3,
            	                    borderColor: '#996699'
            	                }
            	            },
            	            data:[
            	                {
            	                    name: '三星',
            	                    value: 6,
            	                    itemStyle: {
            	                        normal: {
            	                            label: {
            	                                show: true,
            	                                formatter : "{b}最多",
            	                                x: 60,
            	                                y: 65,
            	                                textStyle: {
            	                                    color: '#ccc',
            	                                    fontSize: 16
            	                                }
            	                            },
            	                            color: '#ccff99',
            	                            borderWidth: 1
            	                        },
            	                        emphasis: {
            	                            label: {
            	                                show: true,
            	                                formatter : "{b}-{c}",
            	                                x: 80,
            	                                y: 85,
            	                                textStyle: {
            	                                    color: 'red',
            	                                    fontSize: 18
            	                                }
            	                            },
            	                            color: '#cc9999',
            	                            borderWidth: 3,
            	                            borderColor: '#999999'
            	                        }
            	                    },
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
            	                    value: 4,
            	                    itemStyle: {
            	                        normal: {
            	                            color: '#99ccff',
            	                        },
            	                        emphasis: {
            	                            label: {
            	                                show: false
            	                            }
            	                        }
            	                    }
            	                },
            	                {
            	                    name: '苹果',
            	                    value: 4,
            	                    itemStyle: {
            	                        normal: {
            	                            color: '#9999cc',
            	                        }
            	                    }
            	                },
            	                {
            	                    name: '魅族',
            	                    value: 3,
            	                    itemStyle: {
            	                        normal: {
            	                            color: '#99cccc',
            	                        }
            	                    }
            	                },
            	                {
            	                    name: '华为',
            	                    value: 2,
            	                    itemStyle: {
            	                        normal: {
            	                            color: '#ccffcc',
            	                        }
            	                    }
            	                },
            	                {
            	                    name: '联想',
            	                    value: 2,
            	                    itemStyle: {
            	                        normal: {
            	                            color: '#ccccff',
            	                        }
            	                    }
            	                },
            	                {
            	                    name: '中兴',
            	                    value: 1,
            	                    itemStyle: {
            	                        normal: {
            	                            label: {
            	                                show: true,
            	                                formatter: "{b}: {c}",
            	                            },
            	                            borderWidth: 3
            	                        },
            	                        emphasis: {
            	                            label: {
            	                                show: true
            	                            },
            	                            color: '#cc9999',
            	                            borderWidth: 3,
            	                            borderColor: '#999999'
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
