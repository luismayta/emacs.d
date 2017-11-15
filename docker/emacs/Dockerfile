FROM luismayta/ubuntu-emacs:emacs24.5
MAINTAINER Luis Mayta <@slovacus>

LABEL NAME emacs
LABEL VERSION emacs24.5

# Install.
RUN apt-get update -y  \
    apt-get install -y editorconfig curl git-core wget zsh ctags \
    apt-get clean

# Set environment variables.
ENV HOME /home

# Define working directory.
WORKDIR /home/.emacs.d

# Define default command.
CMD ["bash"]
