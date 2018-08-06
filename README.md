# docker-nodejs-r

Deploy NodeJS and R inside the same Docker container. NodeJS app will call the R script and, thereof communicating each other in local process stdout/stderr. Additionally, using TinyTeX(LaTeX), Pandoc and Rmarkdown to generate an analysis report PDF through R script. Oh Yeah!

### On local development:

Consider you have installed R and NodeJS in prior. Go ahead, [download and install R](https://cran.ms.unimelb.edu.au) for your local development platform. And `brew install node` or [`nvm install node`](https://github.com/creationix/nvm).

```
git clone https://github.com/victorskl/docker-nodejs-r.git
cd docker-nodejs-r

bash clean.sh
npm install
node spawn.js
```

The `spawn.js` demo to use the NodeJS built-in [`child_process`](https://nodejs.org/api/child_process.html) to call `Rscript` command to run R file directly. To test using the [`r-script`](https://www.npmjs.com/package/r-script) npm package:

```
node example.js
```

Note that you may encounter NodeJS `stderr` on the first (few) runs of `example.js`. This is because the `ex-sync.R` and `ex-async.R` requires some R packages as dependencies. If these dependent R libraries are not present in your R environment, by default, R invoked `install.packages(..)` on demands on the first encountered. When this event happens, the NodeJS script return with `stderr`; which is a bit mis-leading as the R script has no issue; except waiting for the dependencies to be resolved. To work around such issue, you can install the R dependencies eagerly in advanced as example in:

```
Rscript dependencies.R 
```

### On docker deployment:

This will take awhile to build the image as it will pull the R dependencies eagerly in advanced from [`dependencies.R`](dependencies.R) using [`pacman`](https://cran.r-project.org/web/packages/pacman/vignettes/Introduction_to_pacman.html) during building the docker image.

To build docker image:

```
docker build -t dev_tesk .
```

To run the container from the created image:

```
docker run -it --rm -p 8888:8888 --name tesk dev_tesk
```

Open another terminal, go into the container and give a trial run:

```
docker exec -it tesk bash
pwd
ls -l

which Rscript
Rscript hello.R victor

nvm ls

which node
node -v
npm -v

node spawn.js

node example.js
```

To generate [PDF report](report.pdf) using TinyTeX through Pandoc and Rmarkdown

```
Rscript report_gen.R
```

And hit the [http://localhost:8888](http://localhost:8888). This will call the `spawn` process in `server.js` and print the `hello.R` output into `console.log(..)`.

```
open -a Safari http://localhost:8888
```

To stop the container:

```
docker stop tesk
```

The downside is the docker image could be potentially huge as it requires installing R packages as well as NodeJS packages eagerly if the application stack is complex enough. To check the created docker image size:

```
docker images dev_tesk
```

And delete the image and container if desire.

```
docker rm tesk
docker rmi dev_tesk
```