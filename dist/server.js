"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const router_1 = require("./routers/router");
const child_process_1 = require("child_process");
const command = 'npx prisma migrate deploy';
const child = (0, child_process_1.exec)(command);
child.stdout.on('data', (data) => {
    console.log(`stdout: ${data}`);
});
child.stderr.on('data', (data) => {
    console.error(`stderr: ${data}`);
});
child.on('close', (code) => {
    console.log(`Processo filho encerrado com código ${code}`);
});
const app = (0, express_1.default)();
const port = process.env.PORT || 5080;
app.use(express_1.default.urlencoded({
    extended: true,
}));
app.use(express_1.default.json());
app.use((0, cors_1.default)());
app.use(router_1.router);
app.listen(port, () => console.log(`Aplicação rodando na porta ${port}!`));
