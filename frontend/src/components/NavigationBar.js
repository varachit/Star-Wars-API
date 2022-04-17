import React, { useState } from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import { Button, Col, Container, Modal, Nav, Navbar, Row } from "react-bootstrap";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import "../App.css";

function NavigationBar() {
    const [modalShow, setModalShow] = useState(false);
    const handleClose = () => setModalShow(false);
    const handleShow = () => setModalShow(true);
    const API_ADMINISTRATION_SITE = `${process.env.REACT_APP_API_DOMAIN}/admin`;

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
                            <Nav.Link href={API_ADMINISTRATION_SITE}>Django Administration</Nav.Link>
                            <Nav.Link onClick={handleShow}>About</Nav.Link>
                        </Nav>
                    </Navbar.Collapse>
                </Container>
            </Navbar>

            {/* About Modal */}
            <Modal show={modalShow} onHide={handleClose} backdrop="static" keyboard={false}>
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
                                    <h6><FontAwesomeIcon icon="fa-solid fa-location-dot" />{' '}Nakhon Pathom, Thailand</h6>
                                    <h6><FontAwesomeIcon icon="fa-solid fa-envelope" />{' '}doctors.csgo@gmail.com</h6>
                                    <h6>
                                        <FontAwesomeIcon icon="fa-brands fa-linkedin fa-xl" />{' '}
                                        <a style={{ textDecoration: "none", color: "#000000" }} href="https://www.linkedin.com/in/varachit/">Varachit Wirunpat</a>
                                    </h6>
                                    <h6>
                                        <FontAwesomeIcon icon="fa-brands fa-github" />{' '}
                                        <a style={{ textDecoration: "none", color: "#000000" }} href="https://github.com/z3r0k0r3/">Varachit W.</a>
                                    </h6>
                                    <h6>
                                        <FontAwesomeIcon icon="fa-solid fa-phone" />{' '}(66) 0 83004 3786
                                    </h6>
                                </Row>
                            </Col>
                        </Row>
                    </Container>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="dark" onClick={handleClose}>Close</Button>
                </Modal.Footer>
            </Modal>
        </div>
    );
}

export default NavigationBar;
