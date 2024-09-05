const express = require('express');
const morgan = require('morgan');
const path = require('path');
const cors = require('cors');

const app = express();
const port = process.env.PORT || 3001;

app.use(morgan('tiny'));

app.use(cors());

app.use(express.static('/website'));

app.use((req, res) => {
	res.status(404).sendFile('/website/index.html');
});

app.listen(port, () => {
	console.log(`Server running on port ${port}`);
});
