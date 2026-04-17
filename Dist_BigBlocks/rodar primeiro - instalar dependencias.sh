#!/bin/bash

echo "--- Instalando dependências para Big Blocks (Qt 6) ---"

# Detectar o gerenciador de pacotes
if [ -x "$(command -v apt)" ]; then
    echo "Sistema baseado em Debian/Ubuntu detectado."
    sudo apt update
    sudo apt install -y qt6-base-dev \
                        qt6-declarative-dev \
                        qml6-module-qtquick-controls \
                        qml6-module-qtquick-shapes \
                        qml6-module-qt-labs-settings \
                        libgl1-mesa-dev

elif [ -x "$(command -v dnf)" ]; then
    echo "Sistema baseado em Fedora detectado."
    sudo dnf install -y qt6-qtdeclarative-devel \
                        qt6-qtcontrols2-devel \
                        qt6-qtshapes-devel \
                        qt6-qt5compat-devel

elif [ -x "$(command -v pacman)" ]; then
    echo "Sistema baseado em Arch/BigLinux detectado."
    sudo pacman -S --needed qt6-declarative \
                            qt6-5compat \
                            qt6-shadertools
else
    echo "Gerenciador de pacotes não reconhecido automaticamente."
    echo "Certifique-se de instalar manualmente o Qt6 e os módulos QML: Controls, Shapes e Settings."
    exit 1
fi

echo "--- Instalação concluída com sucesso! ---"
echo "Para rodar o jogo futuramente, use: qml6 main.qml"
