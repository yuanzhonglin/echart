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
              
         // 自定义扩展图表类型：mapType = USA
            require('echarts/util/mapData/params').params.USA = {
                getGeoJson: function (callback) {
                    $.getJSON('geoJson/USA_geo.json', callback);
                },
                specialArea : {
                    Alaska : {              // 把阿拉斯加移到美国主大陆左下方
                        left : -127,        // 安放位置起始点为西经113
                        top : 30,           // 北纬31度
                        width : 15,         // 区间大小宽高不大于15度
                        height : 15
                    },
                    Hawaii : {
                        left : -110,        // 夏威夷
                        top : 28,
                        width : 5,
                        height : 5
                    },
                    'Puerto Rico' : {       // 波多黎各
                        left : -76,
                        top : 26,
                        width : 2,
                        height : 2
                    }
                }
            }
            option = {
                title : {
                    text: 'USA Population Estimates (2012)',
                    subtext: 'Data from www.census.gov.',
                    sublink: 'http://www.census.gov/popest/data/datasets.html',
                    x:'right'
                },
                tooltip : {
                    trigger: 'item',
                    showDelay: 0,
                    transitionDuration: 0.2,
                    formatter : function (params) {
                        var value = (params.value + '').split('.');
                        value = value[0].replace(/(\d{1,3})(?=(?:\d{3})+(?!\d))/g, '$1,');
                        return params.seriesName + '<br/>' + params.name + ' : ' + value;
                    }
                },
                dataRange: {
                    x : 'right',
                    min: 500000,
                    max: 38000000,
                    color: ['orangered','yellow','lightskyblue'],
                    text:['High','Low'],           // 文本，默认为数值文本
                    calculable : true
                },
                toolbox: {
                    show : true,
                    //orient : 'vertical',
                    x: 'left',
                    y: 'top',
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                series : [
                    {
                        name: 'USA PopEstimates',
                        type: 'map',
                        roam: true,
                        mapType: 'USA', // 自定义扩展图表类型
                        itemStyle:{
                            emphasis:{label:{show:true}}
                        },
                        // 文本位置修正
                        textFixed : {
                            Alaska : [20, -20]
                        },
                        data:[
                            {name : 'Alabama', value : 4822023},
                            {name : 'Alaska', value : 731449},
                            {name : 'Arizona', value : 6553255},
                            {name : 'Arkansas', value : 2949131},
                            {name : 'California', value : 38041430},
                            {name : 'Colorado', value : 5187582},
                            {name : 'Connecticut', value : 3590347},
                            {name : 'Delaware', value : 917092},
                            {name : 'District of Columbia', value : 632323},
                            {name : 'Florida', value : 19317568},
                            {name : 'Georgia', value : 9919945},
                            {name : 'Hawaii', value : 1392313},
                            {name : 'Idaho', value : 1595728},
                            {name : 'Illinois', value : 12875255},
                            {name : 'Indiana', value : 6537334},
                            {name : 'Iowa', value : 3074186},
                            {name : 'Kansas', value : 2885905},
                            {name : 'Kentucky', value : 4380415},
                            {name : 'Louisiana', value : 4601893},
                            {name : 'Maine', value : 1329192},
                            {name : 'Maryland', value : 5884563},
                            {name : 'Massachusetts', value : 6646144},
                            {name : 'Michigan', value : 9883360},
                            {name : 'Minnesota', value : 5379139},
                            {name : 'Mississippi', value : 2984926},
                            {name : 'Missouri', value : 6021988},
                            {name : 'Montana', value : 1005141},
                            {name : 'Nebraska', value : 1855525},
                            {name : 'Nevada', value : 2758931},
                            {name : 'New Hampshire', value : 1320718},
                            {name : 'New Jersey', value : 8864590},
                            {name : 'New Mexico', value : 2085538},
                            {name : 'New York', value : 19570261},
                            {name : 'North Carolina', value : 9752073},
                            {name : 'North Dakota', value : 699628},
                            {name : 'Ohio', value : 11544225},
                            {name : 'Oklahoma', value : 3814820},
                            {name : 'Oregon', value : 3899353},
                            {name : 'Pennsylvania', value : 12763536},
                            {name : 'Rhode Island', value : 1050292},
                            {name : 'South Carolina', value : 4723723},
                            {name : 'South Dakota', value : 833354},
                            {name : 'Tennessee', value : 6456243},
                            {name : 'Texas', value : 26059203},
                            {name : 'Utah', value : 2855287},
                            {name : 'Vermont', value : 626011},
                            {name : 'Virginia', value : 8185867},
                            {name : 'Washington', value : 6897012},
                            {name : 'West Virginia', value : 1855413},
                            {name : 'Wisconsin', value : 5726398},
                            {name : 'Wyoming', value : 576412},
                            {name : 'Puerto Rico', value : 3667084}
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
