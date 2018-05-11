#!/bin/bash
cmd=$1
##
  if [[ -e .mosquitto.conf ]]; then
    sudo cp .mosquitto.conf /etc/mosquitto/mosquitto.conf
  fi
  if [[ ${cmd} = 'auto' ]]; then
    sudo /etc/init.d/mosquitto start
    echo "mosquitto start"
  else
    echo "mosquittoを自動起動するときは「automos」と指定します。"
    echo "ユーザールートに.mosquitto.confファイルを作成するとその設定を使用します。"
    Helps lex
  fi
  /bin/bash
##
