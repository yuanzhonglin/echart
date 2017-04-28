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
              
         // 自定义扩展图表类型：mapType = continent 大洲地图
            require('echarts/util/mapData/params').params.continent = {
                getGeoJson: function (callback) {
                    $.getJSON('geoJson/continent_geo.json',callback);
                }
            }
            option = {
                title : {
                    text : '金棕榈 智慧旅行@云数据',
                    subtext: 'by 江江的喵',
                    link: 'http://www.palmyou.com/',
                    sublink: 'http://weibo.com/u/2813464944'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: function (params){
                        var value = params.value + '万人次 （' + (params.value/98.19).toFixed(2) + '%）';
                        return params.seriesName + '<br/>' + params.name + ' : ' + value;
                    }
                },
                toolbox: {
                    show : true,
                    orient : 'vertical',
                    x: 'right',
                    y: 'center',
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                dataRange: {
                    min: 0,
                    max: 1000,
                    text:['热', '冷'],
                    splitNumber:0,
                    color: ['orangered','yellow','lightskyblue']
                },
                series : [
                    {
                        name: '2013年出境目的地（洲际统计）',
                        type: 'map',
                        mapType: 'continent', // 自定义扩展图表类型
                        itemStyle:{
                            normal:{label:{show:true}},
                            emphasis:{label:{show:true}}
                        },
                        data:[
                            {name: '亚洲', value: 8967.69},
                            {name: '大洋洲', value: 592.09},
                            {name: '欧洲', value: 183.62},
                            {name: '北美洲', value: 41.63},
                            {name: '南美洲', value: 10.41},
                            {name: '非洲', value: 22.5837}
                        ],
                        // 文本位置修正
                        textFixed : {
                            '大洋洲' : [265, 0],
                            '非洲' : [10, -30],
                            '北美洲' : [20, 0],
                            '南美洲' : [0, -10],
                            '亚洲' : [20, -30],
                            '欧洲' : [200, -10],
                        }
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
