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
            	    title :{
            	        text : '销售数据',
            	        subtext : '纯属虚构'
            	    },
            	    tooltip : {
            	        trigger: 'axis',
            	        formatter: function (params){
            	            return params[0].name + ' : '
            	                   + (params[2].value - params[1].value > 0 ? '+' : '-') 
            	                   + params[0].value + '<br/>'
            	                   + params[2].seriesName + ' : ' + params[2].value + '<br/>'
            	                   + params[3].seriesName + ' : ' + params[3].value + '<br/>'
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
            	    legend: {
            	        data:['本周', '上周'],
            	        selectedMode:false
            	    },
            	    xAxis : [
            	        {
            	            type : 'category',
            	            data : ['周一','周二','周三','周四','周五','周六','周日']
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'value',
            	            min : 200,
            	            max : 450
            	        }
            	    ],
            	    series : [
            	        {
            	            name:'本周',
            	            type:'line',
            	            data:[400, 374, 251, 300, 420, 400, 440]
            	        },
            	        {
            	            name:'上周',
            	            type:'line',
            	            symbol:'none',
            	            itemStyle:{
            	                normal:{
            	                  lineStyle: {
            	                    width:1,
            	                    type:'dashed'
            	                  }
            	                }
            	            },
            	            data:[320, 332, 301, 334, 360, 330, 350]
            	        },
            	        {
            	            name:'上周2',
            	            type:'bar',
            	            stack: '1',
            	            barWidth: 6,
            	            itemStyle:{
            	                normal:{
            	                    color:'rgba(0,0,0,0)'
            	                },
            	                emphasis:{
            	                    color:'rgba(0,0,0,0)'
            	                }
            	            },
            	            data:[320, 332, 251, 300, 360, 330, 350]
            	        },
            	        {
            	            name:'变化',
            	            type:'bar',
            	            stack: '1',
            	            data:[
            	              80, 42, 
            	              {value : 50, itemStyle:{ normal:{color:'red'}}},
            	              {value : 34, itemStyle:{ normal:{color:'red'}}}, 
            	              60, 70, 90
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
