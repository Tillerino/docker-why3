FROM ocaml/opam2:ubuntu-18.04

RUN sudo apt -y install pkg-config libgtksourceview2.0-dev m4 libgmp-dev

RUN opam install -y alt-ergo.2.2.0 why3-ide.1.2.0

RUN sudo apt -y install wget

RUN wget https://github.com/Z3Prover/z3/releases/download/z3-4.8.4/z3-4.8.4.d6df51951f4c-x64-ubuntu-16.04.zip \
   && unzip z3-4.8.4.d6df51951f4c-x64-ubuntu-16.04.zip \
   && sudo cp z3-4.8.4.d6df51951f4c-x64-ubuntu-16.04/bin/z3 /usr/local/bin \
   && sudo chmod +x /usr/local/bin/z3 \
   && z3 -version

RUN eval $(opam env) && why3 config --detect

ADD startup.sh /bin/startup.sh

ENTRYPOINT ["/bin/sh", "/bin/startup.sh"]

CMD ["ide", "."]

