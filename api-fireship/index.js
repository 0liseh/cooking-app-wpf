const express = require('express');
const app = express();
const PORT = 8080;

app.listen(PORT, console.log(`The API is alive on http://localhost:8080`));

//middleware that runs in-between the request being sent and
//the callback function getting the request
app.use( express.json() );

app.get('/tshirt', (req, res)=>{
    res.status(200).send({
        tshirt: '👕',
        size: 'large'
    })
});

app.post('/tshirt/:id', (req, res)=>{

    const { id } = req.params;
    const { logo } = req.body;

    if(!logo){
        res.status(418).send({message: "Logo needed"});
    }

    res.status(200).send({
        tshirt: `👕 with your ${logo} and ID of ${id}`,
    })
});
