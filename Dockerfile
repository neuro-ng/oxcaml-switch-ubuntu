# Use Ubuntu-based opam image as base
FROM ghcr.io/neuro-ng/opam-ubuntu:20250626

# Switch to ocaml-user
USER ocaml-user
WORKDIR /home/ocaml-user

# Update opam and create OxCaml switch with ox repository
RUN opam update --all && \
    opam switch create 5.2.0+ox --repos ox=git+https://github.com/oxcaml/opam-repository.git,default --debug

# Set default working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"] 