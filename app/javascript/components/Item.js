import React from "react";
import ReactJson from "react-json-view";

class Item extends React.Component {
  render() {
    return (
      <div class="item">
        <ReactJson src={this.props.inputData} />
        <ReactJson src={this.props.outputData} />
      </div>
    );
  }
}

export default Item;
