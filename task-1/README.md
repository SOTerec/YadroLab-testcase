## Задание 1

Задание будет выполнятся внутри Docker-контейнера:

```
docker run -it ubuntu:20.04
```

__Тривиальные шаги с добавлением пользователя в первом задании будут пропущены__

Внутри контейнера обновляем репозитории и делаем full-system-upgrade, после чего устанавливаем все необходимые пакеты:

```
sudo apt update && sudo apt upgrade
sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 python3-subunit zstd liblz4-tool file locales libacl1
sudo locale-gen en_US.UTF-8
```

Клонируем репозиторий `poky`:

```
git clone git://git.yoctoproject.org/poky
```

Переходим в директорию `poky` и переключаемся на нужную ветку:

```
cd poky
git checkout kirkstone
git pull
```

Запускаем `Build Environment Setup Script`:

```
source oe-init-build-env
```

Теперь из каталога `build` запускаем сборку `poky core-image-minimal`:

```
bitbake core-image-minimal
```

После успешной сборки можно перейти в директорию с образом и запустить его:

```
cd ~/poky/build/tmp/deploy/images/
runqemu qemux86-64 slirp nographic
```

Будет выведено приглашение:
![runqemu qemux86-64](src/images/image_1.png)

Все вышеприведенные шаги можно выполнить с помощью запуска [данного скрипта](src/scripts/task1.sh)

Может понадобиться использование [`--privileged`](https://docs.docker.com/reference/cli/docker/container/run/#privileged) при запуске контейнера, в случае возникновения проблем с гипервизором
