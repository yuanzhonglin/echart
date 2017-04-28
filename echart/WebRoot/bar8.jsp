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
              
            var labelRight = {normal: {label : {position: 'right'}}};
            option = {
                title: {
                    text: '交错正负轴标签',
                    subtext: 'From ExcelHome',
                    sublink: 'http://e.weibo.com/1341556070/AjwF2AgQm'
                },
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
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
                grid: {
                    y: 80,
                    y2: 30
                },
                xAxis : [
                    {
                        type : 'value',
                        position: 'top',
                        splitLine: {lineStyle:{type:'dashed'}},
                    }
                ],
                yAxis : [
                    {
                        type : 'category',
                        axisLine: {show: false},
                        axisLabel: {show: false},
                        axisTick: {show: false},
                        splitLine: {show: false},
                        data : ['ten', 'nine', 'eight', 'seven', 'six', 'five', 'four', 'three', 'two', 'one']
                    }
                ],
                series : [
                    {
                        name:'生活费',
                        type:'bar',
                        stack: '总量',
                        itemStyle : { normal: {
                            color: 'orange',
                            borderRadius: 5,
                            label : {
                                show: true,
                                position: 'left',
                                formatter: '{b}'
                            }
                        }},
                        data:[
                            {value:-0.07, itemStyle:labelRight},
                            {value:-0.09, itemStyle:labelRight},
                            0.2, 0.44, 
                            {value:-0.23, itemStyle:labelRight},
                            0.08,
                            {value:-0.17, itemStyle:labelRight},
                            0.47,
                            {value:-0.36, itemStyle:labelRight},
                            0.18
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
