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
            	        text: '漏斗图',
            	        subtext: '纯属虚构',
            	        x: 'left',
            	        y: 'bottom'
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        formatter: "{a} <br/>{b} : {c}%"
            	    },
            	    toolbox: {
            	        show : true,
            	        orient: 'vertical',
            	        y: 'center',
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    legend: {
            	        orient: 'vertical',
            	        x: 'left',
            	        data : ['展现','点击','访问','咨询','订单']
            	    },
            	    calculable : true,
            	    series : [
            	        {
            	            name:'漏斗图',
            	            type:'funnel',
            	            width: '40%',
            	            height: '45%',
            	            x:'5%',
            	            y:'50%',
            	            data:[
            	                {value:60, name:'访问'},
            	                {value:30, name:'咨询'},
            	                {value:10, name:'订单'},
            	                {value:80, name:'点击'},
            	                {value:100, name:'展现'}
            	            ]
            	        },
            	        {
            	            name:'金字塔',
            	            type:'funnel',
            	            width: '40%',
            	            height: '45%',
            	            x: '5%',
            	            y: '5%',
            	            sort : 'ascending',
            	            data:[
            	                {value:60, name:'访问'},
            	                {value:30, name:'咨询'},
            	                {value:10, name:'订单'},
            	                {value:80, name:'点击'},
            	                {value:100, name:'展现'}
            	            ]
            	        },
            	        {
            	            name:'漏斗图',
            	            type:'funnel',
            	            width: '40%',
            	            height: '45%',
            	            x:'55%',
            	            y: '5%',
            	            itemStyle: {
            	                normal: {
            	                    // color: 各异,
            	                    label: {
            	                        position: 'left'
            	                    }
            	                }
            	            },
            	            data:[
            	                {value:60, name:'访问'},
            	                {value:30, name:'咨询'},
            	                {value:10, name:'订单'},
            	                {value:80, name:'点击'},
            	                {value:100, name:'展现'}
            	            ]
            	        },
            	        {
            	            name:'金字塔',
            	            type:'funnel',
            	            width: '40%',
            	            height: '45%',
            	            x:'55%',
            	            y:'50%',
            	            sort : 'ascending',
            	            itemStyle: {
            	                normal: {
            	                    // color: 各异,
            	                    label: {
            	                        position: 'left'
            	                    }
            	                }
            	            },
            	            data:[
            	                {value:60, name:'访问'},
            	                {value:30, name:'咨询'},
            	                {value:10, name:'订单'},
            	                {value:80, name:'点击'},
            	                {value:100, name:'展现'}
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
