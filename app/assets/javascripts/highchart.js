function makeMap() {
  var realData = JSON.parse($("#map-json-data").html());
  console.log(realData);

  var chart = new Highcharts.Map({
    chart: {
        renderTo: 'usa',
        width: $("#usa").width(),
        height: 750
    },
    events: {
      click: function(event){
        console.log("clicked");
        console.log(event);
      }
    },
    title: {
        text: null
    },
    legend: {
      enabled: false
    },
    series : [{
        animation: {duration: 800},
        data : realData,
        mapData: Highcharts.maps['countries/us/us-all'],
        joinBy: ['postal-code','state'],
        dataLabels: {
                enabled: true,
                color: 'white',
                format: '{point.state}'
            },
        name: 'Politweets Winner',
        tooltip: {
            pointFormat: '{point.winner}: {point.winnerPercentage}%'
        }
    }]
});
}

$(makeMap);
