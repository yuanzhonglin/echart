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
            	        text: '漏斗图(对比)',
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
            	            magicType : {
            	                show: true, 
            	                type: ['pie', 'funnel'],
            	                option: {
            	                    pie: {
            	                        radius : [0, 50]
            	                    }
            	                }
            	            },
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    legend: {
            	        orient: 'vertical',
            	        x: 'left',
            	        data : ['产品A','产品B','产品C','产品D','产品E']
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
            	            funnelAlign: 'right',
            	            
            	            center: ['25%', '25%'],  // for pie
            	            
            	            data:[
            	                {value:60, name:'产品C'},
            	                {value:30, name:'产品D'},
            	                {value:10, name:'产品E'},
            	                {value:80, name:'产品B'},
            	                {value:100, name:'产品A'}
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
            	            funnelAlign: 'right',
            	            
            	            center: ['25%', '75%'],  // for pie
            	            
            	            data:[
            	                {value:60, name:'产品C'},
            	                {value:30, name:'产品D'},
            	                {value:10, name:'产品E'},
            	                {value:80, name:'产品B'},
            	                {value:100, name:'产品A'}
            	            ]
            	        },
            	        {
            	            name:'漏斗图',
            	            type:'funnel',
            	            width: '40%',
            	            height: '45%',
            	            x:'55%',
            	            y: '5%',
            	            funnelAlign: 'left',
            	            
            	            center: ['75%', '25%'],  // for pie
            	            
            	            data:[
            	                {value:60, name:'产品C'},
            	                {value:30, name:'产品D'},
            	                {value:10, name:'产品E'},
            	                {value:80, name:'产品B'},
            	                {value:100, name:'产品A'}
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
            	            funnelAlign: 'left',
            	            
            	            center: ['75%', '75%'],  // for pie
            	            
            	            data:[
            	                {value:60, name:'产品C'},
            	                {value:30, name:'产品D'},
            	                {value:10, name:'产品E'},
            	                {value:80, name:'产品B'},
            	                {value:100, name:'产品A'}
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
