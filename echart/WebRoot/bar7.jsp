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
            	    title: {
            	        text: '深圳月最低生活费组成（单位:元）',
            	        subtext: 'From ExcelHome',
            	        sublink: 'http://e.weibo.com/1341556070/AjQH99che'
            	    },
            	    tooltip : {
            	        trigger: 'axis',
            	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            	        },
            	        formatter: function (params) {
            	            var tar = params[0];
            	            return tar.name + '<br/>' + tar.seriesName + ' : ' + tar.value;
            	        }
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
            	    xAxis : [
            	        {
            	            type : 'category',
            	            splitLine: {show:false},
            	            data : ['总费用','房租','水电费','交通费','伙食费','日用品数']
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'value'
            	        }
            	    ],
            	    series : [
            	        {
            	            name:'辅助',
            	            type:'bar',
            	            stack: '总量',
            	            itemStyle:{
            	                normal:{
            	                    barBorderColor:'rgba(0,0,0,0)',
            	                    color:'rgba(0,0,0,0)'
            	                },
            	                emphasis:{
            	                    barBorderColor:'rgba(0,0,0,0)',
            	                    color:'rgba(0,0,0,0)'
            	                }
            	            },
            	            data:[0, 1700, 1400, 1200, 300, 0]
            	        },
            	        {
            	            name:'生活费',
            	            type:'bar',
            	            stack: '总量',
            	            itemStyle : { normal: {label : {show: true, position: 'inside'}}},
            	            data:[2900, 1200, 300, 200, 900, 300]
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
