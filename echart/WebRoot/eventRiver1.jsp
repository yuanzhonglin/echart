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
            	        text: 'Event River',
            	        subtext: '纯属虚构'
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        enterable: true
            	    },
            	    legend: {
            	        data:['财经事件', '政治事件']
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    xAxis : [
            	        {
            	            type : 'time',
            	            boundaryGap: [0.05,0.1]
            	        }
            	    ],
            	    series : [
            	        {
            	            "name": "财经事件", 
            	            "type": "eventRiver", 
            	            "weight": 123, 
            	            "data": [
            	                {
            	                    "name": "阿里巴巴上市", 
            	                    "weight": 123, 
            	                    "evolution": [
            	                        {
            	                            "time": "2014-05-01", 
            	                            "value": 14, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-02", 
            	                            "value": 34, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-03", 
            	                            "value": 60, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-04", 
            	                            "value": 40, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-05", 
            	                            "value": 10, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }
            	                    ]
            	                }, 
            	                {
            	                    "name": "阿里巴巴上市2", 
            	                    "weight": 123, 
            	                    "evolution": [
            	                        {
            	                            "time": "2014-05-02", 
            	                            "value": 10, 
            	                            "detail": {
            	                                "link": "www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-03", 
            	                            "value": 34, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-04", 
            	                            "value": 40, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-05", 
            	                            "value": 10, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }
            	                    ]
            	                }, 
            	                {
            	                    "name": "三星业绩暴跌", 
            	                    "weight": 123, 
            	                    "evolution": [
            	                        {
            	                            "time": "2014-05-03", 
            	                            "value": 24, 
            	                            "detail": {
            	                                "link": "www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-04", 
            	                            "value": 34, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-05", 
            	                            "value": 50, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-06", 
            	                            "value": 30, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-07", 
            	                            "value": 20, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }
            	                    ]
            	                }
            	            ]
            	        }, 
            	        {
            	            "name": "政治事件", 
            	            "type": "eventRiver", 
            	            "weight": 123, 
            	            "data": [
            	                {
            	                    "name": "Apec峰会", 
            	                    "weight": 123, 
            	                    "evolution": [
            	                        {
            	                            "time": "2014-05-06", 
            	                            "value": 14, 
            	                            "detail": {
            	                                "link": "www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-07", 
            	                            "value": 34, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-08", 
            	                            "value": 60, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-09", 
            	                            "value": 40, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-10", 
            	                            "value": 20, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }
            	                    ]
            	                }, 
            	                {
            	                    "name": "运城官帮透视", 
            	                    "weight": 123, 
            	                    "evolution": [
            	                        {
            	                            "time": "2014-05-08", 
            	                            "value": 4, 
            	                            "detail": {
            	                                "link": "www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-09", 
            	                            "value": 14, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-10", 
            	                            "value": 30, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-11", 
            	                            "value": 20, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-12", 
            	                            "value": 10, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }
            	                    ]
            	                }, 
            	                {
            	                    "name": "底层公务员收入超过副部长", 
            	                    "weight": 123, 
            	                    "evolution": [
            	                        {
            	                            "time": "2014-05-11", 
            	                            "value": 4, 
            	                            "detail": {
            	                                "link": "www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-12", 
            	                            "value": 24, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-13", 
            	                            "value": 40, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-14", 
            	                            "value": 20, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-15", 
            	                            "value": 15, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
            	                        }, 
            	                        {
            	                            "time": "2014-05-16", 
            	                            "value": 10, 
            	                            "detail": {
            	                                "link": "http://www.baidu.com", 
            	                                "text": "百度指数", 
            	                                "img": '../asset/ico/favicon.png'
            	                            }
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
