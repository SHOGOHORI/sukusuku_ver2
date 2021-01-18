Chartkick.options = {
  donut: true,
  colors: ['#e09085',
           '#75ceb8',
           '#ffce55',
           '#7a9eb7'],
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
        innerSize: '50%',
        borderWidth: 0
      }
    }
  },
  tooltips: {
    titleFontSize: 18,
    bodyFontSize: 18
  }
}
