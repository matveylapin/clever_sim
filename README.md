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
Если вы работаете под Windows вы можете установить Ubuntu decktop. Найти его можно в Microsoft Store.
Если при запуске приложения Ubuntu возникает ошибка, введите в командную строку Windows(запущеную от имени администратора) команду:
```
```bash
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

### Установка ROS milodic
```
Для установки ROS требуется ввести команыды ниже по порядку.
```
```bash
sudo apt-get update
sudo apt-get install ros-melodic-desktop-full
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo apt install python-rosdep
sudo rosdep init
rosdep update
```

### Установка 
```bash
git clone https://github.com/matveylapin/clever_sim.git
sudo ./clever_sim/install_dep.sh
sudo ./clever_sim/install.sh
```

### Запуск 
```bash
source env.sh
roslaunch run.launch 
```



