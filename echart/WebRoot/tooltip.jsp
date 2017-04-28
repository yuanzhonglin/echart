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
            	    tooltip : {         // Option config. Can be overwrited by series or data
            	        trigger: 'axis',
            	        //show: true,   //default true
            	        showDelay: 0,
            	        hideDelay: 50,
            	        transitionDuration:0,
            	        backgroundColor : 'rgba(255,0,255,0.7)',
            	        borderColor : '#f50',
            	        borderRadius : 8,
            	        borderWidth: 2,
            	        padding: 10,    // [5, 10, 15, 20]
            	        position : function(p) {
            	            // 位置回调
            	            // console.log && console.log(p);
            	            return [p[0] + 10, p[1] - 10];
            	        },
            	        textStyle : {
            	            color: 'yellow',
            	            decoration: 'none',
            	            fontFamily: 'Verdana, sans-serif',
            	            fontSize: 15,
            	            fontStyle: 'italic',
            	            fontWeight: 'bold'
            	        },
            	        formatter: function (params,ticket,callback) {
            	            console.log(params)
            	            var res = 'Function formatter : <br/>' + params[0].name;
            	            for (var i = 0, l = params.length; i < l; i++) {
            	                res += '<br/>' + params[i].seriesName + ' : ' + params[i].value;
            	            }
            	            setTimeout(function (){
            	                // 仅为了模拟异步回调
            	                callback(ticket, res);
            	            }, 1000)
            	            return 'loading';
            	        }
            	        //formatter: "Template formatter: <br/>{b}<br/>{a}:{c}<br/>{a1}:{c1}"
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    calculable : true,
            	    xAxis : {
            	        data : ['周一','周二','周三','周四','周五','周六','周日']
            	    },
            	    yAxis : {
            	        type : 'value'
            	    },
            	    series : [
            	        {
            	            name:'坐标轴触发1',
            	            type:'bar',
            	            data:[
            	                {value:320, extra:'Hello~'},
            	                332, 301, 334, 390, 330, 320
            	            ]
            	        },
            	        {
            	            name:'坐标轴触发2',
            	            type:'bar',
            	            data:[862, 1018, 964, 1026, 1679, 1600, 157]
            	        },
            	        {
            	            name:'数据项触发1',
            	            type:'bar',
            	            tooltip : {             // Series config.
            	                trigger: 'item',
            	                backgroundColor: 'black',
            	                position : [0, 0],
            	                formatter: "Series formatter: <br/>{a}<br/>{b}:{c}"
            	            },
            	            stack: '数据项',
            	            data:[
            	                120, 132,
            	                {
            	                    value: 301,
            	                    itemStyle: {normal: {color: 'red'}},
            	                    tooltip : {     // Data config.
            	                        backgroundColor: 'blue',
            	                        formatter: "Data formatter: <br/>{a}<br/>{b}:{c}"
            	                    }
            	                },
            	                134, 90,
            	                {
            	                    value: 230,
            	                    tooltip: {show: false}
            	                },
            	                210
            	            ]
            	        },
            	        {
            	            name:'数据项触发2',
            	            type:'bar',
            	            tooltip : {
            	                show : false,
            	                trigger: 'item'
            	            },
            	            stack: '数据项',
            	            data:[150, 232, 201, 154, 190, 330, 410]
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
