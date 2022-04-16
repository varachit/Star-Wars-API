// import logo from './logo.svg';
import React, { useState } from 'react';
import axios from "axios";
import './App.css';

function App() {
  const [searchText, setSearchText] = useState("");
  const [showResults, setShowResults] = useState(false)
  const [mostPilotedStarshipData, setMostPilotedStarshipData] = useState({});

  function searchMostPilotedStarship(event) {
    const endpoint = "http://127.0.0.1:8000/api/v1/most_piloted?planet=" + searchText;
    axios.get(endpoint).then(function (response) {
       setMostPilotedStarshipData(response.data);
    }).catch(function (error) {
       console.log(error)
    });
    setShowResults(true)
  }

  console.log(mostPilotedStarshipData)

  return (
    <div className="App">
      <div className="container">
          <h4>Star Wars Most Piloted Starship Searcher</h4>
          <h5>Example: Sullust, Corellia, Kashyyyk</h5>
          <input type="text" onChange={e => setSearchText(e.target.value)}></input>
          <button onClick={e => searchMostPilotedStarship(e)}>Search</button>
      </div>
      <div className="container result" style={{ display: showResults ? "block" : "none" }}>
        {
          mostPilotedStarshipData.count > 0 ?
          <>
              {mostPilotedStarshipData.results.map((value, index) =>
                  <p key={index}>{value.name} : {value.model}</p>
              )}
          </>
          : <><p>No starship found</p></>
       }
       </div>
    </div>
  );
}

export default App;
