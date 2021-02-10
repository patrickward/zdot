FROM ubuntu:20.04
ENV APP_ROOT=/root
ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && apt-get upgrade -y && apt-get -y install zsh vim git curl ruby python
RUN chsh -s $(which zsh)

WORKDIR $APP_ROOT


