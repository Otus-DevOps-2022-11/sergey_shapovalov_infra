# sergey_shapovalov_infra
## HW-07 (Packer)

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

bastion_IP = 158.160.39.176 
someinternalhost_IP = 10.128.0.28
=======
Был создан сервисный аккаунт в Yandex Cloud.
Написан и валидирован packer file ubuntu16.json
Создан image из ubuntu16.json
Создана VM в Yandex Cloud из полученного образа, запушено приложение в ручном режиме после авторизации по ssh.
Вынесена часть параметров из packer файла в шаблон, в том числе доп параметр.
Настроен packer файл immutable.json с полной настройкой сервера и запуска сервиса puma.service через systemctl юнит. Написан unit systemd.
