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
            	                'text':'2002全国宏观经济关联分析（GDP vs 房地产）',
            	                'subtext':'数据来自国家统计局'
            	            },
            	            tooltip : {
            	                trigger: 'axis',
            	                showDelay : 0,
            	                axisPointer:{
            	                    show: true,
            	                    type : 'cross',
            	                    lineStyle: {
            	                        type : 'dashed',
            	                        width : 1
            	                    }
            	                }
            	            },
            	            toolbox : {
            	                'show':true, 
            	                orient : 'vertical',
            	                x: 'right', 
            	                y: 'center',
            	                'feature':{
            	                    'mark':{'show':true},
            	                    'dataView':{'show':true,'readOnly':false},
            	                    'restore':{'show':true},
            	                    'saveAsImage':{'show':true}
            	                }
            	            },
            	            grid : {'y':80,'y2':100},
            	            xAxis : [{
            	                'type':'value',
            	                'name':'房地产（亿元）',
            	                'max':3400
            	            }],
            	            yAxis : [{
            	                'type':'value',
            	                'name':'GDP（亿元）',
            	                'max':53500
            	            }],
            	            series : [
            	                {
            	                    'name':'GDP',
            	                    'type':'scatter',
            	                    markLine : {
            	                        data : [
            	                            {type : 'average', name: 'y平均值', itemStyle:{normal:{borderColor:'red'}}},
            	                            {type : 'average', name: 'x平均值', valueIndex : 0, itemStyle:{normal:{borderColor:'red'}}}
            	                        ]
            	                    },
            	                    symbolSize : 5,
            	                    itemStyle: {
            	                        normal : {
            	                            label : {
            	                                show: true,
            	                                formatter : '{b}'
            	                            }
            	                        }
            	                    },
            	                    'data': dataMap.dataGDP_Estate['2002']
            	                }
            	            ]
            	        },
            	        {
            	            title : {'text':'2003全国宏观经济关联分析（GDP vs 房地产）'},
            	            series : [
            	                {'data': dataMap.dataGDP_Estate['2003']}
            	            ]
            	        },
            	        {
            	            title : {'text':'2004全国宏观经济关联分析（GDP vs 房地产）'},
            	            series : [
            	                {'data': dataMap.dataGDP_Estate['2004']}
            	            ]
            	        },
            	        {
            	            title : {'text':'2005全国宏观经济关联分析（GDP vs 房地产）'},
            	            series : [
            	                {'data': dataMap.dataGDP_Estate['2005']}
            	            ]
            	        },
            	        {
            	            title : {'text':'2006全国宏观经济关联分析（GDP vs 房地产）'},
            	            series : [
            	                {'data': dataMap.dataGDP_Estate['2006']}
            	            ]
            	        },
            	        {
            	            title : {'text':'2007全国宏观经济关联分析（GDP vs 房地产）'},
            	            series : [
            	                {'data': dataMap.dataGDP_Estate['2007']}
            	            ]
            	        },
            	        {
            	            title : {'text':'2008全国宏观经济关联分析（GDP vs 房地产）'},
            	            series : [
            	                {'data': dataMap.dataGDP_Estate['2008']}
            	            ]
            	        },
            	        {
            	            title : {'text':'2009全国宏观经济关联分析（GDP vs 房地产）'},
            	            series : [
            	                {'data': dataMap.dataGDP_Estate['2009']}
            	            ]
            	        },
            	        {
            	            title : {'text':'2010全国宏观经济关联分析（GDP vs 房地产）'},
            	            series : [
            	                {'data': dataMap.dataGDP_Estate['2010']}
            	            ]
            	        },
            	        {
            	            title : {'text':'2011全国宏观经济关联分析（GDP vs 房地产）'},
            	            series : [
            	                {'data': dataMap.dataGDP_Estate['2011']}
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
