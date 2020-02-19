import React, { Component } from 'react';
// import TableRowCategory from './TableRowCategory'
import TableRow from './TableRow';


export default class Table extends Component {
  render() {
  const rows = [];
  // let lastRole = null;

  this.props.players.forEach((player) => {
    // if (player.role !== lastRole) {
    //   rows.push(
    //     <TableRowCategory
    //       role={player.role}
    //       key={player.role} />
    //   );
    // }
    rows.push(
      <TableRow
        handleRemove={(i)=> this.props.handleRemove(i)}
        player={player}
        key={player.player_name} />
    );
    // lastRole = player.role;
  });

  return (
    <table>
      <thead>
        <tr>
          <th></th>
          <th className="Name">Name</th>
          <th className="Class">Class</th>
          <th className="ItemLevel">iLvl</th>
          <th className="HeartLevel">HoA</th>
          <th className="AverageParse">N. Parse</th>
          <th className="AverageParse">H. Parse</th>
          <th className="AverageParse">M. Parse</th>
        </tr>
      </thead>
      <tbody>{rows}</tbody>
    </table>
  );
}
}
