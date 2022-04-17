import React, { useState } from "react";
import axios from "axios";
import 'bootstrap/dist/css/bootstrap.min.css';
import {Alert, Button, Container, Form, Row, Table} from "react-bootstrap";

import "../App.css";

import PlanetIcon from '../assets/svg/planet.svg';

function Planet() {
    const [planetData, setPlanetData] = useState({});
    const [planetSearchText, setPlanetSearchText] = useState("");
    const [showPlanetResults, setShowPlanetResults] = useState(false);
    const PlanetListLocator = `${process.env.REACT_APP_API_DOMAIN}/api/v1/planet/`;

    function searchPlanet(event) {
        setShowPlanetResults(true)
        if(planetSearchText === "") {
            return;
        }
        const endpoint = `${process.env.REACT_APP_API_DOMAIN}/api/v1/planet/search?name=${planetSearchText}`;
        axios.get(endpoint).then(function (response) {
            setPlanetData(response.data);
        }).catch(function (error) {
            console.log(error);
        });
    }

    function planetResetForm() {
        setPlanetData({});
        setPlanetSearchText('');
        setShowPlanetResults(false);
    }

    return (
        <div>
            <Container style={{ padding: 20, marginTop: 20 }}>
                <Row>
                    <h4 style={{ textAlign: 'left' }}>
                        <img src={PlanetIcon} style={{ height: 25, width: 25 }} alt=""/>{' '}
                        Planet Searcher
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
                        <Button variant="success" href={PlanetListLocator} target="_blank">Planet List</Button>
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
                                                <td>
                                                    <Button variant="secondary" href={value.url} target="_blank">More Information</Button>
                                                </td>
                                            </tr>
                                        )}
                                    </tbody>
                                </Table>
                            </div>
                        </>
                        :
                        <>
                            <div>
                                <Alert variant="danger" onClose={() => setShowPlanetResults(false)} dismissible>
                                    No planet found!
                                </Alert>
                            </div>
                        </>
                    }
                </Container>
            </Container>
        </div>
    );
}

export default Planet;