var xValues = [10,20,30,40,50,60,70,80,90,100];

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: [{ 
      data: {$ping_classic_data},
      borderColor: "green",
      fill: true
    }]
  },
  options: {
    legend: {display: false}
  }
});