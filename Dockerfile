FROM ocaml/opam2:ubuntu-18.04

RUN sudo apt -y install pkg-config libgtksourceview2.0-dev m4 libgmp-dev

RUN opam install -y alt-ergo.2.2.0 coq.8.5.0 why3-ide.1.2.0

RUN eval $(opam env) && why3 config --detect

ADD startup.sh /bin/startup.sh

ENTRYPOINT ["/bin/sh", "/bin/startup.sh"]

CMD ["ide", "."]

