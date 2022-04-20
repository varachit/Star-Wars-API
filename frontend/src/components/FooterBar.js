import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';

import '../App.css';

function DeathstarLogo() {
    return (
        <footer className="text-center text-white" style={{ marginTop: '75px', backgroundColor: '#f1f1f1' }}>
            <div className="container pt-3">
                <section className="mb-2">
                    <a className="btn btn-link btn-floating btn-lg text-dark m-1" target="_blank" rel="noreferrer"
                        href="https://www.linkedin.com/in/varachit/" role="button" data-mdb-ripple-color="dark">
                        <i className="fab fa-linkedin"></i>
                    </a>

                    <a className="btn btn-link btn-floating btn-lg text-dark m-1" target="_blank" rel="noreferrer"
                        href="https://github.com/z3r0k0r3" role="button" data-mdb-ripple-color="dark">
                        <i className="fab fa-github"></i>
                    </a>
                </section>
            </div>

            <div className="text-center text-dark p-2" style={{ backgroundColor: 'rgba(0, 0, 0, 0.2)' }}>
                © 2022 Varachit Wirunpat
            </div>
        </footer>
    );
}

export default DeathstarLogo;