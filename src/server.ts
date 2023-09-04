import express from "express";
import cors from "cors";
import { router } from "./routers/router"
import { exec } from 'child_process'

const command = 'docker-compose up -d';
const child = exec(command);
const app = express();
const port = process.env.PORT || 5080;

app.use(express.urlencoded({
    extended: true,
})
);
app.use(express.json());
app.use(cors());
app.use(router);


app.listen(port, () => console.log(`Aplicação rodando na porta ${port}!`));