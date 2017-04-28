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
            	        trigger: 'item',
            	        formatter: "{a} <br/>{b} : {c} ({d}%)"
            	    },
            	    legend: {
            	        orient : 'vertical',
            	        x : 'left',
            	        data:['直达','营销广告','搜索引擎','邮件营销','联盟广告','视频广告','百度','谷歌','必应','其他']
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            magicType : {
            	                show: true, 
            	                type: ['pie', 'funnel']
            	            },
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    calculable : false,
            	    series : [
            	        {
            	            name:'访问来源',
            	            type:'pie',
            	            selectedMode: 'single',
            	            radius : [0, 70],
            	            
            	            // for funnel
            	            x: '20%',
            	            width: '40%',
            	            funnelAlign: 'right',
            	            max: 1548,
            	            
            	            itemStyle : {
            	                normal : {
            	                    label : {
            	                        position : 'inner'
            	                    },
            	                    labelLine : {
            	                        show : false
            	                    }
            	                }
            	            },
            	            data:[
            	                {value:335, name:'直达'},
            	                {value:679, name:'营销广告'},
            	                {value:1548, name:'搜索引擎', selected:true}
            	            ]
            	        },
            	        {
            	            name:'访问来源',
            	            type:'pie',
            	            radius : [100, 140],
            	            
            	            // for funnel
            	            x: '60%',
            	            width: '35%',
            	            funnelAlign: 'left',
            	            max: 1048,
            	            
            	            data:[
            	                {value:335, name:'直达'},
            	                {value:310, name:'邮件营销'},
            	                {value:234, name:'联盟广告'},
            	                {value:135, name:'视频广告'},
            	                {value:1048, name:'百度'},
            	                {value:251, name:'谷歌'},
            	                {value:147, name:'必应'},
            	                {value:102, name:'其他'}
            	            ]
            	        }
            	    ]
            	};
            	var ecConfig = require('echarts/config');
            	myChart.on(ecConfig.EVENT.PIE_SELECTED, function (param){
            	    var selected = param.selected;
            	    var serie;
            	    var str = '当前选择： ';
            	    for (var idx in selected) {
            	        serie = option.series[idx];
            	        for (var i = 0, l = serie.data.length; i < l; i++) {
            	            if (selected[idx][i]) {
            	                str += '【系列' + idx + '】' + serie.name + ' : ' + 
            	                       '【数据' + i + '】' + serie.data[i].name + ' ';
            	            }
            	        }
            	    }
            	    document.getElementById('wrong-message').innerHTML = str;
            	})

            
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
