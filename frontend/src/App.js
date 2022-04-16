import React, {useEffect, useState} from 'react';
import axios from "axios";
import 'bootstrap/dist/css/bootstrap.min.css';
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Alert, Badge, Button, Card, Col, Container,
    Form, Modal, Nav, Navbar, Row, Table } from 'react-bootstrap'

import './App.css';

import Starship from './assets/svg/starship.svg';
import Planet from './assets/svg/planet.svg';
import Person from './assets/svg/person.svg';


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

  const [starshipSearchText, setStarshipSearchText] = useState("");
  const [showStarshipResults, setShowStarshipResults] = useState(false);
  const [starshipData, setStarshipData] = useState({});

  const [modalShow, setModalShow] = useState(false);
  const handleClose = () => setModalShow(false);
  const handleShow = () => setModalShow(true);


  useEffect(() => {
      document.title = "Star Wars";
      const fontAwesomeScript = document.createElement("script")
      fontAwesomeScript.src = "https://kit.fontawesome.com/aca914cd20.js"
      fontAwesomeScript.async = true
      fontAwesomeScript.crossOrigin = "anonymous"

      document.body.appendChild(fontAwesomeScript)
      return () => {
        document.body.removeChild(fontAwesomeScript)
    }

  }, [])

  function searchMostPilotedStarship(event) {
    const endpoint = "http://127.0.0.1:8000/api/v1/most_piloted?planet=" + mostPilotedSearchText;
    axios.get(endpoint).then(function (response) {
       setMostPilotedStarshipData(response.data);
    }).catch(function (error) {
       console.log(error)
    });
    setShowMostPilotedResults(true);
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
  }

function searchStarship(event) {
   setShowStarshipResults(true)
   if(starshipSearchText === "") {
       return;
   }
   const endpoint = "http://127.0.0.1:8000/api/v1/starship/search?name=" + starshipSearchText;
   axios.get(endpoint).then(function (response) {
   setStarshipData(response.data);
   }).catch(function (error) {
       console.log(error)
   });
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

  function starshipResetForm() {
      setStarshipSearchText('')
      setShowStarshipResults(false)
      setStarshipData({})
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
                        <Nav.Link href="https://github.com/z3r0k0r3/Star-Wars-API/" target="_blank">Documentation</Nav.Link>
                        <Nav.Link href="http://127.0.0.1:8000/admin">Django Administration</Nav.Link>
                        <Nav.Link onClick={handleShow}>About</Nav.Link>
                    </Nav>
                </Navbar.Collapse>
            </Container>
          </Navbar>

          {/* ABOUT MODAL */}
          <Modal
            show={modalShow}
            onHide={handleClose}
            backdrop="static"
            keyboard={false}
          >
            <Modal.Header closeButton>
              <Modal.Title>About me</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Container>
                    <Row style={{ justifyContent: 'center' }}>
                        <Col sm={5} style={{ display: 'flex', alignItems: 'center', justifyContent: 'right' }}>
                            <div className="about_picture"></div>
                        </Col>
                        <Col style={{ display: 'flex', alignItems: 'center', justifyContent: 'left' }}>
                            <Row>
                                <h4>Varachit Wirunpat</h4>
                                <h6><FontAwesomeIcon icon="fa-solid fa-location-dot" /> Nakhon Pathom, Thailand</h6>
                                <h6><FontAwesomeIcon icon="fa-solid fa-envelope" /> doctors.csgo@gmail.com</h6>
                                <h6>
                                    <FontAwesomeIcon icon="fa-brands fa-linkedin fa-xl" />{' '}
                                    <a style={{ textDecoration: "none", color: "#000000" }} href="https://www.linkedin.com/in/varachit/">Varachit Wirunpat</a>
                                </h6>
                                <h6>
                                    <FontAwesomeIcon icon="fa-brands fa-github" />{' '}
                                    <a style={{ textDecoration: "none", color: "#000000" }} href="https://github.com/z3r0k0r3/">Varachit W.</a>
                                </h6>
                                <h6>
                                    <FontAwesomeIcon icon="fa-solid fa-phone" /> (66) 0 83004 3786
                                </h6>
                            </Row>
                        </Col>
                    </Row>


                </Container>


            </Modal.Body>
            <Modal.Footer>
              <Button variant="dark" onClick={handleClose}>
                Close
              </Button>
            </Modal.Footer>
          </Modal>

            <Container style={{ padding: 20, marginTop: 20 }}>
              <Row>
                  <div>
                      <h4 className="position-relative" style={{ textAlign: 'center' }}>
                          Most Piloted Starship Searcher <Badge bg="dark">New</Badge>{' '}
                      </h4>
                      <h6 className="text-muted" style={{ textAlign: 'center' }}>Locates the most piloted starship across
                          all of the residents from target planets.</h6>
                  </div>
                  <Form.Group className="mb-3">
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
                      <Alert variant="danger" onClose={() => setShowMostPilotedResults(false)} dismissible>
                          No starship found!
                      </Alert>
                    </>
               }
               </Container>
            </Container>


            {/* PERSON */}
            <Container style={{ padding: 20, marginTop: 20 }}>
              <Row>
                  <h4 style={{ textAlign: 'left' }}>
                      <img src={Person} style={{ height: 25, width: 25 }} alt=""/> Person Searcher
                  </h4>
                  <Form.Group className="mb-3">
                      <Form.Label>Person Name</Form.Label>
                      <Form.Control type="text" placeholder="Luke Skywalker"
                                     value={personSearchText}
                                     onChange={e => setPersonSearchText(e.target.value)}
                      />
                      <Form.Text className="text-muted">Allowed to search individually</Form.Text>
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
                                <tr style={{ textAlign: "center", verticalAlign: "middle"}}>
                                    <th>Name</th>
                                    <th>Gender</th>
                                    <th>Mass</th>
                                    <th>Height</th>
                                    <th>Birth Year</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                {personData.results.map((value, index) =>
                                <tr key={index} className="flex-fill" style={{ textAlign: "center", verticalAlign: "middle" }}>
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
                              No person found!
                          </Alert>
                      </div>
                    </>
               }
               </Container>
            </Container>


            {/* PLANET */}
            <Container style={{ padding: 20, marginTop: 20 }}>
              <Row>
                  <h4 style={{ textAlign: 'left' }}>
                      <img src={Planet} style={{ height: 25, width: 25 }} alt=""/> Planet Searcher
                  </h4>
                  <Form.Group className="mb-3">
                      <Form.Label>Planet Name</Form.Label>
                      <Form.Control type="text" placeholder="Tatooine"
                                     value={planetSearchText}
                                     onChange={e => setPlanetSearchText(e.target.value)}
                      />
                      <Form.Text className="text-muted">Allowed to search individually</Form.Text>
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
                                <tr style={{ textAlign: "center", verticalAlign: "middle"}}>
                                    <th>Name</th>
                                    <th>Population</th>
                                    <th>Climate</th>
                                    <th>Terrain</th>
                                    <th>Gravity</th>
                                    <th>Diameter</th>
                                    <th>Rotation Period</th>
                                    <th>Orbital Period</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                {planetData.results.map((value, index) =>
                                <tr key={index} className="flex-fill" style={{ textAlign: "center", verticalAlign: "middle" }}>
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
                              No planet found!
                          </Alert>
                      </div>
                    </>
               }
               </Container>
            </Container>


          {/* STARSHIP */}
            <Container style={{ padding: 20, marginTop: 20 }}>
              <Row>
                  <h4 style={{ textAlign: 'left' }}>
                    <img src={Starship} style={{ height: 30, width: 30 }} alt=""/> Starship Searcher
                  </h4>
                  <Form.Group className="mb-3">
                      <Form.Label>Starship Name</Form.Label>
                      <Form.Control type="text" placeholder="Millennium Falcon"
                                     value={starshipSearchText}
                                     onChange={e => setStarshipSearchText(e.target.value)}
                      />
                      <Form.Text className="text-muted">Allowed to search individually</Form.Text>
                      <br />
                      <br />
                      <Button variant="primary" onClick={e => searchStarship(e)}>Search</Button>{' '}
                      <Button variant="danger" onClick={starshipResetForm}>Reset</Button>{' '}
                      <Button variant="success" href="http://127.0.0.1:8000/api/v1/starship/" target="_blank">Starship List</Button>
                      <br />
                  </Form.Group>
              </Row>
              <Container className="container" style={{ display: showStarshipResults ? "block" : "none" }}>
                {
                  starshipData.count > 0 ?
                  <>
                      <div>
                        <Table striped bordered hover>
                            <thead>
                                <tr style={{ textAlign: "center", verticalAlign: "middle"}}>
                                    <th>Name</th>
                                    <th>Model</th>
                                    <th>Class</th>
                                    <th>Manufacturer</th>
                                    <th>Atmosphering Speed</th>
                                    <th>Hyperdrive Rating</th>
                                    <th>Cargo Capacity</th>
                                    <th>Length</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                {starshipData.results.map((value, index) =>
                                <tr key={index} className="flex-fill" style={{ textAlign: "center", verticalAlign: "middle" }}>
                                    <td>{value.name}</td>
                                    <td>{value.model}</td>
                                    <td>{value.starship_class}</td>
                                    <td>{value.manufacturer}</td>
                                    <td>{value.max_atmosphering_speed}</td>
                                    <td>{value.hyperdrive_rating}</td>
                                    <td>{value.cargo_capacity}</td>
                                    <td>{value.length}</td>
                                    <td><Button variant="secondary" href={value.url} target="_blank">More Information</Button></td>
                                </tr>
                                )}
                            </tbody>
                            </Table>
                      </div>
                  </>
                  : <>
                      <div>
                          <Alert variant="danger" onClose={() => setShowStarshipResults(false)} dismissible>
                              No starship found!
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
