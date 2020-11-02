FROM ubuntu:focal

# Install stupid tzdata that ask things on terminal, curl and gpg
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y tzdata curl gpg && apt-get clean

# Add Crystal repository
RUN curl -L https://keybase.io/crystal/pgp_keys.asc | apt-key add -
RUN echo "deb https://dist.crystal-lang.org/apt crystal main" > /etc/apt/sources.list.d/crystal.list

# Setup build environment
RUN apt-get update \
  && apt-get install -y \
  git \
  make \
  crystal \
  libgirepository1.0-dev \
  libgit2-dev \
  libgtksourceview-4-dev \
  libvte-2.91-dev \
  libyaml-dev \
  lintian \
  && apt-get clean
