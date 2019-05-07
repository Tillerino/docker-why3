FROM ocaml/opam2:ubuntu-18.04

RUN sudo apt -y install pkg-config libgtksourceview2.0-dev m4 libgmp-dev

# why3 1.2.0 can only handle Alt-Ergo <= 2.2.0
RUN opam install -y alt-ergo.2.2.0 why3-ide.1.2.0

RUN sudo apt -y install wget

RUN wget -nv https://github.com/Z3Prover/z3/releases/download/z3-4.8.4/z3-4.8.4.d6df51951f4c-x64-ubuntu-16.04.zip \
   && unzip z3-4.8.4.d6df51951f4c-x64-ubuntu-16.04.zip \
   && sudo cp z3-4.8.4.d6df51951f4c-x64-ubuntu-16.04/bin/z3 /usr/local/bin \
   && sudo chmod +x /usr/local/bin/z3 \
   && rm -r z3-4.8.4.d6df51951f4c-x64-ubuntu-16.04* \
   && z3 -version

# why3 1.2.0 can only handle CVC4 <= 1.6
RUN wget -nv https://cvc4.cs.stanford.edu/downloads/builds/x86_64-linux-opt/cvc4-1.6-x86_64-linux-opt \
   && sudo mv cvc4-1.6-x86_64-linux-opt /usr/local/bin/cvc4 \
   && sudo chmod +x /usr/local/bin/cvc4 \
   && cvc4 --version

RUN eval $(opam env) && why3 config --detect

ADD startup.sh /bin/startup.sh

ENTRYPOINT ["/bin/sh", "/bin/startup.sh"]

CMD [ ]
