import React, { useState } from 'react';
import axios from 'axios';
import 'bootstrap/dist/css/bootstrap.min.css';
import {Alert, Button, Container, Form, Row, Spinner, Table} from 'react-bootstrap';

import '../App.css';

import PersonIcon from '../assets/svg/person.svg';

function Person() {
    const [isLoading, setLoading] = useState(true);
    const [personData, setPersonData] = useState({});
    const [personSearchText, setPersonSearchText] = useState("");
    const [showPersonResults, setShowPersonResults] = useState(false);
    const PersonListLocator = `${process.env.REACT_APP_API_DOMAIN}/api/v1/person/`;

    function searchPerson() {
        clearPreviousRender()
        setShowPersonResults(true);
        if(personSearchText === "") {
            setLoading(false);
            return;
        }
        const endpoint = `${process.env.REACT_APP_API_DOMAIN}/api/v1/person/search?name=${personSearchText}`;
        axios.get(endpoint).then(function (response) {
            setPersonData(response.data);
            setLoading(false);
        }).catch(function (error) {
            console.log(error);
        });
    }

    function clearPreviousRender() {
        setPersonData({});
        setShowPersonResults(false);
        setLoading(true);
    }

    function personResetForm() {
        setPersonData({});
        setPersonSearchText('');
        setShowPersonResults(false);
        setLoading(true);
    }

    function renderLoading() {
        return (
            <div style={{ marginTop: '15px', verticalAlign: 'middle' }}>
                <div>
                    <Spinner animation="grow" />
                </div>
            </div>
        )
    }

    function renderResult() {
        return (
            <div className="table-responsive">
                <Table striped bordered hover className="table">
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
                <Alert variant="danger" onClose={() => setShowPersonResults(false)} dismissible>
                    No person found!
                </Alert>
            </div>
        )
    }

    return (
        <div>
            <Container style={{ padding: 20, marginTop: 20 }}>
                <Row>
                    <h4 style={{ textAlign: 'left' }}>
                        <img src={PersonIcon} style={{ height: 25, width: 25 }} alt=""/>{' '}
                        Person Searcher
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
                        <Button variant="success" href={PersonListLocator} target="_blank">Person List</Button>
                        <br />
                    </Form.Group>
                </Row>

                <Container className="container" style={{ display: showPersonResults ? "block" : "none" }}>
                    {
                        isLoading ? renderLoading() : personData.count > 0 ? renderResult() : renderNotFound()
                    }
                </Container>
            </Container>
        </div>
    );
}

export default Person;