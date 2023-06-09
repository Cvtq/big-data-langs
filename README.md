# Apache Spark

## Установка Apache Spark на Arch Linux btw

```shell
$ yay apache-spark
```

Готово. Вы невероятны!

## Команды


1. Запуск оболочки Spark

```shell
$ spark-shell
```

2. Тестовый Hello World

```shell
$ scala> print("Hello World")
```

![](imgs/img1.png)

Доступ к Web UI http://localhost:4040/jobs/ или по ссылке, указанной в оболочке.

Введите :q и нажмите Enter, чтобы выйти из оболочки.

3. Запуск оболочки с Python

```shell
$ pyspark
```


Ведите quit() и нажмите Enter, чтобы выйти из оболочки.

4. Проверка версии Apache Spark

Версия пишется на сплеш-скрине, но можно проверить и командами:

```shell
$ scala> sc.version
$ spark-submit --version
```

5. Изменение переменной окружения

```shell
$ export PATH=$PATH:/opt/apache-spark/bin
```

6. Проверить переменную окружения

```shell
$ printenv SPARK_HOME
```

7. Запуск тестовой программы

```shell
$ sh spark-hello-world/submit-spark-hello-world.sh
```

## Установка Apache Zeppelin (Docker)

```bash
docker run -p 8080:8080 --rm --name zeppelin apache/zeppelin:0.10.1
```
```bash
docker run -u $(id -u) -p 8080:8080 --rm -v /mnt/disk1/notebook:/notebook \
-v /usr/lib/spark-current:/opt/spark -v /mnt/disk1/flink-1.12.2:/opt/flink -e FLINK_HOME=/opt/flink  \
-e SPARK_HOME=/opt/spark  -e ZEPPELIN_NOTEBOOK_DIR='/notebook' --name zeppelin apache/zeppelin:0.10.0
```


Zeppelin будет доступен по ссылке http://localhost:8080/.

## Команды в терминале

* ls — посмотреть список файлов и папок в текущей директории
* ls -lah — посмотреть список всех файлов и папок в текущей директории с указанием прав на запись/чтение и размера файлов
* cd /folder — перейти в нужную папку
* cd .. — перейти в на уровень файловой иерархии выше
* mkdir name — создать папку
* touch name.txt — создать файл
* cat file.txt — вывести код файла в консоль
* rm -rf file.txt — удаление папки или файла
* pwd — вернёт путь к папке, в который мы в данный момент находимся
* clear — очистить консоль
* mv main.py start.py — команда для перемещения файла из одной папки в другую, но часто используется для переименования файла
* cp file.js /home/test/ — копирует файл по указанному пути
* sudo lsof -i -n -P — посмотреть работающие порты
* sudo kill PID — убить порт по его PID
* wget url — для скачивания файлов
* unzip file — распаковка zip-архивов
* tar -zxvf file.tgz — распаковка tgz-архивов
* echo "Hello World!" — вывести сообщение в консоль
* echo "Hello" >> hello.txt — запишет строку “Hello” в файл hello.txt


## Информация о аппаратном обеспечении

* nvidia-smi: Видеокарта
* cat /proc/cpuinfo: ЦПУ
* cat /proc/meminfo : ОЗУ
* df -h: Показывает информацию о доступном месте на диске.
* neofetch : Разнообразная информая
* uname -a: Выводит информацию о ядре операционной системы.
* free -m: Выводит информацию о доступной и используемой памяти.
* uptime: Показывает время работы системы и среднюю загрузку.
* lscpu: Выводит информацию о процессоре, такую как количество ядер и модель.
* lsblk: Отображает информацию о блочных устройствах, таких как жесткие диски и разделы.
* ifconfig: Показывает информацию о сетевых интерфейсах, включая IP-адреса.
* lshw: Выводит подробную информацию о аппаратном обеспечении системы.
* top, htop: Отображает список процессов, работающих на системе, с сортировкой по использованию ресурсов.
* lspci: Выводит информацию о подключенных устройствах PCI.
*  lsusb: Показывает список подключенных устройств USB.
*  lsmod: Отображает список загруженных модулей ядра.
*  ps aux: Показывает список запущенных процессов с детальной информацией о каждом процессе.
*  who: Выводит информацию о текущих пользователях в системе.
*  history: Показывает список последних выполненных команд в терминале.
*  systemctl list-units --type=service: Отображает список запущенных служб в системе.


## Tmux

* tmux без параметров будет создана сессия 0
* tmux new -s session1 новая сессия session1. Название отображается снизу-слева в квадратных скобках в статус строке. Далее идет перечисление окон. Текущее окно помечается звездочкой.

**Префикс** (с него начинаются команды)
* C-b  = CTRL + b

**Новое окно** (нажать CTRL+b, затем нажать с)
* C-b c

**Список окон**
* C-b w : переключиться курсором вверх-вниз

**Переключение**
* C-b n : следующее окно
* C-b p : предыдущее окно
* C-b 0 : переключиться на номер окна

Окна можно делить на панели (Panes)
Как в тайловых (мозаичных) оконных менеджерах.

**Деление окна горизонтально**
* C-b "
либо команда
* tmux split-window -h

**Деление окна вертикально**
* C-b %
либо команда
* tmux split-window -v

**Переход между панелей**
* C-b стрелки курсора : либо режим мыши

**Изменение размеров панелей**
* C-b c-стрелки : либо режим мыши

**Закрытие окон**
* C-b x : нужно подтвердить y
либо
* exit

**Отключение от сессии**
* C-b d
либо
* tmux detach

**Список сессий**
* tmux ls


**Подключиться к работающей сессии**
* tmux attach : подключение к сессии, либо к единственной, либо последней созданной
* tmux attach -t session1 : подключение к сессии session1

**Выбрать сессию**
* C-b s

**Завершение сессии**
* tmux kill-session -t session1

**Завершить все сессии**
* tmux kill-server

**Список поддерживаемых комманд**
* tmux list-commands

**Дополнительная информация**
* man tmux

## grep

https://habr.com/ru/articles/229501/

## wget

Загрузка одного файла
* wget url
Загрузка файла и сохранение его с новым именем
* wget -O name url
Ограничение скорости загрузки файлов
* wget ––limit-rate=500K url
Завершение прерванной загрузки
* wget –c url
Фоновая загрузка файла
* wget –b url
Загрузка нескольких файлов
* wget -I urls.txt
Увеличение общего числа попыток загрузки файла
* wget ––tries=100
Загрузка файлов с FTP-сервера
* wget ftp-url
* wget –-ftp-user=admin ––ftp-password=********* FTP-URL
Создание локальной копии веб-сайта
* wget --mirror -p --convert-links -P /home/test.com
Загрузка с сайта только файлов определённого типа
* wget -r -A.txt Website_url
Пропуск файлов определённого типа
* wget --reject=png Website_url
Загрузка с использованием собственного .log-файла
* wget -o wgetfile.log url