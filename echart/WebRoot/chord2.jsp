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
            	    color : [
            	        '#FBB367','#80B1D2','#FB8070','#CC99FF','#B0D961',
            	        '#99CCCC','#BEBBD8','#FFCC99','#8DD3C8','#FF9999',
            	        '#CCEAC4','#BB81BC','#FBCCEC','#CCFF66','#99CC66',
            	        '#66CC66','#FF6666','#FFED6F','#ff7f50','#87cefa',
            	    ],
            	    title : {
            	        text : '中东地区的敌友关系',
            	        subtext: '数据来自财新网',
            	        sublink: 'http://international.caixin.com/2013-09-06/100579154.html',
            	        x:'right',
            	        y:'bottom'
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            restore : {show: true},
            	            magicType: {show: true, type: ['force', 'chord']},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        formatter : function (params) {
            	            if (params.name && params.name.indexOf('-') != -1) {
            	                return params.name.replace('-', ' ' + params.seriesName + ' ')
            	            }
            	            else {
            	                return params.name ? params.name : params.data.id
            	            }
            	        }
            	    },
            	    legend : {
            	        data : [
            	            '美国',
            	            '叙利亚反对派',
            	            '阿萨德',
            	            '伊朗',
            	            '塞西',
            	            '哈马斯',
            	            '以色列',
            	            '穆斯林兄弟会',
            	            '基地组织',
            	            '俄罗斯',
            	            '黎巴嫩什叶派',
            	            '土耳其',
            	            '卡塔尔',
            	            '沙特',
            	            '黎巴嫩逊尼派',
            	            '',
            	            '支持',
            	            '反对',
            	            '未表态'
            	        ],
            	        orient : 'vertical',
            	        x : 'left'
            	    },
            	    series : [
            	        {
            	            "name": "支持",
            	            "type": "chord",
            	            "showScaleText": false,
            	            "clockWise": false,
            	            "data": [
            	                {"name": "美国"},
            	                {"name": "叙利亚反对派"},
            	                {"name": "阿萨德"},
            	                {"name": "伊朗"},
            	                {"name": "塞西"},
            	                {"name": "哈马斯"},
            	                {"name": "以色列"},
            	                {"name": "穆斯林兄弟会"},
            	                {"name": "基地组织"},
            	                {"name": "俄罗斯"},
            	                {"name": "黎巴嫩什叶派"},
            	                {"name": "土耳其"},
            	                {"name": "卡塔尔"},
            	                {"name": "沙特"},
            	                {"name": "黎巴嫩逊尼派"}
            	            ],
            	            "matrix": [
            	                [0,100,0,0,0,0,100,0,0,0,0,0,0,0,0],
            	                [10,0,0,0,0,10,10,0,10,0,0,10,10,10,10],
            	                [0,0,0,10,0,0,0,0,0,10,10,0,0,0,0],
            	                [0,0,100,0,0,100,0,0,0,0,100,0,0,0,0],
            	                [0,0,0,0,0,0,0,0,0,0,0,0,0,10,0],
            	                [0,100,0,10,0,0,0,0,0,0,0,0,10,0,0],
            	                [10,100,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,0,0,0,0,0,0,0,0,0,10,10,0,0],
            	                [0,100,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,100,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,100,10,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,100,0,0,0,0,0,100,0,0,0,0,0,0,0],
            	                [0,100,0,0,0,100,0,100,0,0,0,0,0,0,0],
            	                [0,100,0,0,100,0,0,0,0,0,0,0,0,0,100],
            	                [0,100,0,0,0,0,0,0,0,0,0,0,0,10,0]
            	            ]
            	        },
            	        {
            	            "name": "反对",
            	            "type": "chord",
            	            "insertToSerie": "支持",
            	            "data": [
            	                {"name": "美国"},
            	                {"name": "叙利亚反对派"},
            	                {"name": "阿萨德"},
            	                {"name": "伊朗"},
            	                {"name": "塞西"},
            	                {"name": "哈马斯"},
            	                {"name": "以色列"},
            	                {"name": "穆斯林兄弟会"},
            	                {"name": "基地组织"},
            	                {"name": "俄罗斯"},
            	                {"name": "黎巴嫩什叶派"},
            	                {"name": "土耳其"},
            	                {"name": "卡塔尔"},
            	                {"name": "沙特"},
            	                {"name": "黎巴嫩逊尼派"}
            	            ],
            	            "matrix": [
            	                [0,0,100,100,0,100,0,0,100,0,0,0,0,0,0],
            	                [0,0,0,10,0,0,0,0,0,10,10,0,0,0,0],
            	                [10,0,0,0,0,0,10,10,10,0,0,10,10,0,10],
            	                [10,100,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,0,0,0,10,0,100,0,0,0,10,10,0,0],
            	                [10,0,0,0,100,0,10,0,0,0,0,0,0,0,0],
            	                [0,0,100,0,0,100,0,0,0,0,0,0,0,0,0],
            	                [0,0,100,0,10,0,0,0,0,0,0,0,0,10,0],
            	                [10,0,100,0,0,0,0,0,0,0,0,0,0,100,0],
            	                [0,100,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,100,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,100,0,100,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,100,0,100,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,0,0,0,0,0,100,10,0,0,0,0,0,0],
            	                [0,0,100,0,0,0,0,0,0,0,0,0,0,0,0]
            	            ]
            	        },
            	        {
            	            "name": "未表态",
            	            "type": "chord",
            	            "insertToSerie": "支持",
            	            "data": [
            	                {"name": "美国"},
            	                {"name": "叙利亚反对派"},
            	                {"name": "阿萨德"},
            	                {"name": "伊朗"},
            	                {"name": "塞西"},
            	                {"name": "哈马斯"},
            	                {"name": "以色列"},
            	                {"name": "穆斯林兄弟会"},
            	                {"name": "基地组织"},
            	                {"name": "俄罗斯"},
            	                {"name": "黎巴嫩什叶派"},
            	                {"name": "土耳其"},
            	                {"name": "卡塔尔"},
            	                {"name": "沙特"},
            	                {"name": "黎巴嫩逊尼派"}
            	            ],
            	            "matrix": [
            	                [0,0,0,0,100,0,0,100,0,0,0,0,0,0,0],
            	                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [10,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [10,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            	                [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
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
