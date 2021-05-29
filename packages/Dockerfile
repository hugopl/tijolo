FROM ubuntu:focal

# Install stupid tzdata that ask things on terminal, curl and gpg
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y tzdata curl gpg && apt-get clean


RUN echo "deb http://download.opensuse.org/repositories/devel:/languages:/crystal/xUbuntu_21.04/ /" | \
  tee /etc/apt/sources.list.d/crystal.list

# Add signing key
RUN curl -fsSL https://download.opensuse.org/repositories/devel:languages:crystal/xUbuntu_21.04/Release.key | \
  gpg --dearmor | \
  tee /etc/apt/trusted.gpg.d/crystal.gpg > /dev/null

# Setup build environment
RUN apt-get update \
  && apt-get install -y \
  git \
  make \
  crystal \
  libeditorconfig-dev \
  libgirepository1.0-dev \
  libgit2-dev \
  libgtksourceview-4-dev \
  libvte-2.91-dev \
  libyaml-dev \
  lintian \
  && apt-get clean
