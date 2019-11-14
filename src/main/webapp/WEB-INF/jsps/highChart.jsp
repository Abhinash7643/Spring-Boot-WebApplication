<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
</head>
<body>
<script src="https://code.highcharts.com/highcharts.js"></script>

<script src="https://code.highcharts.com/modules/export-data.js"></script>

<div id="container" class="colum" style="height: 300px; width: 45%; display: inline-block;  button{display: none;}"></div>

<div id="pie" class="colum1" style="width:45%; height:300px; display: inline-block; margin-right: 20px;"></div>

<div id="line" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<!-- bar chart -->
<script>

Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: ' Employees vs department'
    },
    
    xAxis: {
	
	
	
        type: 'category',
        labels: {
            rotation: -45,
            style: {
                fontSize: '13px',
                fontFamily: 'Verdana, sans-serif'
            }
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: 'no of employees'
        }
    },
    legend: {
        enabled: false
    },
	/*
    tooltip: {
        pointFormat: 'Population in 2017: <b>{point.y:.1f} millions</b>'
    },
	*/
    series: [{
        name: 'Skills',
        data: [ 
        	  <c:forEach items="${barchart}" var="barchart">
              
              ['${barchart.deptName}',
               ${barchart.noOfEmployee}],
         
     			 </c:forEach>
            
        ],
        dataLabels: {
            enabled: true,
            rotation: -90,
            color: '#FFFFFF',
            align: 'right',
            format: '{point.y:.1f}', // one decimal
            y: 10, // 10 pixels down from the top
            style: {
                fontSize: '13px',
                fontFamily: 'Verdana, sans-serif'
            }
        }
    }]
});


</script>
<!--  pie chart-->
<script>
Highcharts.chart('pie', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Employees vs city'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
            }
        }
    },
    series: [{
        colorByPoint: true,
        data: [
        	 <c:forEach items="${city}" var="city">
             
             { name: '${city.city}',y: ${city.empCount}.0,},
        
     </c:forEach>
		]
    }]
});

</script>

<!-- line chart -->
<script>
Highcharts.chart('line', {
    chart: {
        type: 'line'
    },
    title: {
        text: 'Employee vs department'
    },
    
    xAxis: {
	 title: {
            text: 'list of department'
        },
        categories: [
        	 <c:forEach items="${state}" var="state">
             '${state.state}',
       
   			 </c:forEach>
            ,]
    },
    yAxis: {
        title: {
            text: 'No of Employee'
        }
    },
    plotOptions: {
        line: {
            dataLabels: {
                enabled: true
            },
            enableMouseTracking: false
        }
    },
    series: [{
        name: '',
        data: [ 
            <c:forEach items="${state}" var="state">
            ${state.empCount}.0,
      
  			 </c:forEach>
 			 ]
    }]
});
</script>
 <table>
                <!-- 
                 <c:forEach items="${state}" var="state">
             '${state.state}',
       
   			 </c:forEach>
                -->
                <c:forEach items="${state}" var="barchart">
               ${barchart.state}
         
     			 </c:forEach>
                
                  <c:forEach items="${state}" var="barchart">
               '${barchart.empCount}',
         
     			 </c:forEach>
                
                <!--  
                
                
               
                
                <c:forEach items="${city}" var="city">
                   
                        { name: '${city.city}',y: ${city.empCount}.0,},
                   
                </c:forEach>
                 -->
                

           
</body>
</html>