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
            	    timeline:{
            	        data:[
            	            '2002-01-01','2003-01-01','2004-01-01','2005-01-01','2006-01-01',
            	            '2007-01-01','2008-01-01','2009-01-01','2010-01-01','2011-01-01'
            	        ],
            	        label : {
            	            formatter : function(s) {
            	                return s.slice(0, 4);
            	            }
            	        },
            	        autoPlay : true,
            	        playInterval : 1000
            	    },
            	    options:[
            	        {
            	            title : {
            	                'text':'2002全国宏观经济指标',
            	                'subtext':'数据来自国家统计局'
            	            },
            	            tooltip : {'trigger':'item'},
            	            toolbox : {
            	                'show':true, 
            	                'feature':{
            	                    'mark':{'show':true},
            	                    'dataView':{'show':true,'readOnly':false},
            	                    'restore':{'show':true},
            	                    'saveAsImage':{'show':true}
            	                }
            	            },
            	            dataRange: {
            	                min: 0,
            	                max : 53000,
            	                text:['高','低'],           // 文本，默认为数值文本
            	                calculable : true,
            	                x: 'left',
            	                color: ['orangered','yellow','lightskyblue']
            	            },
            	            series : [
            	                {
            	                    'name':'GDP',
            	                    'type':'map',
            	                    'data': dataMap.dataGDP['2002']
            	                }
            	            ]
            	        },
            	        {
            	            title : {'text':'2003全国宏观经济指标'},
            	            series : [
            	                {'data': dataMap.dataGDP['2003']}
            	            ]
            	        },
            	        {
            	            title : {'text':'2004全国宏观经济指标'},
            	            series : [
            	                {'data': dataMap.dataGDP['2004']}
            	            ]
            	        },
            	        {
            	            title : {'text':'2005全国宏观经济指标'},
            	            series : [
            	                {'data': dataMap.dataGDP['2005']}
            	            ]
            	        },
            	        {
            	            title : {'text':'2006全国宏观经济指标'},
            	            series : [
            	                {'data': dataMap.dataGDP['2006']}
            	            ]
            	        },
            	        {
            	            title : {'text':'2007全国宏观经济指标'},
            	            series : [
            	                {'data': dataMap.dataGDP['2007']}
            	            ]
            	        },
            	        {
            	            title : {'text':'2008全国宏观经济指标'},
            	            series : [
            	                {'data': dataMap.dataGDP['2008']}
            	            ]
            	        },
            	        {
            	            title : {'text':'2009全国宏观经济指标'},
            	            series : [
            	                {'data': dataMap.dataGDP['2009']}
            	            ]
            	        },
            	        {
            	            title : {'text':'2010全国宏观经济指标'},
            	            series : [
            	                {'data': dataMap.dataGDP['2010']}
            	            ]
            	        },
            	        {
            	            title : {'text':'2011全国宏观经济指标'},
            	            series : [
            	                {'data': dataMap.dataGDP['2011']}
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
