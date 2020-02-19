import React, { Component } from 'react';
export default class TableRowCategory extends Component {
  render() {
    const category = this.props.role;
    return (
      <tr>
        <th colSpan="2">
          {category}
        </th>
      </tr>
    );
  }
}
