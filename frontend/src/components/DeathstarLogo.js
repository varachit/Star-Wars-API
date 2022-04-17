import React from "react";
import 'bootstrap/dist/css/bootstrap.min.css';

import "../App.css";

import Deathstar from '../assets/svg/deathstar.svg';

function DeathstarLogo() {
    return (
        <div>
            <div className="col-sm-12 text-center">
                <img src={Deathstar} style={{ height: 175, width: 175, display: "inline-block" }} alt=""/>
            </div>
        </div>
    );
}

export default DeathstarLogo;