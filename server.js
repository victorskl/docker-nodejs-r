var http = require("http");
const { spawn } = require('child_process');

http.createServer(function(request, response) {
    // console.log(request);

    const child = spawn('Rscript', ['hello.R', 'World', '--vanilla', '--slave']);

    child.stdout.on('data', function (data) {
        console.log(`stdout: ${data}`);
    });

    child.stderr.on('data', function (data) {
        console.log(`stderr: ${data}`);
    });

    child.on('close', function (code) {
        console.log(`child process exited with code ${code}`);
    });

    response.writeHead(200, {"Content-Type": "text/plain"});
    response.write("Check the message from the hello.R script in the console log...");
    response.end();

}).listen(8888);