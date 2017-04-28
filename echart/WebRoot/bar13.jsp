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
            	        text: '双数值柱形图',
            	        subtext: '纯属虚构'
            	    },
            	    tooltip : {
            	        trigger: 'axis',
            	        axisPointer:{
            	            show: true,
            	            type : 'cross',
            	            lineStyle: {
            	                type : 'dashed',
            	                width : 1
            	            }
            	        },
            	        formatter : function (params) {
            	            return params.seriesName + ' : [ '
            	                   + params.value[0] + ', ' 
            	                   + params.value[1] + ' ]';
            	        }
            	    },
            	    legend: {
            	        data:['数据1','数据2']
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
            	    calculable : true,
            	    xAxis : [
            	        {
            	            type : 'value'
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'value',
            	            axisLine: {
            	                lineStyle: {
            	                    color: '#dc143c'
            	                }
            	            }
            	        }
            	    ],
            	    series : [
            	        {
            	            name:'数据1',
            	            type:'bar',
            	            data:[
            	                [1.5, 10], [5, 7], [8, 8], [12, 6], [11, 12], [16, 9], [14, 6], [17, 4], [19, 9]
            	            ],
            	            markPoint : {
            	                data : [
            	                    // 纵轴，默认
            	                    {type : 'max', name: '最大值',symbol: 'emptyCircle', itemStyle:{normal:{color:'#dc143c',label:{position:'top'}}}},
            	                    {type : 'min', name: '最小值',symbol: 'emptyCircle', itemStyle:{normal:{color:'#dc143c',label:{position:'bottom'}}}},
            	                    // 横轴
            	                    {type : 'max', name: '最大值', valueIndex: 0, symbol: 'emptyCircle', itemStyle:{normal:{color:'#1e90ff',label:{position:'right'}}}},
            	                    {type : 'min', name: '最小值', valueIndex: 0, symbol: 'emptyCircle', itemStyle:{normal:{color:'#1e90ff',label:{position:'left'}}}}
            	                ]
            	            },
            	            markLine : {
            	                data : [
            	                    // 纵轴，默认
            	                    {type : 'max', name: '最大值', itemStyle:{normal:{color:'#dc143c'}}},
            	                    {type : 'min', name: '最小值', itemStyle:{normal:{color:'#dc143c'}}},
            	                    {type : 'average', name : '平均值', itemStyle:{normal:{color:'#dc143c'}}},
            	                    // 横轴
            	                    {type : 'max', name: '最大值', valueIndex: 0, itemStyle:{normal:{color:'#1e90ff'}}},
            	                    {type : 'min', name: '最小值', valueIndex: 0, itemStyle:{normal:{color:'#1e90ff'}}},
            	                    {type : 'average', name : '平均值', valueIndex: 0, itemStyle:{normal:{color:'#1e90ff'}}}
            	                ]
            	            }
            	        },
            	        {
            	            name:'数据2',
            	            type:'bar',
            	            barHeight:10,
            	            data:[
            	                [1, 2], [2, 3], [4, 4], [7, 5], [11, 11], [18, 15]
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
