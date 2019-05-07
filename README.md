# docker-why3
Docker image for the why3 system with some preinstalled provers with some additional script magic to close the gap to the host system.

## Preinstalled provers:

* Alt-Ergo 2.2.0 (capped by why3 1.2.0)
* Z3 4.8.4
* CVC4 1.6 (capped by why3 1.2.0)

# Installation

`docker build -t why3 https://github.com/Tillerino/docker-why3.git`

# Running the docker image

The easiest way to run the why3 docker image is to use the bundled shell script:

`mkdir -p $HOME/bin && curl https://raw.githubusercontent.com/Tillerino/docker-why3/master/why3 > $HOME/bin/why3 && chmod u+x $HOME/bin/why3`

Restart your terminal session and verify that you can use why3:

`why3 --version`

## Running the IDE

The bundled shell script connects to an X11 server. The address of the server is hardcoded into the script itself. Adjust to match your setup.

Open the IDE: `why3 ide .`
Open a file in the IDE (recommended): `why3 ide <file>`

# Alternatives

mrsmkl/docker-why3: [dockerhub](https://hub.docker.com/r/mrsmkl/docker-why3/) | [github](https://github.com/mrsmkl/docker-why3)

peterzel/why3: [dockerhub](https://hub.docker.com/r/peterzel/why3) | [github](https://github.com/peterzeller/docker-why3)
