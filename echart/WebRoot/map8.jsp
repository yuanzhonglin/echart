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
              
            var itemStyle = {
            	    normal:{label:{
            	        show:true,
            	        formatter:'{b}',
            	        textStyle: {fontSize: 20,fontWeight : 'bold'}
            	    }},
            	    emphasis:{label:{show:true}}
            	};
            	option = {
            	    title : {
            	        text : '2012 World GDP Top 8',
            	        subtext : 'from baike （Billion $）',
            	        sublink : 'http://baike.baidu.com/link?url=MyQikkoGI08hUfVmiB0g01ZJ6Wpyu18s8e6XdA3dwcI73-i0J7Ce32LuPNqfEWBj2rUcSfIHYIVI0aL8czbS_a',
            	        x : 'center'
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        showDelay: 0,
            	        transitionDuration: 0.2,
            	        formatter : function (params) {
            	            var value = params.value + '';
            	            value = value.replace(/(\d{1,3})(?=(?:\d{3})+(?!\d))/g, '$1,');
            	            return params.seriesName + '<br/>' + value + ' Billion';
            	        }
            	    },
            	    toolbox: {
            	        show : true,
            	        x: 'right',
            	        y: 'bottom',
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    dataRange: {
            	        orient: 'horizontal',
            	        x : 'center',
            	        y: 'center',
            	        min: 2000,
            	        max: 16000,
            	        splitNumber: 0,            // 分割段数，默认为5
            	        text:['16,000B','2,000B'],  
            	        calculable : true,
            	        itemWidth:40,
            	        color: ['orangered','yellow','lightskyblue']
            	    },
            	    series : [
            	        {
            	            name: 'USA',
            	            type: 'map',
            	            mapType: 'world|United States of America',
            	            mapLocation: {x:'5%', y:'10%',width:'22%',height:'35%'},
            	            itemStyle: itemStyle,
            	            data:[
            	                {name : 'United States of America', value : 15684.7}
            	            ]
            	        },
            	        {
            	            name: 'China',
            	            type: 'map',
            	            mapType: 'world|China',
            	            mapLocation: {x:'30%', y:'10%',width:'22%',height:'35%'},
            	            itemStyle: itemStyle,
            	            itemStyle: itemStyle,
            	            data:[
            	                {name : 'China', value : 8227}
            	            ]
            	        },
            	        {
            	            name: 'Japan',
            	            type: 'map',
            	            mapType: 'world|Japan',
            	            mapLocation: {x:'55%', y:'10%',width:'22%',height:'35%'},
            	            itemStyle: itemStyle,
            	            data:[
            	                {name : 'Japan', value : 5963.9}
            	            ]
            	        },
            	        {
            	            name: 'Germany',
            	            type: 'map',
            	            mapType: 'world|Germany',
            	            mapLocation: {x:'76%', y:'10%',width:'22%',height:'35%'},
            	            itemStyle: itemStyle,
            	            data:[
            	                {name : 'Germany', value : 3400.5}
            	            ]
            	        },
            	        {
            	            name: 'France',
            	            type: 'map',
            	            mapType: 'world|France',
            	            mapLocation: {x:'5%', y:'60%',width:'22%',height:'35%'},
            	            itemStyle: itemStyle,
            	            data:[
            	                {name : 'France', value : 2608.6}
            	            ]
            	        },
            	        {
            	            name: 'United Kingdom',
            	            type: 'map',
            	            mapType: 'world|United Kingdom',
            	            mapLocation: {x:'33%', y:'60%',width:'22%',height:'35%'},
            	            itemStyle: itemStyle,
            	            data:[
            	                {name : 'United Kingdom', value : 2440.5}
            	            ]
            	        },
            	        {
            	            name: 'Brazil',
            	            type: 'map',
            	            mapType: 'world|Brazil',
            	            mapLocation: {x:'55%', y:'60%',width:'22%',height:'35%'},
            	            itemStyle: itemStyle,
            	            data:[
            	                {name : 'Brazil', value : 2395.9}
            	            ]
            	        },
            	        {
            	            name: 'Russia',
            	            type: 'map',
            	            mapType: 'world|Russia',
            	            mapLocation: {x:'76%', y:'70%',width:'22%',height:'35%'},
            	            itemStyle: itemStyle,
            	            data:[
            	                {name : 'Russia', value : 2021.9}
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
