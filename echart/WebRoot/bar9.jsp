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
              
            var placeHoledStyle = {
            	    normal:{
            	        barBorderColor:'rgba(0,0,0,0)',
            	        color:'rgba(0,0,0,0)'
            	    },
            	    emphasis:{
            	        barBorderColor:'rgba(0,0,0,0)',
            	        color:'rgba(0,0,0,0)'
            	    }
            	};
            	var dataStyle = { 
            	    normal: {
            	        label : {
            	            show: true,
            	            position: 'insideLeft',
            	            formatter: '{c}%'
            	        }
            	    }
            	};
            	option = {
            	    title: {
            	        text: '多维条形图',
            	        subtext: 'From ExcelHome',
            	        sublink: 'http://e.weibo.com/1341556070/AiEscco0H'
            	    },
            	    tooltip : {
            	        trigger: 'axis',
            	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            	        },
            	        formatter : '{b}<br/>{a0}:{c0}%<br/>{a2}:{c2}%<br/>{a4}:{c4}%<br/>{a6}:{c6}%'
            	    },
            	    legend: {
            	        y: 55,
            	        itemGap : document.getElementById('main').offsetWidth / 8,
            	        data:['GML', 'PYP','WTC', 'ZTW']
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
            	    grid: {
            	        y: 80,
            	        y2: 30
            	    },
            	    xAxis : [
            	        {
            	            type : 'value',
            	            position: 'top',
            	            splitLine: {show: false},
            	            axisLabel: {show: false}
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'category',
            	            splitLine: {show: false},
            	            data : ['重庆', '天津', '上海', '北京']
            	        }
            	    ],
            	    series : [
            	        {
            	            name:'GML',
            	            type:'bar',
            	            stack: '总量',
            	            itemStyle : dataStyle,
            	            data:[38, 50, 33, 72]
            	        },
            	        {
            	            name:'GML',
            	            type:'bar',
            	            stack: '总量',
            	            itemStyle: placeHoledStyle,
            	            data:[62, 50, 67, 28]
            	        },
            	        {
            	            name:'PYP',
            	            type:'bar',
            	            stack: '总量',
            	            itemStyle : dataStyle,
            	            data:[61, 41, 42, 30]
            	        },
            	        {
            	            name:'PYP',
            	            type:'bar',
            	            stack: '总量',
            	            itemStyle: placeHoledStyle,
            	            data:[39, 59, 58, 70]
            	        },
            	        {
            	            name:'WTC',
            	            type:'bar',
            	            stack: '总量',
            	            itemStyle : dataStyle,
            	            data:[37, 35, 44, 60]
            	        },
            	        {
            	            name:'WTC',
            	            type:'bar',
            	            stack: '总量',
            	            itemStyle: placeHoledStyle,
            	            data:[63, 65, 56, 40]
            	        },
            	        {
            	            name:'ZTW',
            	            type:'bar',
            	            stack: '总量',
            	            itemStyle : dataStyle,
            	            data:[71, 50, 31, 39]
            	        },
            	        {
            	            name:'ZTW',
            	            type:'bar',
            	            stack: '总量',
            	            itemStyle: placeHoledStyle,
            	            data:[29, 50, 69, 61]
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
