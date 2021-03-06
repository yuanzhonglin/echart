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
            	    title : {
            	        text: '德国队效力联盟',
            	        x:'right',
            	        y:'bottom'
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        formatter: function (params) {
            	            if (params.indicator2) {    // is edge
            	                return params.indicator2 + ' ' + params.name + ' ' + params.indicator;
            	            } else {    // is node
            	                return params.name
            	            }
            	        }
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            restore : {show: true},
            	            magicType: {show: true, type: ['force', 'chord']},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    legend: {
            	        x: 'left',
            	        data:['阿森纳', '拜仁慕尼黑', '多特蒙德']
            	    },
            	    series : [
            	        {
            	            type:'chord',
            	            sort : 'ascending',
            	            sortSub : 'descending',
            	            showScale : false,
            	            itemStyle : {
            	                normal : {
            	                    label : {
            	                        rotate : true
            	                    }
            	                }
            	            },
            	            // 使用 nodes links 表达和弦图
            	            nodes: [
            	                {name:'默特萨克'},
            	                {name:'厄齐尔'},
            	                {name:'波多尔斯基'},
            	                {name:'诺伊尔'},
            	                {name:'博阿滕'},
            	                {name:'施魏因施泰格'},
            	                {name:'拉姆'},
            	                {name:'克罗斯'},
            	                {name:'穆勒'},
            	                {name:'格策'},
            	                {name:'胡梅尔斯'},
            	                {name:'魏登费勒'},
            	                {name:'杜尔姆'},
            	                {name:'格罗斯克罗伊茨'},
            	                {name:'阿森纳'},
            	                {name:'拜仁慕尼黑'},
            	                {name:'多特蒙德'}
            	            ],
            	            links: [
            	                {source: '阿森纳', target: '默特萨克', weight: 0.9, name: '效力'},
            	                {source: '阿森纳', target: '厄齐尔', weight: 0.9, name: '效力'},
            	                {source: '阿森纳', target: '波多尔斯基', weight: 0.9, name: '效力'},
            	                {source: '拜仁慕尼黑', target: '诺伊尔', weight: 0.9, name: '效力'},
            	                {source: '拜仁慕尼黑', target: '博阿滕', weight: 0.9, name: '效力'},
            	                {source: '拜仁慕尼黑', target: '施魏因施泰格', weight: 0.9, name: '效力'},
            	                {source: '拜仁慕尼黑', target: '拉姆', weight: 0.9, name: '效力'},
            	                {source: '拜仁慕尼黑', target: '克罗斯', weight: 0.9, name: '效力'},
            	                {source: '拜仁慕尼黑', target: '穆勒', weight: 0.9, name: '效力'},
            	                {source: '拜仁慕尼黑', target: '格策', weight: 0.9, name: '效力'},
            	                {source: '多特蒙德', target: '胡梅尔斯', weight: 0.9, name: '效力'},
            	                {source: '多特蒙德', target: '魏登费勒', weight: 0.9, name: '效力'},
            	                {source: '多特蒙德', target: '杜尔姆', weight: 0.9, name: '效力'},
            	                {source: '多特蒙德', target: '格罗斯克罗伊茨', weight: 0.9, name: '效力'},

            	                // Ribbon Type 的和弦图每一对节点之间必须是双向边
            	                {target: '阿森纳', source: '默特萨克', weight: 1},
            	                {target: '阿森纳', source: '厄齐尔', weight: 1},
            	                {target: '阿森纳', source: '波多尔斯基', weight: 1},
            	                {target: '拜仁慕尼黑', source: '诺伊尔', weight: 1},
            	                {target: '拜仁慕尼黑', source: '博阿滕', weight: 1},
            	                {target: '拜仁慕尼黑', source: '施魏因施泰格', weight: 1},
            	                {target: '拜仁慕尼黑', source: '拉姆', weight: 1},
            	                {target: '拜仁慕尼黑', source: '克罗斯', weight: 1},
            	                {target: '拜仁慕尼黑', source: '穆勒', weight: 1},
            	                {target: '拜仁慕尼黑', source: '格策', weight: 1},
            	                {target: '多特蒙德', source: '胡梅尔斯', weight: 1},
            	                {target: '多特蒙德', source: '魏登费勒', weight: 1},
            	                {target: '多特蒙德', source: '杜尔姆', weight: 1},
            	                {target: '多特蒙德', source: '格罗斯克罗伊茨', weight: 1}
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
