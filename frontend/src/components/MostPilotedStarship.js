import React, { useState } from "react";
import axios from "axios";
import 'bootstrap/dist/css/bootstrap.min.css';
import { Alert, Badge, Button, Card, Container, Form, Row } from "react-bootstrap";

import "../App.css";

import DeathstarLogo from "./DeathstarLogo";

function MostPilotedStarship() {
    const [mostPilotedStarshipData, setMostPilotedStarshipData] = useState({});
    const [mostPilotedSearchText, setMostPilotedSearchText] = useState("");
    const [showMostPilotedResults, setShowMostPilotedResults] = useState(false);

    function searchMostPilotedStarship(event) {
        setShowMostPilotedResults(true);
        if(mostPilotedSearchText === "") {
            return;
        }
        const endpoint = `${process.env.REACT_APP_API_DOMAIN}/api/v1/most_piloted?planet=${mostPilotedSearchText}`;
        axios.get(endpoint).then(function (response) {
            setMostPilotedStarshipData(response.data);
        }).catch(function (error) {
            console.log(error);
        });
    }

    function mostPilotedResetForm() {
        setMostPilotedStarshipData({});
        setMostPilotedSearchText('');
        setShowMostPilotedResults(false);
    }

    return (
        <div>
            <Container style={{ padding: 20, marginTop: 20 }}>
                <Row>
                    <DeathstarLogo />
                    <div>
                        <br />
                        <h4 className="position-relative" style={{ textAlign: 'center' }}>
                            Most Piloted Starship Searcher <Badge bg="dark">New</Badge>
                        </h4>
                        <h6 className="text-muted" style={{ textAlign: 'center' }}>
                            Locates the most piloted starship across all of the residents from target planets.
                        </h6>
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
                        <Button variant="danger" onClick={mostPilotedResetForm}>Reset</Button>
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
                                            <Button
                                                variant="secondary" href={value.url}
                                                target="_blank">More Information
                                            </Button>
                                        </Card.Body>
                                    </Card>
                                )}
                            </div>
                        </>
                        :
                        <>
                            <div>
                                <Alert variant="danger" onClose={() => setShowMostPilotedResults(false)} dismissible>
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

export default MostPilotedStarship;