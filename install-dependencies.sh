#!/bin/bash
# SDDM Sugar Candy Glassmorphic Theme - Bağımlılık Kurulum Scripti
# Versiyon: 2.1

echo "🎨 SDDM Glassmorphic Theme Bağımlılık Kontrolü"
echo "================================================"
echo ""

# Distro tespiti
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
else
    echo "❌ Distro tespit edilemedi!"
    exit 1
fi

echo "📦 Tespit edilen sistem: $PRETTY_NAME"
echo ""

# Arch Linux / Manjaro / EndeavourOS
if [[ "$DISTRO" == "arch" || "$DISTRO" == "manjaro" || "$DISTRO" == "endeavouros" ]]; then
    echo "🔷 Arch tabanlı sistem tespit edildi"
    echo ""
    echo "Gerekli paketler kuruluyor..."
    
    sudo pacman -S --needed --noconfirm \
        sddm \
        qt5-graphicaleffects \
        qt5-quickcontrols2 \
        qt5-svg \
        qt5-virtualkeyboard
    
    # Inter font (AUR'dan veya paket olarak)
    if pacman -Qi inter-font &>/dev/null; then
        echo "✅ Inter font zaten kurulu"
    else
        echo "📥 Inter font kuruluyor..."
        if command -v yay &>/dev/null; then
            yay -S --needed --noconfirm inter-font
        elif command -v paru &>/dev/null; then
            paru -S --needed --noconfirm inter-font
        else
            echo "⚠️  AUR helper bulunamadı. Inter font'u manuel kurabilirsiniz:"
            echo "   yay -S inter-font  VEYA  paru -S inter-font"
        fi
    fi

# Debian / Ubuntu / Linux Mint
elif [[ "$DISTRO" == "debian" || "$DISTRO" == "ubuntu" || "$DISTRO" == "linuxmint" || "$DISTRO" == "pop" ]]; then
    echo "🔶 Debian tabanlı sistem tespit edildi"
    echo ""
    echo "Paket listesi güncelleniyor..."
    sudo apt update
    
    echo "Gerekli paketler kuruluyor..."
    sudo apt install -y \
        sddm \
        qml-module-qtquick-controls2 \
        qml-module-qtquick-layouts \
        qml-module-qtgraphicaleffects \
        qml-module-qt-labs-platform \
        qt5-style-kvantum \
        fonts-inter
    
    # Eğer fonts-inter yoksa
    if ! dpkg -l | grep -q fonts-inter; then
        echo "⚠️  Inter font paketi bulunamadı, manuel kurulum yapılıyor..."
        wget https://github.com/rsms/inter/releases/download/v3.19/Inter-3.19.zip -O /tmp/inter.zip
        sudo unzip -o /tmp/inter.zip -d /usr/share/fonts/truetype/inter
        sudo fc-cache -fv
    fi

# Fedora / RHEL / CentOS
elif [[ "$DISTRO" == "fedora" || "$DISTRO" == "rhel" || "$DISTRO" == "centos" ]]; then
    echo "🔴 Fedora/RHEL tabanlı sistem tespit edildi"
    echo ""
    echo "Gerekli paketler kuruluyor..."
    
    sudo dnf install -y \
        sddm \
        qt5-qtgraphicaleffects \
        qt5-qtquickcontrols2 \
        qt5-qtsvg \
        qt5-qtvirtualkeyboard \
        google-noto-sans-fonts
    
    # Inter font manuel kurulum
    echo "📥 Inter font kuruluyor..."
    wget https://github.com/rsms/inter/releases/download/v3.19/Inter-3.19.zip -O /tmp/inter.zip
    sudo unzip -o /tmp/inter.zip -d /usr/share/fonts/inter
    sudo fc-cache -fv

# openSUSE
elif [[ "$DISTRO" == "opensuse" || "$DISTRO" == "opensuse-leap" || "$DISTRO" == "opensuse-tumbleweed" ]]; then
    echo "🟢 openSUSE tespit edildi"
    echo ""
    echo "Gerekli paketler kuruluyor..."
    
    sudo zypper install -y \
        sddm \
        libqt5-qtgraphicaleffects \
        libqt5-qtquickcontrols2 \
        libqt5-qtsvg \
        libqt5-qtvirtualkeyboard \
        google-noto-sans-fonts

else
    echo "⚠️  Bilinmeyen distro: $DISTRO"
    echo ""
    echo "Manuel kurulum için gerekli paketler:"
    echo "  - sddm"
    echo "  - qt5-graphicaleffects (veya qml-module-qtgraphicaleffects)"
    echo "  - qt5-quickcontrols2"
    echo "  - qt5-svg"
    echo "  - qt5-virtualkeyboard (opsiyonel)"
    echo "  - Inter font"
    exit 1
fi

echo ""
echo "================================================"
echo "✅ Bağımlılıklar kuruldu!"
echo ""
echo "📋 Sonraki adımlar:"
echo "   1. Temayı kopyalayın:"
echo "      sudo cp -r sddm-sugar-candy /usr/share/sddm/themes/"
echo ""
echo "   2. SDDM konfigürasyonunu düzenleyin:"
echo "      sudo nano /etc/sddm.conf"
echo "      [Theme] bölümüne ekleyin: Current=sddm-sugar-candy"
echo ""
echo "   3. SDDM'yi yeniden başlatın:"
echo "      sudo systemctl restart sddm"
echo ""
echo "   VEYA sistemi yeniden başlatın"
echo ""
