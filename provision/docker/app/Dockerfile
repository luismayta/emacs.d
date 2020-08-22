FROM luismayta/ubuntu-emacs:emacs24.5

LABEL NAME emacs
LABEL VERSION emacs24.5

# Install.
RUN apt-get update -y  \
    && apt-get install -y --no-install-recommends build-essential editorconfig curl git-core wget zsh ctags \
# clean
  && apt-get clean autoremove purge \
  && rm -rf /var/lib/apt/lists/*

# Set environment variables.
ENV HOME /home

# Define working directory.
WORKDIR /home/.emacs.d

# Define default command.
CMD ["bash"]
