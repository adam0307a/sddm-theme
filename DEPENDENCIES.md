# 📦 BAĞIMLILIKLAR VE KURULUM

## 🔧 Gerekli Paketler

Bu tema için aşağıdaki paketlerin sisteminizde kurulu olması gerekir:

### Ana Bağımlılıklar
1. **SDDM** - Display Manager
2. **Qt5 GraphicalEffects** - Blur, Shadow, Glow efektleri için
3. **Qt5 QuickControls2** - Modern UI bileşenleri
4. **Qt5 SVG** - Icon desteği
5. **Qt5 VirtualKeyboard** - (Opsiyonel) Sanal klavye
6. **Inter Font** - Modern tipografi

---

## 🚀 Hızlı Kurulum

### Otomatik Script (Önerilen)
```bash
chmod +x install-dependencies.sh
./install-dependencies.sh
```

Script tüm distroları otomatik tespit eder ve gerekli paketleri kurar.

---

## 📋 Manuel Kurulum Komutları

### Arch Linux / Manjaro / EndeavourOS
```bash
sudo pacman -S --needed sddm qt5-graphicaleffects qt5-quickcontrols2 qt5-svg qt5-virtualkeyboard

# Inter font (AUR)
yay -S inter-font
# veya
paru -S inter-font
```

### Debian / Ubuntu / Pop!_OS / Linux Mint
```bash
sudo apt update
sudo apt install -y sddm \
    qml-module-qtquick-controls2 \
    qml-module-qtquick-layouts \
    qml-module-qtgraphicaleffects \
    qml-module-qt-labs-platform \
    fonts-inter
```

**Not:** Ubuntu 22.04+ ve Debian 12+ için `fonts-inter` paketi mevcut değilse:
```bash
# Manuel Inter font kurulumu
wget https://github.com/rsms/inter/releases/download/v3.19/Inter-3.19.zip
sudo unzip Inter-3.19.zip -d /usr/share/fonts/truetype/inter/
sudo fc-cache -fv
```

### Fedora / RHEL / CentOS
```bash
sudo dnf install -y sddm \
    qt5-qtgraphicaleffects \
    qt5-qtquickcontrols2 \
    qt5-qtsvg \
    qt5-qtvirtualkeyboard

# Inter font manuel kurulum
wget https://github.com/rsms/inter/releases/download/v3.19/Inter-3.19.zip
sudo unzip Inter-3.19.zip -d /usr/share/fonts/inter/
sudo fc-cache -fv
```

### openSUSE (Leap / Tumbleweed)
```bash
sudo zypper install -y sddm \
    libqt5-qtgraphicaleffects \
    libqt5-qtquickcontrols2 \
    libqt5-qtsvg \
    libqt5-qtvirtualkeyboard

# Inter font manuel kurulum
wget https://github.com/rsms/inter/releases/download/v3.19/Inter-3.19.zip
sudo unzip Inter-3.19.zip -d /usr/share/fonts/inter/
sudo fc-cache -fv
```

### Gentoo
```bash
emerge --ask x11-misc/sddm \
    dev-qt/qtgraphicaleffects \
    dev-qt/qtquickcontrols2 \
    dev-qt/qtsvg

# Inter font
emerge --ask media-fonts/inter
```

### NixOS
`/etc/nixos/configuration.nix` dosyanıza ekleyin:
```nix
services.xserver.displayManager.sddm.enable = true;

environment.systemPackages = with pkgs; [
  libsForQt5.qt5.qtgraphicaleffects
  libsForQt5.qt5.qtquickcontrols2
  libsForQt5.qt5.qtsvg
  inter
];

fonts.fonts = with pkgs; [
  inter
];
```

Sonra:
```bash
sudo nixos-rebuild switch
```

---

## ✅ Bağımlılık Kontrolü

### Kurulu mu kontrol et:

**Arch Linux:**
```bash
pacman -Q | grep -E "sddm|qt5-graphicaleffects|qt5-quickcontrols2|inter-font"
```

**Debian/Ubuntu:**
```bash
dpkg -l | grep -E "sddm|qml-module-qtgraphicaleffects|fonts-inter"
```

**Fedora:**
```bash
rpm -qa | grep -E "sddm|qt5-qtgraphicaleffects"
```

### Font kontrolü (tüm distro):
```bash
fc-list | grep -i inter
```

Eğer "Inter" çıktısı alırsanız font kurulu demektir.

---

## 🐛 Sorun Giderme

### Blur Çalışmıyor
**Sebep:** Qt5 GraphicalEffects kurulu değil

**Arch:**
```bash
sudo pacman -S qt5-graphicaleffects
```

**Debian/Ubuntu:**
```bash
sudo apt install qml-module-qtgraphicaleffects
```

### Font Görünmüyor / Noto Sans kullanılıyor
**Sebep:** Inter font kurulu değil veya cache edilmemiş

**Çözüm:**
```bash
# Font cache yenile
sudo fc-cache -fv

# Mevcut fontları listele
fc-list | grep Inter

# Eğer boş gelirse, Inter'i manuel kurun (yukarıdaki komutlar)
```

### Tema Yüklenmiyor / QML Hatası
**Sebep:** Qt5 QuickControls2 eksik

**Arch:**
```bash
sudo pacman -S qt5-quickcontrols2 qt5-declarative
```

**Debian/Ubuntu:**
```bash
sudo apt install qml-module-qtquick-controls2 qml-module-qtquick-layouts
```

### SDDM Logları Kontrol
```bash
journalctl -u sddm -b
# veya
cat /var/log/sddm.log
```

---

## 📝 Kurulum Sonrası

Tüm bağımlılıklar kurulduktan sonra:

1. **Temayı kopyalayın:**
```bash
sudo cp -r sddm-sugar-candy /usr/share/sddm/themes/
```

2. **SDDM config düzenleyin:**
```bash
sudo nano /etc/sddm.conf
```

Şunu ekleyin:
```ini
[Theme]
Current=sddm-sugar-candy
```

3. **Test edin:**
```bash
# Önce test modunda çalıştırın
sddm-greeter --test-mode --theme /usr/share/sddm/themes/sddm-sugar-candy

# Sorun yoksa SDDM'yi restart
sudo systemctl restart sddm
```

---

## 💡 İpuçları

### Minimal Kurulum (Font olmadan)
Inter font yoksa tema Noto Sans veya sistem varsayılan fontunu kullanır:

```bash
# theme.conf'da:
Font="Noto Sans"
# veya
Font="Roboto"
```

### Performans İçin
Düşük donanımlı sistemlerde blur'ü azaltın:

```bash
# theme.conf
BlurRadius="40"        # 80 yerine
DimBackgroundImage="0.3"  # 0.5 yerine
```

### Virtual Keyboard İstemiyorsanız
```bash
# theme.conf
ForceHideVirtualKeyboardButton="true"
```

Qt5 VirtualKeyboard paketini kurmanıza gerek yok.

---

## 📦 Paket Boyutları (Yaklaşık)

- **sddm:** ~2-5 MB
- **qt5-graphicaleffects:** ~500 KB
- **qt5-quickcontrols2:** ~5-10 MB
- **qt5-svg:** ~200 KB
- **Inter font:** ~5 MB

**Toplam:** ~15-25 MB

---

## 🌐 Ek Kaynaklar

- [SDDM Wiki](https://github.com/sddm/sddm/wiki)
- [Qt5 Documentation](https://doc.qt.io/qt-5/)
- [Inter Font](https://rsms.me/inter/)
- [Arch Wiki - SDDM](https://wiki.archlinux.org/title/SDDM)

---

**Son Güncelleme:** 23 Kasım 2025  
**Tema Versiyonu:** 2.1 Glassmorphic Edition
