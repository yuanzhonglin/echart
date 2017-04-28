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
	<script type="text/javascript" src="js/echarts/echarts.js" charset="UTF-8"></script> 
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
            	        show: true,
            	        trigger: 'item'
            	    },
            	    legend: {
            	        data:['邮件营销','联盟广告','直接访问','搜索引擎']
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    calculable : true,
            	    xAxis : [
            	        {
            	            type : 'category',
            	            data : ['周一','周二','周三','周四','周五','周六','周日']
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'value'
            	        }
            	    ],
            	    series : [
            	        {
            	            name:'邮件营销',
            	            type:'bar',
            	            itemStyle: {        // 系列级个性化样式，纵向渐变填充
            	                normal: {
            	                    barBorderColor:'red',
            	                    barBorderWidth: 5,
            	                    color : (function (){
            	                        var zrColor = require('zrender/tool/color');
            	                        return zrColor.getLinearGradient(
            	                            0, 400, 0, 300,
            	                            [[0, 'green'],[1, 'yellow']]
            	                        )
            	                    })()
            	                },
            	                emphasis: {
            	                    barBorderWidth: 5,
            	                    barBorderColor:'green',
            	                    color: (function (){
            	                        var zrColor = require('zrender/tool/color');
            	                        return zrColor.getLinearGradient(
            	                            0, 400, 0, 300,
            	                            [[0, 'red'],[1, 'orange']]
            	                        )
            	                    })(),
            	                    label : {
            	                        show : true,
            	                        position : 'top',
            	                        formatter : "{a} {b} {c}",
            	                        textStyle : {
            	                            color: 'blue'
            	                        }
            	                    }
            	                }
            	            },
            	            data:[220, 232, 101, 234, 190, 330, 210]
            	        },
            	        {
            	            name:'联盟广告',
            	            type:'bar',
            	            stack: '总量',
            	            data:[120, '-', 451, 134, 190, 230, 110]
            	        },
            	        {
            	            name:'直接访问',
            	            type:'bar',
            	            stack: '总量',
            	            itemStyle: {                // 系列级个性化
            	                normal: {
            	                    barBorderWidth: 6,
            	                    barBorderColor:'tomato',
            	                    color: 'red'
            	                },
            	                emphasis: {
            	                    barBorderColor:'red',
            	                    color: 'blue'
            	                }
            	            },
            	            data:[
            	                320, 332, 100, 334,
            	                {
            	                    value: 390,
            	                    symbolSize : 10,   // 数据级个性化
            	                    itemStyle: {
            	                        normal: {
            	                            color :'lime'
            	                        },
            	                        emphasis: {
            	                            color: 'skyBlue'
            	                        }
            	                    }
            	                },
            	                330, 320
            	            ]
            	        },
            	        {
            	            name:'搜索引擎',
            	            type:'bar',
            	            barWidth: 40,                   // 系列级个性化，柱形宽度
            	            itemStyle: {
            	                normal: {                   // 系列级个性化，横向渐变填充
            	                    borderRadius: 5,
            	                    color : (function (){
            	                        var zrColor = require('zrender/tool/color');
            	                        return zrColor.getLinearGradient(
            	                            0, 0, 1000, 0,
            	                            [[0, 'rgba(30,144,255,0.8)'],[1, 'rgba(138,43,226,0.8)']]
            	                        )
            	                    })(),
            	                    label : {
            	                        show : true,
            	                        textStyle : {
            	                            fontSize : '20',
            	                            fontFamily : '微软雅黑',
            	                            fontWeight : 'bold'
            	                        }
            	                    }
            	                }
            	            },
            	            data:[
            	                620, 732, 
            	                {
            	                    value: 701,
            	                    itemStyle : { normal: {label : {position: 'inside'}}}
            	                },
            	                734, 890, 930, 820
            	            ],
            	            markLine : {
            	                data : [
            	                    {type : 'average', name : '平均值'},
            	                    {type : 'max'},
            	                    {type : 'min'}
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
