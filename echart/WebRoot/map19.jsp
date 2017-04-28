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
                timeline : {
                    type: 'number',
                    data : [1,2,3,4,5,6,7,8,9,10,11,12],
                    label: {
                        formatter: function(v){
                            return '00:'+ (v > 10 ? v : ('0' + v))
                        }
                    },
                    playInterval:500,
                    autoPlay:true
                },
                options : [
                    {
                          backgroundColor:'#228b22',
                title : {
                    text : '2014世界杯',
                    subtext: 'by 硕计小助手',
                    sublink: 'http://weibo.com/u/3798120772',
                    textStyle: {
                        color: '#FFFF00'
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
                        mapLocation:{
                            y: 30,
                            height: 430
                        },
                        itemStyle:{
                            normal:{label:{show:false}},
                            emphasis:{label:{show:false}}
                        },
                        data:[
                            {name: '草地', hoverable: false, itemStyle:{normal:{label:{show:false}}}}
                        ],
                        markPoint : {
                            symbol:'circle',
                            symbolSize : 8,
                            itemStyle : {
                                normal: {
                                    borderWidth:1,
                                    color: 'blue',
                                    lineStyle: {
                                        type: 'solid'
                                    }
                                }
                            },
                            data : [
                             {name: '1伊莱索斯', value: '伊莱索斯', geoCoord:[110, 296.913]},
                             {name: '马丁内斯2', value: '马丁内斯', geoCoord:[200, 200.913]},
                             {name: '阿莫雷比3', value: '阿莫雷比', geoCoord:[200, 400.913]},
                             {name: '伊劳拉4', value: '伊劳拉', geoCoord:[220, 150.913]},
                             {name: '奥尔特内策5', value: '奥尔特内策', geoCoord:[220, 450.913]},
                             {name: '伊图拉斯佩6', value: '伊图拉斯佩', geoCoord:[300, 200.913]},
                             {name: '德玛科斯7', value: '德玛科斯', geoCoord:[300, 400.913]},
                             {name: '苏塞塔8', value: '苏塞塔', geoCoord:[350, 110.913]},
                             {name: '赫雷拉9', value: '赫雷拉', geoCoord:[350, 296.913]},
                             {name: '穆尼亚因10', value: '穆尼亚因', geoCoord:[350, 510.913]},
                             {name: '洛伦特11', value: '洛伦特', geoCoord:[400, 296.913]},
                             //另一只球队
                             {name: '1巴尔德斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '巴尔德斯', geoCoord:[750, 296.913]},
                              {name: '2梅西',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '梅西', geoCoord:[450, 296.913]},
                              {name: '3皮克',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '皮克', geoCoord:[650, 200.913]},
                              {name: '4切拉诺',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '切拉诺', geoCoord:[650, 400.913]},
                              {name: '5阿尔维斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿尔维斯', geoCoord:[630, 150.913]},
                               {name: '6阿比达尔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿比达尔', geoCoord:[630, 450.913]},
                              {name: '7蒂亚戈',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '蒂亚戈', geoCoord:[550, 200.913]},
                              {name: '8布茨克斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '布茨克斯', geoCoord:[580, 296.913]},
                              {name: '9雷加斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '雷加斯', geoCoord:[550, 400.913]},
                              {name: '10伊涅斯塔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '伊涅斯塔', geoCoord:[480, 110.913]},
                              {name: '11比利亚',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '比利亚', geoCoord:[480, 510.913]}
                              
                            ]
                        },

                        markLine : {
                            smooth:true,
                            effect : {
                                show: true,
                                scaleSize: 1.5,
                                period: 1.5,
                                color: '#fff'
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
                                    {name:'伊莱索斯', geoCoord:[110, 296.913]}, 
                                    {name:'马丁内斯', geoCoord:[200, 200.913]}
                                ]
                            ]
                        }
                    }
                ]
               },
               //2
                {
                        series : [
                        {
                       markPoint : {
                            data : [
                              {name: '1伊莱索斯',
                               itemStyle:{normal:{color:'blue',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '伊莱索斯', geoCoord:[110+(Math.random()*3), 296.913]},
                             {name: '马丁内斯2', value: '马丁内斯', geoCoord:[200, 200.913]},
                             {name: '阿莫雷比3', value: '阿莫雷比', geoCoord:[210, 420.913]},
                             {name: '伊劳拉4', value: '伊劳拉', geoCoord:[230, 140.913]},
                             {name: '奥尔特内策5', value: '奥尔特内策', geoCoord:[230, 460.913]},
                             {name: '伊图拉斯佩6', value: '伊图拉斯佩', geoCoord:[320, 210.913]},
                             {name: '德玛科斯7', value: '德玛科斯', geoCoord:[310, 390.913]},
                             {name: '苏塞塔8', value: '苏塞塔', geoCoord:[358.91, 112.913]},
                             {name: '赫雷拉9', value: '赫雷拉', geoCoord:[356, 286.913]},
                             {name: '穆尼亚因10', value: '穆尼亚因', geoCoord:[360, 516.913]},
                             {name: '洛伦特11', value: '洛伦特', geoCoord:[420, 306.913]},
                             //另一只球队
                             {name: '1巴尔德斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '巴尔德斯', geoCoord:[750-(Math.random()*3), 296.913]},
                              {name: '2梅西',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '梅西', geoCoord:[460, 305.913]},
                              {name: '3皮克',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '皮克', geoCoord:[640, 200.913]},
                              {name: '4切拉诺',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '切拉诺', geoCoord:[650, 410.913]},
                              {name: '5阿尔维斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿尔维斯', geoCoord:[630, 150.913]},
                               {name: '6阿比达尔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿比达尔', geoCoord:[630, 450.913]},
                              {name: '7蒂亚戈',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '蒂亚戈', geoCoord:[530, 200.913]},
                              {name: '8布茨克斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '布茨克斯', geoCoord:[570, 296.913]},
                              {name: '9雷加斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '雷加斯', geoCoord:[540, 410.913]},
                              {name: '10伊涅斯塔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '伊涅斯塔', geoCoord:[480, 110.913]},
                              {name: '11比利亚',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '比利亚', geoCoord:[480, 510.913]}
                            
                            ]
                        },
                        markLine : {
                            data : [
                                [
                                    {name:'马丁内斯', geoCoord:[200, 200.913]}, 
                                    {name:'伊图拉斯佩', geoCoord:[320, 210.913]}
                                ]
                            ]
                        }
                      }
                    ]
                },
                // 3
                {
                        series : [
                        {
                      markPoint : {
                             data : [
                             {name: '1伊莱索斯',
                              itemStyle:{normal:{color:'blue',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                              value: '伊莱索斯', geoCoord:[110, 296.913]},
                             {name: '马丁内斯2', value: '马丁内斯', geoCoord:[220, 208.913]},
                             {name: '阿莫雷比3', value: '阿莫雷比', geoCoord:[220.15, 420.913]},
                             {name: '伊劳拉4', value: '伊劳拉', geoCoord:[250, 140.913]},
                             {name: '奥尔特内策5', value: '奥尔特内策', geoCoord:[250, 460.913]},
                             {name: '伊图拉斯佩6', value: '伊图拉斯佩', geoCoord:[320, 210.913]},
                             {name: '德玛科斯7', value: '德玛科斯', geoCoord:[330, 400.913]},
                             {name: '苏塞塔8', value: '苏塞塔', geoCoord:[369.98, 114.913]},
                             {name: '赫雷拉9', value: '赫雷拉', geoCoord:[366, 276.913]},
                             {name: '穆尼亚因10', value: '穆尼亚因', geoCoord:[390, 486.913]},
                             {name: '洛伦特11', value: '洛伦特', geoCoord:[430, 318.913]},
                             //另一只球队
                             {name: '1巴尔德斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '巴尔德斯', geoCoord:[750, 296.913]},
                              {name: '2梅西',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '梅西', geoCoord:[460, 318.913]},
                              {name: '3皮克',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '皮克', geoCoord:[630, 210.913]},
                              {name: '4切拉诺',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '切拉诺', geoCoord:[650, 410.913]},
                              {name: '5阿尔维斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿尔维斯', geoCoord:[612.5, 170.913]},
                               {name: '6阿比达尔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿比达尔', geoCoord:[610, 438.913]},
                              {name: '7蒂亚戈',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '蒂亚戈', geoCoord:[530, 200.913]},
                              {name: '8布茨克斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '布茨克斯', geoCoord:[560, 296.913]},
                              {name: '9雷加斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '雷加斯', geoCoord:[520, 410.913]},
                              {name: '10伊涅斯塔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '伊涅斯塔', geoCoord:[478, 113.913]},
                              {name: '11比利亚',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '比利亚', geoCoord:[460, 487.913]}
                            
                            ]
                        },
                        markLine : {
                            data : [
                                [
                                     {name:'伊图拉斯佩', geoCoord:[320, 210.913]}, 
                                    {name:'赫雷拉', geoCoord:[366, 276.913]}
                                ]
                            ]
                        }
                    }
                        ]
                },
                //4
                {
                        series : [
                       {
                      markPoint : {
                            data : [
                              {name: '1伊莱索斯',
                               itemStyle:{normal:{color:'blue',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '伊莱索斯', geoCoord:[110, 296.913]},
                             {name: '马丁内斯2', value: '马丁内斯', geoCoord:[240, 208.913]},
                             {name: '阿莫雷比3', value: '阿莫雷比', geoCoord:[230.15, 420.913]},
                             {name: '伊劳拉4', value: '伊劳拉', geoCoord:[270, 141.913]},
                             {name: '奥尔特内策5', value: '奥尔特内策', geoCoord:[340.12, 461.913]},
                             {name: '伊图拉斯佩6', value: '伊图拉斯佩', geoCoord:[400, 196.913]},
                             {name: '德玛科斯7', value: '德玛科斯', geoCoord:[360, 400.913]},
                             {name: '苏塞塔8', value: '苏塞塔', geoCoord:[398.98, 113.913]},
                             {name: '赫雷拉9', value: '赫雷拉', geoCoord:[366, 276.913]},
                             {name: '穆尼亚因10', value: '穆尼亚因', geoCoord:[440, 466.913]},
                             {name: '洛伦特11', value: '洛伦特', geoCoord:[480, 331.913]},
                             //另一只球队
                             {name: '1巴尔德斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '巴尔德斯', geoCoord:[750, 296.913]},
                              {name: '2梅西',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '梅西', geoCoord:[510, 331.913]},
                               {name: '3皮克',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '皮克', geoCoord:[630, 210.913]},
                              {name: '4切拉诺',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '切拉诺', geoCoord:[630, 390.913]},
                              {name: '5阿尔维斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿尔维斯', geoCoord:[600.5, 180.713]},
                               {name: '6阿比达尔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿比达尔', geoCoord:[610, 438.913]},
                              {name: '7蒂亚戈',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '蒂亚戈', geoCoord:[531, 208.913]},
                              {name: '8布茨克斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '布茨克斯', geoCoord:[550, 301.913]},
                              {name: '9雷加斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '雷加斯', geoCoord:[520, 401.913]},
                              {name: '10伊涅斯塔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '伊涅斯塔', geoCoord:[478, 113.913]},
                              {name: '11比利亚',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '比利亚', geoCoord:[460, 487.913]}
                            
                            ]
                        },
                        markLine : {
                            data : [
                                [
                                    {name:'赫雷拉', geoCoord:[366, 276.913]}, 
                                    {name:'德玛科斯', geoCoord:[360, 400.913]}
                                ]
                            ]
                        }
                    }
                        ]
                    },
                    // 5
                    {
                        series : [
                        {
                       markPoint : {
                            data : [
                             {name: '1伊莱索斯',
                             itemStyle:{normal:{color:'blue',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                             value: '伊莱索斯', geoCoord:[110, 296.913]},
                             {name: '马丁内斯2', value: '马丁内斯', geoCoord:[243, 211.913]},
                             {name: '阿莫雷比3', value: '阿莫雷比', geoCoord:[240.715, 400.313]},
                             {name: '伊劳拉4', value: '伊劳拉', geoCoord:[288, 142.913]},
                             {name: '奥尔特内策5', value: '奥尔特内策', geoCoord:[360.12, 451.123]},
                             {name: '伊图拉斯佩6', value: '伊图拉斯佩', geoCoord:[408, 199.913]},
                             {name: '德玛科斯7', value: '德玛科斯', geoCoord:[360, 400.913]},
                             {name: '苏塞塔8', value: '苏塞塔', geoCoord:[400.98, 112.913]},
                             {name: '赫雷拉9', value: '赫雷拉', geoCoord:[366, 276.913]},
                             {name: '穆尼亚因10', value: '穆尼亚因', geoCoord:[440, 466.913]},
                             {name: '洛伦特11', value: '洛伦特', geoCoord:[510, 351.983]},
                             //另一只球队
                             {name: '1巴尔德斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '巴尔德斯', geoCoord:[750, 296.913]},
                              {name: '2梅西',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '梅西', geoCoord:[510, 329.913]},
                               {name: '3皮克',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '皮克', geoCoord:[620.124, 237.183]},
                              {name: '4切拉诺',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '切拉诺', geoCoord:[630, 330.913]},
                              {name: '5阿尔维斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿尔维斯', geoCoord:[588.785, 170.913]},
                               {name: '6阿比达尔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿比达尔', geoCoord:[610, 438.913]},
                              {name: '7蒂亚戈',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '蒂亚戈', geoCoord:[521, 228.393]},
                              {name: '8布茨克斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '布茨克斯', geoCoord:[560, 318.913]},
                              {name: '9雷加斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '雷加斯', geoCoord:[520, 401.913]},
                              {name: '10伊涅斯塔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '伊涅斯塔', geoCoord:[478, 123.913]},
                              {name: '11比利亚',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '比利亚', geoCoord:[462, 485.913]}
                            
                            ]
                        },
                        markLine : {
                            data : [
                                [
                                    {name:'德玛科斯', geoCoord:[360, 400.913]}, 
                                    {name:'奥尔特内策', geoCoord:[360.12, 451.123]}
                                ]
                            ]
                        }
                      }
                        ]
                    },
                    // 6 奥尔特内策->穆尼亚因
                    {
                        series : [
                        {
                       markPoint : {
                       data : [
                             {name: '1伊莱索斯',
                             itemStyle:{normal:{color:'blue',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                             value: '伊莱索斯', geoCoord:[110+(Math.random()*3), 296.913]},
                             {name: '马丁内斯2', value: '马丁内斯', geoCoord:[245, 208.913]},
                             {name: '阿莫雷比3', value: '阿莫雷比', geoCoord:[248.715, 396.313]},
                             {name: '伊劳拉4', value: '伊劳拉', geoCoord:[298, 145.913]},
                             {name: '奥尔特内策5', value: '奥尔特内策', geoCoord:[360.12, 451.123]},
                             {name: '伊图拉斯佩6', value: '伊图拉斯佩', geoCoord:[416.4, 210.95]},
                             {name: '德玛科斯7', value: '德玛科斯', geoCoord:[371.69, 391.413]},
                             {name: '苏塞塔8', value: '苏塞塔', geoCoord:[420.198, 113.913]},
                             {name: '赫雷拉9', value: '赫雷拉', geoCoord:[376.01, 296.913]},
                             {name: '穆尼亚因10', value: '穆尼亚因', geoCoord:[456.88, 436.913]},
                             {name: '洛伦特11', value: '洛伦特', geoCoord:[520.48, 361.783]},
                             //另一只球队
                             {name: '1巴尔德斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '巴尔德斯', geoCoord:[750-(Math.random()*3), 296.913]},
                              {name: '2梅西',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '梅西', geoCoord:[480, 331.913]},
                               {name: '3皮克',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '皮克', geoCoord:[612.124, 257.183]},
                              {name: '4切拉诺',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '切拉诺', geoCoord:[624.96, 340.883]},
                              {name: '5阿尔维斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿尔维斯', geoCoord:[578.785, 160.913]},
                               {name: '6阿比达尔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿比达尔', geoCoord:[610, 418.413]},
                              {name: '7蒂亚戈',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '蒂亚戈', geoCoord:[510.69, 228.393]},
                              {name: '8布茨克斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '布茨克斯', geoCoord:[560, 348.913]},
                              {name: '9雷加斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '雷加斯', geoCoord:[516, 427.913]},
                              {name: '10伊涅斯塔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '伊涅斯塔', geoCoord:[468.02, 143.913]},
                              {name: '11比利亚',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '比利亚', geoCoord:[462, 475.913]}
                            
                            ]
                        },
                        markLine : {
                            data : [
                                [
                                    {name:'奥尔特内策', geoCoord:[360.12, 451.123]}, 
                                    {name:'穆尼亚因', geoCoord:[456.88, 436.913]}
                                ]
                            ]
                        }
                      }
                        ]
                    },
                    // 7  穆尼亚因->赫雷拉
                    {
                        series : [{
                       markPoint : {
                           data : [
                             {name: '1伊莱索斯',
                             itemStyle:{normal:{color:'blue',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                             value: '伊莱索斯', geoCoord:[110+(Math.random()*2), 296.913+(Math.random()*3)]},
                             {name: '马丁内斯2', value: '马丁内斯', geoCoord:[255, 238.993]},
                             {name: '阿莫雷比3', value: '阿莫雷比', geoCoord:[258.815, 376.313]},
                             {name: '伊劳拉4', value: '伊劳拉', geoCoord:[308, 145.713]},
                             {name: '奥尔特内策5', value: '奥尔特内策', geoCoord:[368.12, 447.923]},
                             {name: '伊图拉斯佩6', value: '伊图拉斯佩', geoCoord:[436.94, 228.95]},
                             {name: '德玛科斯7', value: '德玛科斯', geoCoord:[391.769, 371.413]},
                             {name: '苏塞塔8', value: '苏塞塔', geoCoord:[430.198, 103.913]},
                             {name: '赫雷拉9', value: '赫雷拉', geoCoord:[406.01, 286.313]},
                             {name: '穆尼亚因10', value: '穆尼亚因', geoCoord:[456.88, 436.913]},
                             {name: '洛伦特11', value: '洛伦特', geoCoord:[520.48, 361.783]},
                             //另一只球队
                             {name: '1巴尔德斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '巴尔德斯', geoCoord:[750+(Math.random()*5), 296.913+(Math.random()*3)]},
                              {name: '2梅西',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '梅西', geoCoord:[450, 321.913]},
                               {name: '3皮克',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '皮克', geoCoord:[605.324, 277.183]},
                              {name: '4切拉诺',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '切拉诺', geoCoord:[620, 348.913]},
                              {name: '5阿尔维斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿尔维斯', geoCoord:[558.785, 168.913]},
                               {name: '6阿比达尔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿比达尔', geoCoord:[589.998, 408.413]},
                              {name: '7蒂亚戈',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '蒂亚戈', geoCoord:[500.169, 208.693]},
                              {name: '8布茨克斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '布茨克斯', geoCoord:[560, 348.913]},
                              {name: '9雷加斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '雷加斯', geoCoord:[486, 418.913]},
                              {name: '10伊涅斯塔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '伊涅斯塔', geoCoord:[461.01, 148.913]},
                              {name: '11比利亚',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '比利亚', geoCoord:[432, 475.813]}
                            
                            ]
                        },
                        markLine : {
                            data : [
                                [
                                    {name:'穆尼亚因', geoCoord:[456.88, 436.913]}, 
                                    {name:'洛伦特', geoCoord:[520.48, 361.783]}
                                ]
                            ]
                        }
                      }
                        ]
                    },
                    // 8 
                    {
                        series : [
                        {
                       markPoint : {
                            data : [
                             {name: '1伊莱索斯',
                             itemStyle:{normal:{color:'blue',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                             value: '伊莱索斯', geoCoord:[110+(Math.random()*2), 296.913+(Math.random()*3)]},
                             {name: '马丁内斯2', value: '马丁内斯', geoCoord:[285, 238.993]},
                             {name: '阿莫雷比3', value: '阿莫雷比', geoCoord:[288.815, 356.313]},
                             {name: '伊劳拉4', value: '伊劳拉', geoCoord:[318, 168.713]},
                             {name: '奥尔特内策5', value: '奥尔特内策', geoCoord:[398.12, 437.923]},
                             {name: '伊图拉斯佩6', value: '伊图拉斯佩', geoCoord:[469.94, 238.95]},
                             {name: '德玛科斯7', value: '德玛科斯', geoCoord:[421.769, 381.413]},
                             {name: '苏塞塔8', value: '苏塞塔', geoCoord:[460.198, 103.913]},
                             {name: '赫雷拉9', value: '赫雷拉', geoCoord:[426.01, 286.313]},
                             {name: '穆尼亚因10', value: '穆尼亚因', geoCoord:[486.88, 456.913]},
                             {name: '洛伦特11', value: '洛伦特', geoCoord:[520.48, 361.783]},
                             //另一只球队
                             {name: '1巴尔德斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '巴尔德斯', geoCoord:[750+(Math.random()*5), 296.913+(Math.random()*3)]},
                              {name: '2梅西',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '梅西', geoCoord:[420, 311.913]},
                               {name: '3皮克',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '皮克', geoCoord:[575.324, 268.183]},
                              {name: '4切拉诺',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '切拉诺', geoCoord:[620, 308.913]},
                              {name: '5阿尔维斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿尔维斯', geoCoord:[548.785, 158.913]},
                               {name: '6阿比达尔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿比达尔', geoCoord:[581.598, 428.413]},
                              {name: '7蒂亚戈',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '蒂亚戈', geoCoord:[470.869, 218.693]},
                              {name: '8布茨克斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '布茨克斯', geoCoord:[560, 328.913]},
                              {name: '9雷加斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '雷加斯', geoCoord:[476, 388.913]},
                              {name: '10伊涅斯塔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '伊涅斯塔', geoCoord:[431.01, 148.913]},
                              {name: '11比利亚',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '比利亚', geoCoord:[402, 471.813]}
                            
                            ]
                        },
                        markLine : {
                            data : [
                                [
                                    {name:'洛伦特', geoCoord:[520.48, 361.783]}, 
                                    {name:'伊图拉斯佩', geoCoord:[466.94, 238.95]}
                                ]
                            ]
                        }
                      }
                        ]
                    },
                    // 9
                    {
                        series : [
                        {
                       markPoint : {
                            data : [
                             {name: '1伊莱索斯',
                             itemStyle:{normal:{color:'blue',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                             value: '伊莱索斯', geoCoord:[110+(Math.random()*2), 296.913+(Math.random()*3)]},
                             {name: '马丁内斯2', value: '马丁内斯', geoCoord:[315, 238.993]},
                             {name: '阿莫雷比3', value: '阿莫雷比', geoCoord:[321.815, 356.313]},
                             {name: '伊劳拉4', value: '伊劳拉', geoCoord:[358, 168.713]},
                             {name: '奥尔特内策5', value: '奥尔特内策', geoCoord:[425.12, 437.923]},
                             {name: '伊图拉斯佩6', value: '伊图拉斯佩', geoCoord:[469.94, 238.95]},
                             {name: '德玛科斯7', value: '德玛科斯', geoCoord:[425.769, 351.413]},
                             {name: '苏塞塔8', value: '苏塞塔', geoCoord:[480.198, 103.913]},
                             {name: '赫雷拉9', value: '赫雷拉', geoCoord:[459.01, 286.313]},
                             {name: '穆尼亚因10', value: '穆尼亚因', geoCoord:[500.88, 446.913]},
                             {name: '洛伦特11', value: '洛伦特', geoCoord:[540.48, 381.783]},
                             //另一只球队
                             {name: '1巴尔德斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '巴尔德斯', geoCoord:[750+(Math.random()*5), 296.913+(Math.random()*3)]},
                              {name: '2梅西',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '梅西', geoCoord:[400.66, 311.913]},
                               {name: '3皮克',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '皮克', geoCoord:[545.324, 269.183]},
                              {name: '4切拉诺',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '切拉诺', geoCoord:[600, 308.913]},
                              {name: '5阿尔维斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿尔维斯', geoCoord:[521.185, 148.913]},
                               {name: '6阿比达尔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿比达尔', geoCoord:[581.598, 388.413]},
                              {name: '7蒂亚戈',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '蒂亚戈', geoCoord:[440.869, 228.693]},
                              {name: '8布茨克斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '布茨克斯', geoCoord:[540, 338.913]},
                              {name: '9雷加斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '雷加斯', geoCoord:[476, 408.913]},
                              {name: '10伊涅斯塔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '伊涅斯塔', geoCoord:[401.01, 128.913]},
                              {name: '11比利亚',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '比利亚', geoCoord:[365, 451.813]}
                            
                            ]
                        },
                        markLine : {
                            data : [
                                [
                                    {name:'伊图拉斯佩', geoCoord:[466.94, 238.95]}, 
                                    {name:'赫雷拉', geoCoord:[459.01, 286.313]}
                                ]
                            ]
                        }
                      }
                        ]
                    },
                    // 10
                    {
                        series : [
                        {
                       markPoint : {
                            data : [
                             {name: '1伊莱索斯',
                             itemStyle:{normal:{color:'blue',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                             value: '伊莱索斯', geoCoord:[110+(Math.random()*2), 296.913+(Math.random()*3)]},
                             {name: '马丁内斯2', value: '马丁内斯', geoCoord:[335, 238.993]},
                             {name: '阿莫雷比3', value: '阿莫雷比', geoCoord:[336.815, 356.313]},
                             {name: '伊劳拉4', value: '伊劳拉', geoCoord:[368, 178.713]},
                             {name: '奥尔特内策5', value: '奥尔特内策', geoCoord:[445.12, 437.923]},
                             {name: '伊图拉斯佩6', value: '伊图拉斯佩', geoCoord:[479.94, 231.95]},
                             {name: '德玛科斯7', value: '德玛科斯', geoCoord:[435.169, 351.413]},
                             {name: '苏塞塔8', value: '苏塞塔', geoCoord:[495.198, 103.913]},
                             {name: '赫雷拉9', value: '赫雷拉', geoCoord:[469.01, 296.313]},
                             {name: '穆尼亚因10', value: '穆尼亚因', geoCoord:[550.88, 461.913]},
                             {name: '洛伦特11', value: '洛伦特', geoCoord:[550.48, 415.783]},
                             //另一只球队
                             {name: '1巴尔德斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '巴尔德斯', geoCoord:[750+(Math.random()*5), 296.913+(Math.random()*3)]},
                              {name: '2梅西',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '梅西', geoCoord:[395.66, 281.913]},
                               {name: '3皮克',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '皮克', geoCoord:[525.324, 259.183]},
                              {name: '4切拉诺',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '切拉诺', geoCoord:[618, 338.913]},
                              {name: '5阿尔维斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿尔维斯', geoCoord:[508.185, 128.913]},
                               {name: '6阿比达尔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿比达尔', geoCoord:[568.598, 399.413]},
                              {name: '7蒂亚戈',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '蒂亚戈', geoCoord:[420.869, 248.693]},
                              {name: '8布茨克斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '布茨克斯', geoCoord:[520, 318.913]},
                              {name: '9雷加斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '雷加斯', geoCoord:[476, 408.913]},
                              {name: '10伊涅斯塔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '伊涅斯塔', geoCoord:[401.01, 128.913]},
                              {name: '11比利亚',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '比利亚', geoCoord:[365, 451.813]}
                            
                            ]
                        },
                        markLine : {
                            data : [
                                [
                                    {name:'赫雷拉', geoCoord:[459.01, 286.313]}, 
                                    {name:'洛伦特', geoCoord:[540.48, 405.783]}
                                ]
                            ]
                        }
                    }
                        ]
                    },
                    // 11
                    {
                        series : [
                        {
                       markPoint : {
                            data : [
                             {name: '1伊莱索斯',
                             itemStyle:{normal:{color:'blue',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                             value: '伊莱索斯', geoCoord:[110+(Math.random()*2), 296.913+(Math.random()*3)]},
                             {name: '马丁内斯2', value: '马丁内斯', geoCoord:[325, 218.993]},
                             {name: '阿莫雷比3', value: '阿莫雷比', geoCoord:[346.815, 376.313]},
                             {name: '伊劳拉4', value: '伊劳拉', geoCoord:[371, 161.713]},
                             {name: '奥尔特内策5', value: '奥尔特内策', geoCoord:[455.12, 437.923]},
                             {name: '伊图拉斯佩6', value: '伊图拉斯佩', geoCoord:[499.94, 211.95]},
                             {name: '德玛科斯7', value: '德玛科斯', geoCoord:[455.169, 361.413]},
                             {name: '苏塞塔8', value: '苏塞塔', geoCoord:[525.198, 103.913]},
                             {name: '赫雷拉9', value: '赫雷拉', geoCoord:[489.01, 296.313]},
                             {name: '穆尼亚因10', value: '穆尼亚因', geoCoord:[580.88, 461.913]},
                             {name: '洛伦特11', value: '洛伦特', geoCoord:[550.48, 415.783]},
                             //另一只球队
                             {name: '1巴尔德斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '巴尔德斯', geoCoord:[750+(Math.random()*5), 296.913+(Math.random()*3)]},
                              {name: '2梅西',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '梅西', geoCoord:[375.66, 282.913]},
                               {name: '3皮克',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '皮克', geoCoord:[525.324, 239.183]},
                              {name: '4切拉诺',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '切拉诺', geoCoord:[648, 338.913]},
                              {name: '5阿尔维斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿尔维斯', geoCoord:[518.185, 126.913]},
                               {name: '6阿比达尔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿比达尔', geoCoord:[578.598, 429.413]},
                              {name: '7蒂亚戈',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '蒂亚戈', geoCoord:[408.869, 228.693]},
                              {name: '8布茨克斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '布茨克斯', geoCoord:[518, 317.913]},
                              {name: '9雷加斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '雷加斯', geoCoord:[476, 408.913]},
                              {name: '10伊涅斯塔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '伊涅斯塔', geoCoord:[381.01, 138.913]},
                              {name: '11比利亚',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '比利亚', geoCoord:[360, 431.813]}
                            
                            ]
                        },
                        markLine : {
                            data : [
                                [
                                    {name:'洛伦特', geoCoord:[550.48, 415.783]}, 
                                    {name:'穆尼亚因', geoCoord:[580.88, 461.913]}
                                ]
                            ]
                        }
                    }
                        ]
                    },
                        // 11
                    {
                        series : [
                        {
                       markPoint : {
                            data : [
                             {name: '1伊莱索斯',
                             itemStyle:{normal:{color:'blue',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                             value: '伊莱索斯', geoCoord:[110+(Math.random()*2), 296.913+(Math.random()*3)]},
                             {name: '马丁内斯2', value: '马丁内斯', geoCoord:[335, 238.993]},
                             {name: '阿莫雷比3', value: '阿莫雷比', geoCoord:[336.815, 356.313]},
                             {name: '伊劳拉4', value: '伊劳拉', geoCoord:[368, 178.713]},
                             {name: '奥尔特内策5', value: '奥尔特内策', geoCoord:[445.12, 437.923]},
                             {name: '伊图拉斯佩6', value: '伊图拉斯佩', geoCoord:[479.94, 231.95]},
                             {name: '德玛科斯7', value: '德玛科斯', geoCoord:[435.169, 351.413]},
                             {name: '苏塞塔8', value: '苏塞塔', geoCoord:[495.198, 103.913]},
                             {name: '赫雷拉9', value: '赫雷拉', geoCoord:[469.01, 296.313]},
                             {name: '穆尼亚因10', value: '穆尼亚因', geoCoord:[580.88, 461.913]},
                             {name: '洛伦特11', value: '洛伦特', geoCoord:[550.48, 415.783]},
                             //另一只球队
                             {name: '1巴尔德斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '巴尔德斯', geoCoord:[750+(Math.random()*5), 296.913+(Math.random()*3)]},
                              {name: '2梅西',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '梅西', geoCoord:[395.66, 281.913]},
                               {name: '3皮克',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '皮克', geoCoord:[525.324, 259.183]},
                              {name: '4切拉诺',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '切拉诺', geoCoord:[618, 338.913]},
                              {name: '5阿尔维斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿尔维斯', geoCoord:[508.185, 128.913]},
                               {name: '6阿比达尔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '阿比达尔', geoCoord:[568.598, 399.413]},
                              {name: '7蒂亚戈',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '蒂亚戈', geoCoord:[420.869, 248.693]},
                              {name: '8布茨克斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '布茨克斯', geoCoord:[520, 318.913]},
                              {name: '9雷加斯',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '雷加斯', geoCoord:[476, 408.913]},
                              {name: '10伊涅斯塔',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '伊涅斯塔', geoCoord:[401.01, 128.913]},
                              {name: '11比利亚',
                               itemStyle:{normal:{color:'red',label:{show:true,color:'red',textStyle:{color:'white',fontSize:'12'}}}},
                               value: '比利亚', geoCoord:[365, 451.813]}
                            
                            ]
                        },
                        markLine : {
                            data : [
                                [
                                    
                                    {name:'穆尼亚因', geoCoord:[580.88, 461.913]},
                                    {name:'守门员', geoCoord:[750+(Math.random()*5), 296.913+(Math.random()*3)]}
                                ]
                            ]
                        }
                    }
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
