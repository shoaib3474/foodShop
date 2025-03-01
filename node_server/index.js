const express = require('express');
const app = express();
const port = 3006; // Change the port number

console.log('Starting server...');

app.get('/', (req, res) => {
    console.log('Received a request');
    res.send('Welcome to the Node js Server.❤❤❤❤');
    res.send('This is Message From Node js Server');
});

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});

console.log('End of script');