#!/bin/bash
#@module ubモードでの標準前処理
#@desc プロジェクトの取り出し、＄DIRの省略時設定
cmd=$1
project=${PWD##*/}
null=
if [[ $DIR = "$null" ]]; then
  DIR=$HOME
fi
echo "### project: ${project}, DIR: ${DIR}, cmd: ${cmd} ###"
##
#@module run-fx ドッカー管理コマンド対応
#@param 1st {String} dockerコマンド push/stop/login/export/save
#@require pp-*
  if [[ ${cmd} = "push" ]]; then
    dex push
    exit
  elif [[ ${cmd} = "start" ]]; then
    docker start fx-${project}
    exit
  elif [[ ${cmd} = "begin" ]]; then
    docker start -i fx-${project}
    exit
  elif [[ ${cmd} = "stop" ]]; then
    docker stop fx-${project}
    exit
  elif [[ ${cmd} = "login" ]]; then
    docker exec -it fx-${project} /bin/bash
    exit
  elif [[ ${cmd} = "export" ]]; then
    echo Export Container fx-${project} to local/fx-${project}.tar
    docker export fx-${project} -o ../local/fx-${project}.tar
    exit
  elif [[ ${cmd} = "save" ]]; then
    echo Save Image ${project} to local/${project}.tar
    docker save ${project} -o ../local/${project}.tar
    exit
  fi
##
#@module run-port-home ｆｘコンテナ、親HOMEを共有するdocker起動 Port指定
#@require pp-*
  docker rm -f fx-${project}
  docker run -it -h ${project} --name fx-${project} \
    -p 1883:1883 \
    -v $HOME:/home/docker \
    -v /mnt:/mnt \
    m0kimura/${project} $1 $2 $3
##

