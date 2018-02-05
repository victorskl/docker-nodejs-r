#!/usr/bin/env node

const { spawn } = require('child_process');

const child = spawn('Rscript', ['hello.R', 'World!', '--vanilla', '--slave']);

child.stdout.on('data', function (data) {
    console.log(`stdout: ${data}`);
});

child.stderr.on('data', function (data) {
    console.log(`stderr: ${data}`);
});

child.on('close', function (code) {
    console.log(`child process exited with code ${code}`);
});


// --
// https://nodejs.org/api/child_process.html

/*
const ls = spawn('ls', ['-lh', './']);

ls.stdout.on('data', (data) => {
    console.log(`stdout: ${data}`);
});

ls.stderr.on('data', (data) => {
    console.log(`stderr: ${data}`);
});

ls.on('close', (code) => {
    console.log(`child process exited with code ${code}`);
});
*/
