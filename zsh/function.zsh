#!/bin/zsh

function take {
  mkdir -p $1
  cd $1
}

function note {
  nvim $HOME/paranote/
}
