# sergey_shapovalov_infra

Для логона по ssh через bastion на someinternalhost нужно добавить в .bashrc алиас:

alias some='ssh -i ~/.ssh/appuser -A -J appuser@158.160.39.176 appuser@10.128.0.28'

Тогда можно будет заходить на someinternalhost в одну команду.



Для логона на someinternalhost c помощью команды $ssh someinternalhost нужно внести с файл ~/.ssh/config блок:

Host someinternalhost \
HostName 10.128.0.28 \
User appuser \
IdentityFile ~/.ssh/appuser.pub \
Port 22 \
CheckHostIP no \
Compression yes \
Protocol 2 \
ProxyCommand ssh appuser@158.160.39.176 -W %h:%p 


bastion_IP = 158.160.39.176 \
someinternalhost_IP = 10.128.0.28

Status of last Deployments:<br>
<img src="https://github.com/Otus-DevOps-2022-11/sergey_shapovalov_infra/workflows/Auto Assign/badge.svg?branch=main"><br>
<img src="https://github.com/Otus-DevOps-2022-11/sergey_shapovalov_infra/workflows/run-tests-2022-08/badge.svg?branch=main"><br>
