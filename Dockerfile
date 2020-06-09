FROM debian:buster-20200514
LABEL maintainer="me@yingw787.com"

# Set build arguments.
ARG DEBIAN_FRONTEND=noninteractive

# Get package lists, important for getting 'curl' and such.
RUN apt-get -y update

# Install build dependencies.
RUN apt-get install -y curl

# Install golang.
RUN curl https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz -o /tmp/go1.14.4.linux-amd64.tar.gz
RUN tar -C /usr/local -xvzf /tmp/go1.14.4.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

# Install hugo. It's important to lock down the version of `hugo` since it's
# still a development version with breaking changes.
#
# Use '-L' to follow redirects from GitHub releases.
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v0.62.0/hugo_0.62.0_Linux-64bit.deb -o /tmp/hugo_0.62.0_Linux-64bit.deb
RUN dpkg -i /tmp/hugo_0.62.0_Linux-64bit.deb

# Install awscli.
RUN apt-get install -y python3-dev
RUN apt-get install -y python3-venv
RUN apt-get install -y python3-pip
RUN pip3 install awscli

# Install git.
RUN apt-get install -y git

# Install make.
RUN apt-get install -y build-essential

# Setup workdirectory.
RUN mkdir /app
WORKDIR /app

# Setup permissions.
RUN chown -R 1000:1000 /app

RUN mkdir /.cache
RUN chown -R 1000:1000 /.cache

# Set AWS_PROFILE; this should match AWS_PROFILE in 'Makefile'.
#
# NOTE: For this to work properly with MFA-authenticated IAM users, you must set
# AWS_SESSION_TOKEN env variable; passing inline env variables may not work
# properly with lifting arguments into Docker context.
ENV AWS_PROFILE=tinydevcrm-user

# Run commands.
CMD [ "exec", "\"@\"" ]
