FROM m0kimura/ubuntu-base

#@module ux-tool ツールのインストール共通基本前処理
#@desc ここで準備したものは、ux-closeで整理されます。
#@desc user変数を省略時に「docker」設定
ARG user=${user:-docker}
RUN echo "### ux-tool ###" \
&&  apt-get update \
&&  apt-get install -y unzip curl
##
#@module ux-mqtt mqtt関連のモジュールをインストールします。
#@desc 新UXシリーズ、１モジュール毎に完結します。
RUN echo "### ux-mqtt ###" \
&&  apt-get update \
&&  apt-get install -y mosquitto mosquitto-clients monit sysv-rc-conf
COPY ./parts/monitrc /etc/monit/monitrc
COPY ./parts/lex /usr/bin/lex
COPY ./parts/Helps /usr/bin/Helps
#@module ux-user 標準ユーザー環境による実行 です。
ENV HOME=/home/${user} USER=${user}
WORKDIR $HOME
USER $USER
RUN echo "### ux-user ###" \
&&  echo "export LANG=ja_JP.UTF-8" >> .bashrc
COPY ./starter.sh /usr/bin/starter.sh
ENTRYPOINT ["starter.sh"]
CMD ["none"]
##
