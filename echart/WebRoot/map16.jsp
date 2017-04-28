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
            require('echarts/util/mapData/params').params.bodyMale = {
                getGeoJson: function (callback) {
                    $.ajax({
                        url: "svg/body-male.svg",
                        dataType: 'xml',
                        success: function(xml) {
                            callback(xml)
                        }
                    });
                }
            }
            require('echarts/util/mapData/params').params.bodyFemale = {
                getGeoJson: function (callback) {
                    $.ajax({
                        url: "svg/body-female.svg",
                        dataType: 'xml',
                        success: function(xml) {
                            callback(xml)
                        }
                    });
                }
            }
            option = {
                title : {
                    text : '人体密码',
                    subtext: '地图SVG扩展',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item'
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
                    max: 100,
                    x: 'center',
                    y: 'center',
                    tdext:['High','Low'],
                    calculable : true,
                    itemHeight:30,
                    color: ['orangered','yellow','lightskyblue']
                },
                series : [
                    {
                        name: '人体密码-男',
                        type: 'map',
                        mapType: 'bodyMale', // 自定义扩展图表类型
                        mapLocation: {
                            x:'left'
                        },
                        roam:true,
                        itemStyle:{
                            normal:{label:{show:true}},
                            emphasis:{label:{show:true}}
                        },
                        data:[
                            {name: '头部', value: 90},
                            {name: '颈部', value: 80},
                            {name: '胸部', value: 60},
                            {name: '腹部', value: 60},
                            {name: '生殖', value: 50},
                            {name: '上肢', value: 40},
                            {name: '下肢', value: 30}
                        ],
                        textFixed : {
                            '上肢' : [-60, 0]
                        },
                        markPoint : {
                            symbol:'emptyCircle',
                            symbolSize : 10,
                            effect : {
                                show: true
                            },
                            data : [
                                {name: '心脏', value: 100, geoCoord:[138, 126]}
                            ]
                        },
                        markLine : {
                            smooth:true,
                            effect : {
                                show: true,
                                scaleSize: 1,
                                period: 30,
                                color: '#fff',
                                shadowBlur: 5
                            },
                            itemStyle : {
                                normal: {
                                    borderWidth:1,
                                    lineStyle: {
                                        type: 'solid'
                                    }
                                }
                            },
                            data : [
                                [
                                    {name:'男',geoCoord:[138, 126]}, 
                                    {name:'女',value:90,geoCoord:[268, 56]}
                                ]
                            ]
                        }
                    },
                    {
                        name: '人体密码-女',
                        type: 'map',
                        mapType: 'bodyFemale', // 自定义扩展图表类型
                        mapLocation: {
                            x:'right'
                        },
                        roam:true,
                        itemStyle:{
                            normal:{label:{show:true}},
                            emphasis:{label:{show:true}}
                        },
                        data:[
                            {name: '头部', value: 90},
                            {name: '颈部', value: 80},
                            {name: '胸部', value: 70},
                            {name: '腹部', value: 60},
                            {name: '生殖', value: 50},
                            {name: '上肢', value: 40},
                            {name: '下肢', value: 30}
                        ],
                        markPoint : {
                            symbol:'emptyCircle',
                            symbolSize : 10,
                            effect : {
                                show: true
                            },
                            data : [
                                {name: '心脏', value: 100, geoCoord:[118, 126]}
                            ]
                        },
                        markLine : {
                            smooth:true,
                            effect : {
                                show: true,
                                scaleSize: 1,
                                period: 30,
                                color: '#fff',
                                shadowBlur: 5
                            },
                            itemStyle : {
                                normal: {
                                    borderWidth:1,
                                    lineStyle: {
                                        type: 'solid'
                                    }
                                }
                            },
                            data : [
                                [
                                    {name:'女',geoCoord:[118, 126]}, 
                                    {name:'男',value:90,geoCoord:[-22, 56]}
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
