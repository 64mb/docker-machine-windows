# 🖥️🍫🐳 docker-machine-windows

**\[ВНИМАНИЕ! В большинстве источников подход docker-machine объявлен устаревшим, репозиторий с утилитой и образами boot2docker.iso официально не обновляется\]**

- Для поддержания актуальности версии docker, используется сторонний репозиторий: https://github.com/kaosagnt/boot2docker-xfs-ng

0. Установка chocolate 

* При использовании chocolate в Windows 7 может понадобится установка нового NET.Framework: [NET. Framework 4.8](https://support.microsoft.com/ru-ru/help/4503548/microsoft-net-framework-4-8-offline-installer-for-windows)
* Также может понадобится установка PowerShell v5: [PowerShell 5](https://www.microsoft.com/en-us/download/details.aspx?id=54616)
* Исправление защитника Windows 7: [FIX](http://download.microsoft.com/download/F/2/2/F22D5FDB-59CD-4275-8C95-1BE17BF70B21/WindowsUpdateDiagnostic.diagcab)

Установка через PowerShell, терминал должен быть запущен от имени администратора

```ps1
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

1. Для корректной работы docker из консоли необходимо установить Git с поддержкой bash:
[git](http://git-scm.com/download/win)

или используя пакетный менеджер сhocolate для Windows:

```sh
choco install git
```

2. Установить VirtualBox и ExtensionPack: 

[VirtualBox 6.1.16](https://download.virtualbox.org/virtualbox/6.1.16/VirtualBox-6.1.16-140961-Win.exe)

[VirtualBox ExtensionPack 6.1.16](https://download.virtualbox.org/virtualbox/6.1.16/Oracle_VM_VirtualBox_Extension_Pack-6.1.16.vbox-extpack)

или используя пакетный менеджер сhocolate для Windows:

```sh
choco install virtualbox --params "/NoDesktopShortcut /ExtensionPack"
```

3. Запустить скрипт install.sh через GitBash

Скрипт автоматически загрузить последние версии docker-cli, docker-compose, docker-machine и установит их в систему в виде бинарных файлов без привязки к реестру
   
Дальнейшую работу по разработке с применением docker-инструментов рекомендуется проводить через Bash совместимый терминал
