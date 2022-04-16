import React, {useEffect, useState} from 'react';
import axios from "axios";
import 'bootstrap/dist/css/bootstrap.min.css'
import './App.css';
import { Row, Container, Navbar, Nav, Form, Alert, Button, Card, Table } from 'react-bootstrap'

function App() {
  const [mostPilotedSearchText, setMostPilotedSearchText] = useState("");
  const [showMostPilotedResults, setShowMostPilotedResults] = useState(false);
  const [mostPilotedStarshipData, setMostPilotedStarshipData] = useState({});

  const [personSearchText, setPersonSearchText] = useState("");
  const [showPersonResults, setShowPersonResults] = useState(false);
  const [personData, setPersonData] = useState({});

  const [planetSearchText, setPlanetSearchText] = useState("");
  const [showPlanetResults, setShowPlanetResults] = useState(false);
  const [planetData, setPlanetData] = useState({});

  useEffect(() => {
      document.title = "Star Wars";
  }, [])

  function searchMostPilotedStarship(event) {
    const endpoint = "http://127.0.0.1:8000/api/v1/most_piloted?planet=" + mostPilotedSearchText;
    axios.get(endpoint).then(function (response) {
       setMostPilotedStarshipData(response.data);
    }).catch(function (error) {
       console.log(error)
    });
    setShowMostPilotedResults(true)

      console.log(mostPilotedStarshipData)
  }

  function searchPerson(event) {
   setShowPersonResults(true)
   if(personSearchText === "") {
      return;
   }
   const endpoint = "http://127.0.0.1:8000/api/v1/person/search?name=" + personSearchText;

   axios.get(endpoint).then(function (response) {
   setPersonData(response.data);
   }).catch(function (error) {
    console.log(error)
   });
   console.log(personData)
  }

  function searchPlanet(event) {
   setShowPlanetResults(true)
   if(planetSearchText === "") {
       return;
   }
   const endpoint = "http://127.0.0.1:8000/api/v1/planet/search?name=" + planetSearchText;
   axios.get(endpoint).then(function (response) {
   setPlanetData(response.data);
   }).catch(function (error) {
       console.log(error)
   });
   console.log(planetData)
  }

  function mostPilotedResetForm() {
      setMostPilotedSearchText('')
      setShowMostPilotedResults(false)
      setMostPilotedStarshipData({})
  }

  function personResetForm() {
      setPersonSearchText('')
      setShowPersonResults(false)
      setPersonData({})
  }

  function planetResetForm() {
      setPlanetSearchText('')
      setShowPlanetResults(false)
      setPlanetData({})
  }


  return (
      <div>
          <Navbar className="justify-content-between" bg="light" expand="lg">
            <Container>
                <Navbar.Brand href={"/"}>Star Wars</Navbar.Brand>
                <Navbar.Toggle arid-controls="basic-navbar-nav" />
                <Navbar.Collapse id="basic-navbar-nav" >
                    <Nav className="me-auto">
                        <Nav.Link href="/">Home</Nav.Link>
                        <Nav.Link href="http://127.0.0.1:8000/admin">Django Administration</Nav.Link>
                    </Nav>
                </Navbar.Collapse>
            </Container>
          </Navbar>

            <Container style={{ padding: 20, marginTop: 20 }}>
              <Row>
                  <h4 style={{ textAlign: 'center' }}>Most Piloted Starship Searcher</h4>
                  <h6 className="text-muted" style={{ textAlign: 'center' }}>Locates the most piloted starship across
                      all of the residents from target planets.</h6>
                  <Form.Group className="mb-3" id="search-most-piloted-form">
                      <Form.Label>Planets</Form.Label>
                      <Form.Control type="text" placeholder="Sullust, Corellia, Kashyyyk"
                                    value={mostPilotedSearchText}
                                    onChange={e => setMostPilotedSearchText(e.target.value)}
                      />
                      <Form.Text className="text-muted">Separate each planet using commas</Form.Text>
                      <br />
                      <br />
                      <Button variant="primary" onClick={e => searchMostPilotedStarship(e)}>Search</Button>{' '}
                      <Button variant="danger" onClick={mostPilotedResetForm}>Reset</Button>{' '}
                      <br />
                  </Form.Group>
              </Row>
              <Container className="container" style={{ display: showMostPilotedResults ? "block" : "none" }}>
                {
                  mostPilotedStarshipData.count > 0 ?
                  <>
                      <div className="row">
                          {mostPilotedStarshipData.results.map((value, index) =>
                              <Card key={index} className="flex-fill"
                                    style={{ width: '18rem', marginLeft: '5px',
                                        marginBottom: '10px', display: 'inline-block'
                              }}>
                                <Card.Body>
                                    <Card.Title>{value.name}</Card.Title>
                                    <Card.Text>{value.model}</Card.Text>
                                    <Button variant="secondary" href={value.url} target="_blank">More Information</Button>
                                </Card.Body>
                              </Card>
                          )}
                      </div>

                      {/*{mostPilotedStarshipData.results.map((value, index) =>*/}
                      {/*    <p key={index}>{value.name} : {value.model}</p>*/}
                      {/*)}*/}
                  </>
                  : <>
                      <div>
                          <Alert variant="danger" onClose={() => setShowMostPilotedResults(false)} dismissible>
                              <Alert.Heading>No starship found!</Alert.Heading>
                          </Alert>
                      </div>
                    </>
               }
               </Container>
            </Container>


            {/* PERSON */}
            <Container style={{ padding: 20, marginTop: 20 }}>
              <Row>
                  <h4 style={{ textAlign: 'center' }}>Person Searcher</h4>
                  <Form.Group className="mb-3" id="search-most-piloted-form">
                      <Form.Label>Person</Form.Label>
                      <Form.Control type="text" placeholder="Luke Skywalker"
                                     value={personSearchText}
                                     onChange={e => setPersonSearchText(e.target.value)}
                      />
                      <Form.Text className="text-muted">Search allowed to search individually</Form.Text>
                      <br />
                      <br />
                      <Button variant="primary" onClick={e => searchPerson(e)}>Search</Button>{' '}
                      <Button variant="danger" onClick={personResetForm}>Reset</Button>{' '}
                      <Button variant="success" href="http://127.0.0.1:8000/api/v1/person/" target="_blank">Person List</Button>
                      <br />
                  </Form.Group>
              </Row>
              <Container className="container" style={{ display: showPersonResults ? "block" : "none" }}>
                {
                  personData.count > 0 ?
                  <>
                      <div>
                        <Table striped bordered hover>
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Gender</th>
                                    <th>Mass</th>
                                    <th>Height</th>
                                    <th>Birth Year</th>
                                    <th>More Information</th>
                                </tr>
                            </thead>
                            <tbody>
                                {personData.results.map((value, index) =>
                                <tr key={index} className="flex-fill">
                                    <td>{value.name}</td>
                                    <td>{value.gender}</td>
                                    <td>{value.mass}</td>
                                    <td>{value.height}</td>
                                    <td>{value.birth_year}</td>
                                    <td><Button variant="secondary" href={value.url} target="_blank">More Information</Button></td>
                                </tr>
                                )}
                            </tbody>
                            </Table>
                      </div>
                  </>
                  : <>
                      <div>
                          <Alert variant="danger" onClose={() => setShowPersonResults(false)} dismissible>
                              <Alert.Heading>No person found!</Alert.Heading>
                          </Alert>
                      </div>
                    </>
               }
               </Container>
            </Container>


            {/* PLANET */}
            <Container style={{ padding: 20, marginTop: 20 }}>
              <Row>
                  <h4 style={{ textAlign: 'center' }}>Planet Searcher</h4>
                  <Form.Group className="mb-3" id="search-most-piloted-form">
                      <Form.Label>Planet</Form.Label>
                      <Form.Control type="text" placeholder="Tatooine"
                                     value={planetSearchText}
                                     onChange={e => setPlanetSearchText(e.target.value)}
                      />
                      <Form.Text className="text-muted">Search allowed to search individually</Form.Text>
                      <br />
                      <br />
                      <Button variant="primary" onClick={e => searchPlanet(e)}>Search</Button>{' '}
                      <Button variant="danger" onClick={planetResetForm}>Reset</Button>{' '}
                      <Button variant="success" href="http://127.0.0.1:8000/api/v1/planet/" target="_blank">Planet List</Button>
                      <br />
                  </Form.Group>
              </Row>
              <Container className="container" style={{ display: showPlanetResults ? "block" : "none" }}>
                {
                  planetData.count > 0 ?
                  <>
                      <div>
                        <Table striped bordered hover>
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Population</th>
                                    <th>Climate</th>
                                    <th>Terrain</th>
                                    <th>Gravity</th>
                                    <th>Diameter</th>
                                    <th>Rotation Period</th>
                                    <th>Orbital Period</th>
                                    <th>More Information</th>
                                </tr>
                            </thead>
                            <tbody>
                                {planetData.results.map((value, index) =>
                                <tr key={index} className="flex-fill">
                                    <td>{value.name}</td>
                                    <td>{value.population}</td>
                                    <td>{value.climate}</td>
                                    <td>{value.terrain}</td>
                                    <td>{value.gravity}</td>
                                    <td>{value.diameter}</td>
                                    <td>{value.rotation_period}</td>
                                    <td>{value.orbital_period}</td>
                                    <td><Button variant="secondary" href={value.url} target="_blank">More Information</Button></td>
                                </tr>
                                )}
                            </tbody>
                            </Table>
                      </div>
                  </>
                  : <>
                      <div>
                          <Alert variant="danger" onClose={() => setShowPlanetResults(false)} dismissible>
                              <Alert.Heading>No planet found!</Alert.Heading>
                          </Alert>
                      </div>
                    </>
               }
               </Container>
            </Container>
      </div>
  );
}

export default App;
