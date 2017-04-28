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
              
            dataRangeStyle = [
				//0
				 {
				     min: 0,
				     max: 2000,
				     formatter : function(v, v2){
				         if (v2 < 1000) { return '低于' + v2}
				         else if (v > 1000) { return '高于' + v}
				         else { return '中' }
				     }
				 },
				//1
				 {
				     orient: 'horizontal', // 'vertical'
				     min: 0,
				     max: 2000,
				     formatter : '{value} 到 {value2}'
				 },
				//2
				 {
				     text:['高','低'],           // 文本，默认为数值文本
				     min: 0,
				     max: 2000
				 },
				//3
				 {
				     orient: 'horizontal', // 'vertical'
				     text:['高','低'],           // 文本，默认为数值文本
				     min: 0,
				     max: 2000
				 },
				//4
				 {
				     splitNumber: 0,
				     min: 0,
				     max: 2000
				 },
				//5
				 {
				     orient: 'horizontal', // 'vertical'
				     splitNumber: 0,
				     min: 0,
				     max: 2000
				 },
				//6
				 {
				     splitNumber: 0,
				     text:['高','低'],            // 文本，默认为数值文本
				     min: 0,
				     max: 2000
				 },
				//7
				 {
				     orient: 'horizontal', // 'vertical'
				     splitNumber: 0,
				     text:['高','低'],            // 文本，默认为数值文本
				     min: 0,
				     max: 2000
				 },
				//8
				 {
				     calculable : true,
				     min: 0,
				     max: 2000,
				     formatter : function(v) {
				         if (v > 1500) {return v + ' (高)'}
				         else if (v < 500) {return v + ' (低)'}
				         else {return v + ' (中)'};
				     }
				 },
				//9
				 {
				     orient: 'horizontal',      // 'vertical'
				     calculable : true,
				     min: 0,
				     max: 2000
				 },
				//10
				 {
				     color:['red','yellow'],    //颜色
				     text:['高','低'],            // 文本，默认为数值文本
				     calculable : true,
				     min: 0,
				     max: 2000
				 },
				//11
				 {
				     orient: 'horizontal',      // 'vertical'
				     color:['red','yellow'],    //颜色
				     text:['高','低'],            // 文本，默认为数值文本
				     calculable : true,
				     min: 0,
				     max: 2000
				 },
				//12
				 {
				     orient: 'vertical',      // 'vertical'
				     color: ['red', 'pink'],    //颜色
				     splitList: [
				         {start: 300000},
				         {start: 900, end: 200000},
				         {start: 310, end: 1000},
				         {start: 200, end: 300},
				         {start: 10, end: 200, label: '自定义label: 10 到 200'},
				         {start: 5, end: 5},
				         {end: 10, color: 'black'}
				     ]
				 }
				]
				var cur = curIndex++%dataRangeStyle.length;
				option = {
				 title:{
				     text: '当前样式序号:' + cur,
				     subtext: 'NO.' + cur
				 },
				 dataRange: dataRangeStyle[cur],
				 series : [
				     {
				         name: '',
				         type: 'map',
				         data:[]
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
