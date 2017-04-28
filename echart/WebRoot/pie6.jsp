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
              
            var dataStyle = {
            	    normal: {
            	        label: {show:false},
            	        labelLine: {show:false}
            	    }
            	};
            	var placeHolderStyle = {
            	    normal : {
            	        color: 'rgba(0,0,0,0)',
            	        label: {show:false},
            	        labelLine: {show:false}
            	    },
            	    emphasis : {
            	        color: 'rgba(0,0,0,0)'
            	    }
            	};
            	option = {
            	    title: {
            	        text: '你幸福吗？',
            	        subtext: 'From ExcelHome',
            	        sublink: 'http://e.weibo.com/1341556070/AhQXtjbqh',
            	        x: 'center',
            	        y: 'center',
            	        itemGap: 20,
            	        textStyle : {
            	            color : 'rgba(30,144,255,0.8)',
            	            fontFamily : '微软雅黑',
            	            fontSize : 35,
            	            fontWeight : 'bolder'
            	        }
            	    },
            	    tooltip : {
            	        show: true,
            	        formatter: "{a} <br/>{b} : {c} ({d}%)"
            	    },
            	    legend: {
            	        orient : 'vertical',
            	        x : document.getElementById('main').offsetWidth / 2,
            	        y : 45,
            	        itemGap:12,
            	        data:['68%的人表示过的不错','29%的人表示生活压力很大','3%的人表示“我姓曾”']
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
            	    series : [
            	        {
            	            name:'1',
            	            type:'pie',
            	            clockWise:false,
            	            radius : [125, 150],
            	            itemStyle : dataStyle,
            	            data:[
            	                {
            	                    value:68,
            	                    name:'68%的人表示过的不错'
            	                },
            	                {
            	                    value:32,
            	                    name:'invisible',
            	                    itemStyle : placeHolderStyle
            	                }
            	            ]
            	        },
            	        {
            	            name:'2',
            	            type:'pie',
            	            clockWise:false,
            	            radius : [100, 125],
            	            itemStyle : dataStyle,
            	            data:[
            	                {
            	                    value:29, 
            	                    name:'29%的人表示生活压力很大'
            	                },
            	                {
            	                    value:71,
            	                    name:'invisible',
            	                    itemStyle : placeHolderStyle
            	                }
            	            ]
            	        },
            	        {
            	            name:'3',
            	            type:'pie',
            	            clockWise:false,
            	            radius : [75, 100],
            	            itemStyle : dataStyle,
            	            data:[
            	                {
            	                    value:3, 
            	                    name:'3%的人表示“我姓曾”'
            	                },
            	                {
            	                    value:97,
            	                    name:'invisible',
            	                    itemStyle : placeHolderStyle
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
