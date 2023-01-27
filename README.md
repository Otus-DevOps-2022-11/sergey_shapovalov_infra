# sergey_shapovalov_infra
## HW-07 (Packer)

Был создан сервисный аккаунт в Yandex Cloud.
Написан и валидирован packer file ubuntu16.json
Создан image из ubuntu16.json
Создана VM в Yandex Cloud из полученного образа, запушено приложение в ручном режиме после авторизации по ssh.
Вынесена часть параметров из packer файла в шаблон, в том числе доп параметр.
Настроен packer файл immutable.json с полной настройкой сервера и запуска сервиса puma.service через systemctl юнит. Написан unit systemd.
