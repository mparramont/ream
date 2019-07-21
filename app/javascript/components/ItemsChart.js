import React from "react";
import { Pie } from "react-chartjs-2";

const chartData = data => ({
  labels: ["Input Data", "Output Data"],
  datasets: [
    {
      data: data,
      backgroundColor: ["#77be9c", "#22262d"],
      hoverBackgroundColor: ["#458989", "#295568"]
    }
  ]
});

class ItemsChart extends React.Component {
  render() {
    return (
      <div>
        <Pie
          data={chartData(this.props.chartData)}
          width={300}
          height={300}
          options={{ maintainAspectRatio: false }}
        />
      </div>
    );
  }
}

export default ItemsChart;
