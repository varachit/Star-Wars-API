import React, { useState } from "react";
import axios from "axios";
import 'bootstrap/dist/css/bootstrap.min.css';
import { Alert, Button, Container, Form, Row, Table } from "react-bootstrap";

import "../App.css";

import StarshipIcon from '../assets/svg/starship.svg';

function Starship() {
    const [starshipData, setStarshipData] = useState({});
    const [starshipSearchText, setStarshipSearchText] = useState("");
    const [showStarshipResults, setShowStarshipResults] = useState(false);
    const StarshipListLocator = `${process.env.REACT_APP_API_DOMAIN}/api/v1/starship/`;

    function searchStarship() {
        setShowStarshipResults(true)
        if(starshipSearchText === "") {
            return;
        }
        const endpoint = `${process.env.REACT_APP_API_DOMAIN}/api/v1/starship/search?name=${starshipSearchText}`;
        axios.get(endpoint).then(function (response) {
            setStarshipData(response.data);
        }).catch(function (error) {
            console.log(error);
        });
    }

    function starshipResetForm() {
        setStarshipData({});
        setStarshipSearchText('');
        setShowStarshipResults(false);
    }

    function renderResult() {
        return (
            <div className="table-responsive">
                <Table striped bordered hover className="table">
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
                                <td>
                                    <Button variant="secondary" href={value.url} target="_blank">More Information</Button>
                                </td>
                            </tr>
                        )}
                    </tbody>
                </Table>
            </div>
        );
    }

    function renderNotFound() {
        return (
            <div>
                <Alert variant="danger" onClose={() => setShowStarshipResults(false)} dismissible>
                    No starship found!
                </Alert>
            </div>
        );
    }

    return (
        <div>
            <Container style={{ padding: 20, marginTop: 20 }}>
                <Row>
                    <h4 style={{ textAlign: 'left' }}>
                        <img src={StarshipIcon} style={{ height: 30, width: 30 }} alt=""/>{' '}
                        Starship Searcher
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
                        <Button variant="success" href={StarshipListLocator} target="_blank">Starship List</Button>
                        <br />
                    </Form.Group>
                </Row>

                <Container className="container" style={{ display: showStarshipResults ? "block" : "none" }}>
                    { starshipData.count > 0 ? renderResult() : renderNotFound() }
                </Container>
            </Container>
        </div>
    );
}

export default Starship;