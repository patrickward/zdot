FROM ubuntu:20.04

ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && apt-get upgrade -y && apt-get -y install sudo zsh vim git curl ruby python
RUN chsh -s $(which zsh)
RUN useradd -m -s /usr/bin/zsh -G sudo -p rocketeer rocketeer && echo "rocketeer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER rocketeer
ENV APP_ROOT=/home/rocketeer

WORKDIR $APP_ROOT


