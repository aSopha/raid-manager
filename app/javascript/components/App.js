import React, { Component } from 'react';
import Table from '../components/Table';
import SearchBar from '../components/SearchBar';
import Dropdown from 'react-dropdown';
import 'react-dropdown/style.css';

class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      rosters: null,
      roster_view: null
    };
    this.handleSwitch = this.handleSwitch.bind(this);
  }
  componentDidMount() {
    fetch('/rosters')
      .then(response => response.json())
      .then(rosters => this.setState({ rosters, roster_view: 0 }));
  }
  handleSearch(playerName) {
    console.log(playerName);
    const currentRoster = this.state.roster_view;
    fetch('/players', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        playerName: playerName,
        realm: 'kiljaeden',
        roster_name: this.state.rosters[this.state.roster_view].roster_name
      })
    })
    .then(
      () => fetch('/rosters')
      .then(response => response.json())
      .then(rosters => this.setState({ rosters, roster_view: currentRoster }))
    );
  }
  handleRemove(playerName) {
    console.log('removing', playerName);
    const currentRoster = this.state.roster_view;
    fetch(`/players/${playerName}`, {
      method: 'DELETE',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        playerName: playerName,
        realm: 'kiljaeden',
        roster_name: this.state.rosters[this.state.roster_view].roster_name
      })
    })
    .then(
      () => fetch('/rosters')
      .then(response => response.json())
      .then(rosters => this.setState({ rosters, roster_view: currentRoster }))
    );
  }

  getRosterIndex(roster, rosterName) {
    for(var i = 0; i < roster.length; i++) {
      if(roster[i].roster_name === rosterName) {
        return i;
      }
    }
  }
  handleSwitch(event) {
    const rosterName = event.value;
    console.log('switching to', rosterName);
    const rosterIndex = this.getRosterIndex(this.state.rosters, rosterName);

    this.setState({
      rosters: this.state.rosters,
      roster_view: rosterIndex
    });
  }
  render() {
    if(this.state.rosters) {
      const rosterNames = this.state.rosters.map((roster) => {
        return roster.roster_name;
      })
      const currentRoster = this.state.rosters[this.state.roster_view];
      return (
        <div className="App">
          <header className="App-header">
          <SearchBar handleSearch={(i) => this.handleSearch(i)}></SearchBar>
          <Dropdown options={rosterNames} onChange={this.handleSwitch} value={currentRoster.roster_name} placeholder="Select an option" />
          <Table players={currentRoster.players} handleRemove={(i) => this.handleRemove(i)}></Table>
          </header>
        </div>
      );
    }
    return (
      <div className="App">
        <header className="App-header">
        <SearchBar handleSearch={(i) => this.handleSearch(i)}></SearchBar>
        </header>
      </div>
    )
  }
}

export default App;
