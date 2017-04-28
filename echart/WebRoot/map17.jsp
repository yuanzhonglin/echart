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
              
         // 自定义扩展图表类型：mapType = body
            require('echarts/util/mapData/params').params.football = {
                getGeoJson: function (callback) {
                    $.ajax({
                        url: "svg/football.svg",
                        dataType: 'xml',
                        success: function(xml) {
                            callback(xml)
                        }
                    });
                }
            }
            option = {
                backgroundColor:'#228b22',
                title : {
                    text : '2014世界杯',
                    subtext: '地图SVG扩展',
                    textStyle: {
                        color: '#fff'
                    }
                },
                tooltip : {
                    trigger: 'item'
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                series : [
                    {
                        name: '2014世界杯',
                        type: 'map',
                        mapType: 'football', // 自定义扩展图表类型
                        roam:true,
                        itemStyle:{
                            normal:{label:{show:true}},
                            emphasis:{label:{show:true}}
                        },
                        data:[
                            {name: '草地', hoverable: false, itemStyle:{normal:{label:{show:false}}}}
                        ],
                        textFixed : {
                            '球门区1' : [0, -20],
                            '球门区2' : [0, -20],
                            '禁区1' : [10, 20],
                            '禁区2' : [-10, 20],
                            '禁区弧线1' : [0, -20],
                            '禁区弧线2' : [0, -20],
                            '中圈' : [0, -20],
                            '开球点' : [0, 20]
                        },
                        markPoint : {
                            symbol:'circle',
                            symbolSize : 20,
                            effect : {
                                show: true,
                                color: 'lime'
                            },
                            data : [
                                {name: '开球点', value: 100, geoCoord:[425.126, 296.913]}
                            ]
                        },
                        markLine : {
                            smooth:true,
                            effect : {
                                show: true,
                                scaleSize: 1,
                                period: 20,
                                color: '#fff',
                                shadowBlur: 5
                            },
                            itemStyle : {
                                normal: {
                                    borderWidth:1,
                                    color: 'gold',
                                    lineStyle: {
                                        type: 'solid'
                                    }
                                }
                            },
                            data : [
                                [
                                    {name:'1', geoCoord:[96.879, 186.983]}, 
                                    {name:'2', geoCoord:[693.786, 297.939]}
                                ],
                                [
                                    {name:'2', geoCoord:[753.373, 186.983]},
                                    {name:'1', geoCoord:[156.467, 296.913]}
                                ]
                            ]
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
