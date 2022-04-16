import React, {useEffect, useState} from 'react';
import axios from "axios";
import 'bootstrap/dist/css/bootstrap.min.css'
import './App.css';
import { Row, Container, Navbar, Nav, Form, Alert, Button } from 'react-bootstrap'

function App() {
  const [searchText, setSearchText] = useState("");
  const [showResults, setShowResults] = useState(false)
  const [mostPilotedStarshipData, setMostPilotedStarshipData] = useState({});

  useEffect(() => {
      document.title = "Star Wars";
  }, [])

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
      <div>
          <Navbar className="justify-content-between" bg="light" expand="lg">
            <Container>
                <Navbar.Brand href={"/"}>Star Wars</Navbar.Brand>
            </Container>
          </Navbar>
          <div style={{ display: 'flex' }}>
              <Navbar.Toggle aria-controls="basic-navbar-nav"/>
              <Navbar.Collapse id="basic-navbar-nav">
                  <Nav className="mr-auto">
                      <Nav.Link href="http://127.0.0.1:8000/admin" target="_blank">Django Administration</Nav.Link>
                  </Nav>
              </Navbar.Collapse>
          </div>
            <Container style={{ padding: 20, marginTop: 20 }}>
              <Row>
                  <h4 style={{ textAlign: 'center' }}>Star Wars Most Piloted Starship Searcher</h4>
                  <Form.Group className="mb-3">
                      <Form.Label>Planets</Form.Label>
                      <Form.Control type="text" placeholder="Sullust, Corellia, Kashyyyk" onChange={e => setSearchText(e.target.value)}/>
                      <Form.Text className="text-muted">Split planet using commas</Form.Text>
                      <br />
                      <br />
                      <Button variant="primary" onClick={e => searchMostPilotedStarship(e)}>Search</Button>{' '}
                  </Form.Group>
              </Row>
              <Container className="container result" style={{ display: showResults ? "block" : "none" }}>
                {
                  mostPilotedStarshipData.count > 0 ?
                  <>
                      {mostPilotedStarshipData.results.map((value, index) =>
                          <p key={index}>{value.name} : {value.model}</p>
                      )}
                  </>
                  : <>
                      <Alert variant="danger" onClose={() => setShowResults(false)} dismissible>
                          <Alert.Heading>No starship found!</Alert.Heading>
                      </Alert>
                    </>
               }
               </Container>
            </Container>
      </div>
  );
}

export default App;
