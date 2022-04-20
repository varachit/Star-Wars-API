import React, { useEffect } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import './App.css';

import NavigationBar from './components/NavigationBar';
import FooterBar from './components/FooterBar';
import MostPilotedStarship from './components/MostPilotedStarship';
import Person from './components/Person';
import Planet from './components/Planet';
import Starship from './components/Starship';

function App() {
    useEffect(() => {
        document.title = "Star Wars";
        const faScript = document.createElement("script"); // Font Awesome Script
        faScript.src = "https://kit.fontawesome.com/aca914cd20.js";
        faScript.async = true;
        faScript.defer = true;
        faScript.crossOrigin = "anonymous";
        document.body.appendChild(faScript);
    }, [])

    return (
        <div>
            <NavigationBar />
            <MostPilotedStarship />
            <Person />
            <Planet />
            <Starship />
            <FooterBar />
        </div>
    );
}

export default App;
