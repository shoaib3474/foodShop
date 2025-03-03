const express = require('express');
const cors = require('cors');
const app = express();
const port = 3006;

app.use(cors());

console.log('Starting server...');

app.get('/', (req, res) => {
    console.log('Received a request');
    res.send({
        message: 'This is Message From Node js Server',
        status: 200,
        data: {
            name: 'john Bany Ga don',
            age: 25,
            email: 'example@gmail.com'
        }
    });
});

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});

console.log('End of script');