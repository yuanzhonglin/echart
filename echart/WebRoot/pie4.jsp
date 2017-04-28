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
            	        text: '南丁格尔玫瑰图',
            	        subtext: '纯属虚构',
            	        x:'center'
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        formatter: "{a} <br/>{b} : {c} ({d}%)"
            	    },
            	    legend: {
            	        x : 'center',
            	        y : 'bottom',
            	        data:['rose1','rose2','rose3','rose4','rose5','rose6','rose7','rose8']
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            magicType : {
            	                show: true, 
            	                type: ['pie', 'funnel']
            	            },
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    calculable : true,
            	    series : [
            	        {
            	            name:'半径模式',
            	            type:'pie',
            	            radius : [20, 110],
            	            center : ['25%', 200],
            	            roseType : 'radius',
            	            width: '40%',       // for funnel
            	            max: 40,            // for funnel
            	            itemStyle : {
            	                normal : {
            	                    label : {
            	                        show : false
            	                    },
            	                    labelLine : {
            	                        show : false
            	                    }
            	                },
            	                emphasis : {
            	                    label : {
            	                        show : true
            	                    },
            	                    labelLine : {
            	                        show : true
            	                    }
            	                }
            	            },
            	            data:[
            	                {value:10, name:'rose1'},
            	                {value:5, name:'rose2'},
            	                {value:15, name:'rose3'},
            	                {value:25, name:'rose4'},
            	                {value:20, name:'rose5'},
            	                {value:35, name:'rose6'},
            	                {value:30, name:'rose7'},
            	                {value:40, name:'rose8'}
            	            ]
            	        },
            	        {
            	            name:'面积模式',
            	            type:'pie',
            	            radius : [30, 110],
            	            center : ['75%', 200],
            	            roseType : 'area',
            	            x: '50%',               // for funnel
            	            max: 40,                // for funnel
            	            sort : 'ascending',     // for funnel
            	            data:[
            	                {value:10, name:'rose1'},
            	                {value:5, name:'rose2'},
            	                {value:15, name:'rose3'},
            	                {value:25, name:'rose4'},
            	                {value:20, name:'rose5'},
            	                {value:35, name:'rose6'},
            	                {value:30, name:'rose7'},
            	                {value:40, name:'rose8'}
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
