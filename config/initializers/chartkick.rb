Chartkick.options = {
  donut: true,
  legend: false,
  colors: ["#FF0000",
           "#008000",
           "#FFFF00",
           "#0000FF"
          ],
  message: {empty: "データがありません"},
  thousands: ",",
  suffix: "円",
  library: {
    title: {
      align: 'center',
      verticalAlign: 'middle',
    },
    chart: {
      backgroundColor: 'none',
      plotBorderWidth: 0,
      plotShadow: false
    },
    plotOptions: {
      pie: {
        dataLabels: {
          enabled: true,
          distance: -40,
          allowOverlap: false,
          style: {
            color: '#555',
            textAlign: 'center',
            textOutline: 0,
          }
        },
        size: '110%',
        innerSize: '40%',
        borderWidth: 0,
      }
    }
  }
}
