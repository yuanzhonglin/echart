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
            	        text: '某站点用户访问来源',
            	        subtext: '纯属虚构',
            	        x:'center'
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        formatter: "{a} <br/>{b} : {c} ({d}%)"
            	    },
            	    legend: {
            	        orient : 'vertical',
            	        x : 'left',
            	        data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
            	    },
            	    calculable : true,
            	    series : [
            	        {
            	            name:'访问来源',
            	            type:'pie',
            	            radius : '55%',
            	            center: ['50%', 225],
            	            data:[
            	                {value:335, name:'直接访问'},
            	                {value:310, name:'邮件营销'},
            	                {value:234, name:'联盟广告'},
            	                {value:135, name:'视频广告'},
            	                {value:1548, name:'搜索引擎'}
            	            ]
            	        }
            	    ]
            	};

            	option2 = {
            	    tooltip : {
            	        trigger: 'axis',
            	        axisPointer : {
            	            type: 'shadow'
            	        }
            	    },
            	    legend: {
            	        data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
            	    },
            	    toolbox: {
            	        show : true,
            	        orient : 'vertical',
            	        y : 'center',
            	        feature : {
            	            mark : {show: true},
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
            	            type : 'value',
            	            splitArea : {show : true}
            	        }
            	    ],
            	    grid: {
            	        x2:40
            	    },
            	    series : [
            	        {
            	            name:'直接访问',
            	            type:'bar',
            	            stack: '总量',
            	            data:[320, 332, 301, 334, 390, 330, 320]
            	        },
            	        {
            	            name:'邮件营销',
            	            type:'bar',
            	            stack: '总量',
            	            data:[120, 132, 101, 134, 90, 230, 210]
            	        },
            	        {
            	            name:'联盟广告',
            	            type:'bar',
            	            stack: '总量',
            	            data:[220, 182, 191, 234, 290, 330, 310]
            	        },
            	        {
            	            name:'视频广告',
            	            type:'bar',
            	            stack: '总量',
            	            data:[150, 232, 201, 154, 190, 330, 410]
            	        },
            	        {
            	            name:'搜索引擎',
            	            type:'bar',
            	            stack: '总量',
            	            data:[820, 932, 901, 934, 1290, 1330, 1320]
            	        }
            	    ]
            	};

            	myChart2 = echarts.init(document.getElementById('main2'));
            	myChart2.setOption(option2);

            	myChart.connect(myChart2);
            	myChart2.connect(myChart);

            	setTimeout(function (){
            	    window.onresize = function () {
            	        myChart.resize();
            	        myChart2.resize();
            	    }
            	},200)
            
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
