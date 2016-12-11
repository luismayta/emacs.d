FROM ubuntu:14.04
MAINTAINER Luis Mayta <@slovacus>

# Install.
RUN apt-get update
RUN apt-get install -y bash editorconfig curl git-core wget zsh ctags
RUN apt-get install -y emacs

# Set environment variables.
ENV HOME /home

# Define working directory.
WORKDIR /home/.emacs.d

# Define default command.
CMD ["bash"]
