<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- highcharts --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>

<title>Insert title here</title>
</head>
<body style="color: white;">
<!-- <h2>안녕 이곳은 앞으로 차트가 들어갈꺼야 ~ ! </h2> -->
<div id="container" style="min-width: 310px; height: 500px; margin: 0 auto"></div>
<table id="good" style="display: none;">
<script type="text/javascript">
$(document).ready(function() {
	Highcharts.createElement('link', {
		   href: 'https://fonts.googleapis.com/css?family=Unica+One',
		   rel: 'stylesheet',
		   type: 'text/css'
		}, null, document.getElementsByTagName('head')[0]);

		Highcharts.theme = {
		   // 차트 바 색상
			colors: ['#00bfa5', '#bdbdbd', '#f45b5b', '#7798BF', '#aaeeee', '#ff0066', '#eeaaee',
		      '#55BF3B', '#DF5353', '#7798BF', '#aaeeee'],
		   chart: {
		      backgroundColor: {
		         linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
		         stops: [
		            [0, '#2a2a2b'],
		            [1, '#3e3e40']
		         ]
		      },
		      style: {
		         fontFamily: '\'Unica One\', sans-serif'
		      },
		      plotBorderColor: '#606063'
		   },
		   title: {
		      style: {
		         color: '#E0E0E3',
		         textTransform: 'uppercase',
		         fontSize: '20px'
		      }
		   },
		   subtitle: {
		      style: {
		         color: '#E0E0E3',
		         textTransform: 'uppercase'
		      }
		   },
		   xAxis: {
		      gridLineColor: '#707073',
		      labels: {
		         style: {
		            color: '#E0E0E3'
		         }
		      },
		      lineColor: '#707073',
		      minorGridLineColor: '#505053',
		      tickColor: '#707073',
		      title: {
		         style: {
		            color: '#A0A0A3'

		         }
		      }
		   },
		   yAxis: {
		      gridLineColor: '#707073',
		      labels: {
		         style: {
		            color: '#E0E0E3'
		         }
		      },
		      lineColor: '#707073',
		      minorGridLineColor: '#505053',
		      tickColor: '#707073',
		      tickWidth: 1,
		      title: {
		         style: {
		            color: '#A0A0A3'
		         }
		      }
		   },
		   tooltip: {
		      backgroundColor: 'rgba(0, 0, 0, 0.85)',
		      style: {
		         color: '#F0F0F0'
		      }
		   },
		   plotOptions: {
		      series: {
		         dataLabels: {
		            color: '#B0B0B3'
		         },
		         marker: {
		            lineColor: '#333'
		         }
		      },
		      boxplot: {
		         fillColor: '#505053'
		      },
		      candlestick: {
		         lineColor: 'white'
		      },
		      errorbar: {
		         color: 'white'
		      }
		   },
		   legend: {
		      itemStyle: {
		         color: '#E0E0E3'
		      },
		      itemHoverStyle: {
		         color: '#FFF'
		      },
		      itemHiddenStyle: {
		         color: '#606063'
		      }
		   },
		   credits: {
		      style: {
		         color: '#666'
		      }
		   },
		   labels: {
		      style: {
		         color: '#707073'
		      }
		   },

		   drilldown: {
		      activeAxisLabelStyle: {
		         color: '#F0F0F3'
		      },
		      activeDataLabelStyle: {
		         color: '#F0F0F3'
		      }
		   },

		   navigation: {
		      buttonOptions: {
		         symbolStroke: '#DDDDDD',
		         theme: {
		            fill: '#505053'
		         }
		      }
		   },

		   // scroll charts
		   rangeSelector: {
		      buttonTheme: {
		         fill: '#505053',
		         stroke: '#000000',
		         style: {
		            color: '#CCC'
		         },
		         states: {
		            hover: {
		               fill: '#707073',
		               stroke: '#000000',
		               style: {
		                  color: 'white'
		               }
		            },
		            select: {
		               fill: '#000003',
		               stroke: '#000000',
		               style: {
		                  color: 'white'
		               }
		            }
		         }
		      },
		      inputBoxBorderColor: '#505053',
		      inputStyle: {
		         backgroundColor: '#333',
		         color: 'silver'
		      },
		      labelStyle: {
		         color: 'silver'
		      }
		   },

		   navigator: {
		      handles: {
		         backgroundColor: '#666',
		         borderColor: '#AAA'
		      },
		      outlineColor: '#CCC',
		      maskFill: 'rgba(255,255,255,0.1)',
		      series: {
		         color: '#7798BF',
		         lineColor: '#A6C7ED'
		      },
		      xAxis: {
		         gridLineColor: '#505053'
		      }
		   },

		   scrollbar: {
		      barBackgroundColor: '#808083',
		      barBorderColor: '#808083',
		      buttonArrowColor: '#CCC',
		      buttonBackgroundColor: '#606063',
		      buttonBorderColor: '#606063',
		      rifleColor: '#FFF',
		      trackBackgroundColor: '#404043',
		      trackBorderColor: '#404043'
		   },

		   // special colors for some of the
		   legendBackgroundColor: 'rgba(0, 0, 0, 0.5)',
		   background2: '#505053',
		   dataLabelsColor: '#B0B0B3',
		   textColor: '#C0C0C0',
		   contrastTextColor: '#F0F0F3',
		   maskColor: 'rgba(255,255,255,0.3)'
		};

		// Apply the theme
		Highcharts.setOptions(Highcharts.theme);
	
Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text:'Top 100 평가 차트'
    },
    subtitle: {
        text: '사이트 내 이용자분들께서 적어주신 내용을 반영한 차트입니다.(<b> 바를 클릭하시면 상세정보 확인이 가능합니다.</b>)'
    },
    xAxis: {
        type: 'category'
    },
    yAxis: {
        title: {
            text: '횟수'
        }

    },
    legend: {
        enabled: false
    },
    plotOptions: {
        series: {
            borderWidth: 0,
            dataLabels: {
                enabled: true,
                format: '{point.y:.f}회'
            }
        }
    },

    tooltip: {
        headerFormat: '<span style="font-size:13px">{series.name}</span><br>',
        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.f}회'
    },

    series: [{
        name: 'Brands',
        colorByPoint: true,
        data: [{
            name: '총 좋아요 횟수',
            y: ${goodcount},
            drilldown: '좋아요!'
        }, {
            name: '총 싫어요 횟수',
            y: ${bedcount},
            drilldown: '싫어요!'
        }]
    }],
    drilldown: {
        series: [{
            name: '좋아요!',
            id: '좋아요!',
            data: [
				${goodlist}			
            ]
        }, {
            name: '싫어요!',
            id: '싫어요!',
            data: [
                ${bedlist}
            ]

        }]
    }
  });
});
</script>
</body>
</html>