import React, { useEffect, useState } from 'react';
import io from 'socket.io-client';
import './App.css';
import Sala from './components/Sala';
import Cozinha from './components/Cozinha';

const App: React.FC = () => {
  
  return (
    <body>
      <div className='casa'>
        <h1>Casa Inteligente</h1>
        <Sala/>
        <Cozinha/>
      </div>
    </body>
  );
}

export default App;
