FROM luismayta/ubuntu-emacs:emacs24.5
MAINTAINER Luis Mayta <@slovacus>

# Install.
RUN apt-get update
RUN apt-get install -y editorconfig curl git-core wget zsh ctags

# Set environment variables.
ENV HOME /home

# Define working directory.
WORKDIR /home/.emacs.d

# Define default command.
CMD ["bash"]
