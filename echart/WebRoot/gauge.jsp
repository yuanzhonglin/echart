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
            	    tooltip : {
            	        formatter: "{a} <br/>{b} : {c}%"
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    series : [
            	        {
            	            name:'个性化仪表盘',
            	            type:'gauge',
            	            center : ['50%', '50%'],    // 默认全局居中
            	            radius : [0, '75%'],
            	            startAngle: 140,
            	            endAngle : -140,
            	            min: 0,                     // 最小值
            	            max: 100,                   // 最大值
            	            precision: 0,               // 小数精度，默认为0，无小数点
            	            splitNumber: 10,             // 分割段数，默认为5
            	            axisLine: {            // 坐标轴线
            	                show: true,        // 默认显示，属性show控制显示与否
            	                lineStyle: {       // 属性lineStyle控制线条样式
            	                    color: [[0.2, 'lightgreen'],[0.4, 'orange'],[0.8, 'skyblue'],[1, '#ff4500']], 
            	                    width: 30
            	                }
            	            },
            	            axisTick: {            // 坐标轴小标记
            	                show: true,        // 属性show控制显示与否，默认不显示
            	                splitNumber: 5,    // 每份split细分多少段
            	                length :8,         // 属性length控制线长
            	                lineStyle: {       // 属性lineStyle控制线条样式
            	                    color: '#eee',
            	                    width: 1,
            	                    type: 'solid'
            	                }
            	            },
            	            axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
            	                show: true,
            	                formatter: function(v){
            	                    switch (v+''){
            	                        case '10': return '弱';
            	                        case '30': return '低';
            	                        case '60': return '中';
            	                        case '90': return '高';
            	                        default: return '';
            	                    }
            	                },
            	                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
            	                    color: '#333'
            	                }
            	            },
            	            splitLine: {           // 分隔线
            	                show: true,        // 默认显示，属性show控制显示与否
            	                length :30,         // 属性length控制线长
            	                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
            	                    color: '#eee',
            	                    width: 2,
            	                    type: 'solid'
            	                }
            	            },
            	            pointer : {
            	                length : '80%',
            	                width : 8,
            	                color : 'auto'
            	            },
            	            title : {
            	                show : true,
            	                offsetCenter: ['-65%', -10],       // x, y，单位px
            	                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
            	                    color: '#333',
            	                    fontSize : 15
            	                }
            	            },
            	            detail : {
            	                show : true,
            	                backgroundColor: 'rgba(0,0,0,0)',
            	                borderWidth: 0,
            	                borderColor: '#ccc',
            	                width: 100,
            	                height: 40,
            	                offsetCenter: ['-60%', 10],       // x, y，单位px
            	                formatter:'{value}%',
            	                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
            	                    color: 'auto',
            	                    fontSize : 30
            	                }
            	            },
            	            data:[{value: 50, name: '仪表盘'}]
            	        }
            	    ]
            	};

            	clearInterval(timeTicket);
            	timeTicket = setInterval(function (){
            	    option.series[0].data[0].value = (Math.random()*100).toFixed(2) - 0;
            	    myChart.setOption(option, true);
            	},2000);
            
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
