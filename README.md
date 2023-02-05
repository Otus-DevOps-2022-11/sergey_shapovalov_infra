# sergey_shapovalov_infra
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
