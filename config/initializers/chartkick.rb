Chartkick.options = {
  donut: true,
  colors: ['#FF0000',
           '#008000',
           '#FFFF00',
           '#0000FF'],
  message: { empty: 'データがありません' },
  thousands: ',',
  suffix: '票',
  library: {
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
            color: '#000',
            textAlign: 'left',
            textOutline: 0
          }
        },
        size: '110%',
        innerSize: '30%',
        borderWidth: 0
      }
    }
  },
  tooltips: {
    titleFontSize: 18,
    bodyFontSize: 18
  }
}
