import React, { Component } from 'react';
import dpsIcon from './../images/dpsicon.png';
import healerIcon from './../images/healericon.png';
import tankIcon from './../images/tankicon.png';
import deleteIcon from './../images/deleteicon.png';

export default class TableRow extends Component {

  constructor(props) {
    super(props);
    this.state = {value: ''};

    this.handleRemove = this.handleRemove.bind(this);
  }


  handleRemove(event) {
    this.props.handleRemove(this.props.player.player_name);
    event.preventDefault();
  }

  render() {
    const player = this.props.player;
    const name = player.player_name;
    let roleIcon = roleIconHelper(player);
    const classClass = nameColorHelper(player, 'Class');
    const nameClass = nameColorHelper(player, 'Name');

    return (
      <tr>
        <td className="RemoveButton">
          <button onClick={this.handleRemove} className="RemoveButton">
            <img className="RemoveIcon" src={deleteIcon} alt="Delete Icon"/>
          </button>
        </td>
        <td className={nameClass}>
          <img src={roleIcon} alt="Role Icon"/>
          <a href={player.warcraft_logs_link} target="_blank" rel="noopener noreferrer">{name}</a>
        </td>
        <td className={classClass}>{player.player_class}</td>
        <td className="ItemLevel">{player.item_level}</td>
        <td className="HeartLevel">{player.heart_level}</td>
        <td className="AverageParse">{avgParseHelper(player.avg_normal_parse)}</td>
        <td className="AverageParse">{avgParseHelper(player.avg_heroic_parse)}</td>
        <td className="AverageParse">{avgParseHelper(player.avg_mythic_parse)}</td>
      </tr>
    );
  }
}

const avgParseHelper = (avgParse) => {
  return avgParse > 0 ? avgParse : '-';
}
const roleIconHelper = (player) => {
  if(player.role === 'healer') {
    return healerIcon;
  } else if(player.role ==='dps') {
    return dpsIcon;
  } else if(player.role ==='tank') {
    return tankIcon;
  } else {
    return;
  }
}

const nameColorHelper = (player, cssClass) => {
  if(player.player_class === 'Warrior') {
    return cssClass + ' Warrior';
  } else if(player.player_class === 'Paladin') {
    return cssClass + ' Paladin';
  } else if(player.player_class === 'Hunter') {
    return cssClass + ' Hunter';
  } else if(player.player_class === 'Rogue') {
    return cssClass + ' Rogue';
  } else if(player.player_class === 'Priest') {
    return cssClass + ' Priest';
  } else if(player.player_class === 'Death Knight') {
    return cssClass + ' DeathKnight';
  } else if(player.player_class === 'Shaman') {
    return cssClass + ' Shaman';
  } else if(player.player_class === 'Mage') {
    return cssClass + ' Mage';
  } else if(player.player_class === 'Warlock') {
    return cssClass + ' Warlock';
  } else if(player.player_class === 'Monk') {
    return cssClass + ' Monk';
  } else if(player.player_class === 'Druid') {
    return cssClass + ' Druid';
  } else if(player.player_class === 'Demon Hunter') {
    return cssClass + ' DemonHunter';
  } else {
    return;
  }
}
