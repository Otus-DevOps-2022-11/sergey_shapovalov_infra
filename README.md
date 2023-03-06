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
=======
HW-08 (terraform-1)

В ходе выполнения ДЗ было выполнено:
- установлен Terraform, создан сервисный акаунт в YC, сделан ключ доступа, назначены права.
- установлен terraform provider нужной версии, создан файл main.tf для создания инстанса в YC, протестировано создание VM.
- вынесена переменная external_ip_address_app в файл ouputs.tf для удобства подключения и дальнейшей настройки provisioners.
- настроены секции provisioners и подредактированы сами файлы для корректной работы с моим image созданным Packer в HW-07.
- определены переменные в variables.tf изменён main.tf для использования определенных переменных.
- определены авторизационные переменные в terraform.tfvars изменён main.tf для использования этих переменных. 
- определены переменные для ssh_private_key в секции connections перенастроено в main.tf на их использование. Аналогично и для zone. 
- Отформатированы файлы: terraform fmt Протестирована работоспособность terraform destroy -auto-approve && terraform apply -auto-approve
- добавлены в git нужные файлы, git commit, git push.
- удалил созданную VM, сделал PR в github.
=======
HW-10 (ansible-1)

- Установлен ansible, созданы 2 VM в YC для тестирования.
- создан inventory file ini формата, потом inventory.yaml, проверен доступ к серверам с помощью ping: ansible all -i inventory.yaml -m ping. Настроены группы хостов.
- создан файл ansible.cfg куда вынес переменные.
- Проверил работу модуля command и его различия с модулем shell (-m shell использует переменные окружения, в отличии от -m command) ansible app -m shell -a 'ruby -v; bundler -v'
- Проверил статус mongod на db сервере с помощью команды и модулей:
  - ansible db -m shell -a 'systemcl status mongod'
  - ansible db -m systemd -a name=mondod
  - ansible db -m service -a name=mongod
- написан простой playbook для клонирования репозитория git в директорию на сервере. При повторном выполнении playbook изменений на сервере нет.
