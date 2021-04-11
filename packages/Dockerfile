FROM ubuntu:focal

# Install stupid tzdata that ask things on terminal, curl and gpg
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y tzdata curl gpg && apt-get clean

RUN echo "deb https://dl.bintray.com/crystal/deb all stable" | tee /etc/apt/sources.list.d/crystal.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61

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
