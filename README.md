## Gazebo COEX Clever (https://github.com/CopterExpress/clever)
###
```
Для запуска необходимо установить ubuntu 18.04 и ros melodic 
```

### Примечание 1
```
Желательно отключить запрос пароля для sudo.
```
```bash
sudo apt-get install nano
sudo nano /etc/sudoers # в строку начинающуюся с sudo добовляем NOPASSWD:
# должно получиться так "%sudo ALL=(ALL:ALL) NOPASSWD:ALL"
# далее Ctrl+X; Y; Enter
```

### Примечание 2
```
Если при запуске симулятора видите ошибку типа:
[Err] [REST.cc:205] Error in REST request
Сделайте так:
```
```bash
sudo nano ~/.ignition/fuel/config.yaml
# и замените https://api.ignitionfuel.org на https://api.ignitionrobotics.org
```

### Установка 
```bash
git clone https://github.com/matveylapin/clever_sim.git
sudo ./clever_sim/install_dep.sh
sudo ./clever_sim/install.sh
```

### Запуск 
```bash
source clever_sim/env.sh
roslaunch clever_sim/run.launch 
```



