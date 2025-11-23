# 🎨 Glassmorphic Modern SDDM Theme

Modern, özgün ve profesyonel bir SDDM login ekranı teması. Glassmorphism (cam efekti) ve minimal tasarım prensiplerini birleştirerek macOS benzeri şık bir görünüm sunar.

## ✨ Özellikler

### 🎯 Tasarım Konsepti
- **Glassmorphic Minimalism**: Cam efekti + minimal estetik
- **Merkez Odaklı Floating Card**: Ekran ortasında yüzen modern kart tasarımı
- **Backdrop Blur**: 80px blur + saturate efekti
- **Multi-layer Shadows**: Derinlik hissi veren çoklu gölgeler
- **Smooth Animations**: 300ms Cubic-Bezier geçişler

### 🎨 Renk Paleti
```
Primary Gradient:   #667eea → #764ba2 (Mor-Mavi)
Accent Gradient:    #f093fb → #f5576c (Pembe-Kırmızı)
Background:         rgba(20, 20, 40, 0.7) (Koyu lacivert, şeffaf)
Glass Effect:       rgba(255, 255, 255, 0.1)
Text:               #ffffff
Border:             rgba(255, 255, 255, 0.18)
```

### 🎭 Görsel Özellikler

#### 1. **Welcome Card**
- 480px genişlik, merkez hizalı
- 24px border radius
- Backdrop blur + glassmorphic background
- Fade-in entrance animasyonu (800ms)
- Breathing separator (pulse animasyon)

#### 2. **Clock & Date**
- Saat: 72px, ExtraLight font
- Tarih: 18px, 0.7 opacity
- Smooth fade geçişler

#### 3. **Input Fields**
- Glassmorphic background (rgba(255,255,255,0.05))
- 16px border radius
- Focus: Scale 1.02x + glow efekti
- 300ms InOutQuad animasyon

#### 4. **Login Button**
- Gradient overlay (#667eea → #764ba2)
- Hover: Scale 1.02x + full gradient
- Press: Scale 0.98x
- 300ms OutCubic animasyon

#### 5. **System Buttons**
- Circular glassmorphic buttons
- Hover: Scale 1.1x + glow
- Press: Scale 0.9x
- Icon-only display

## 🚀 Kurulum

### 1. Temayı SDDM Dizinine Kopyalama
```bash
sudo cp -r sddm-sugar-candy /usr/share/sddm/themes/
```

### 2. SDDM Konfigürasyonunu Güncelleme
`/etc/sddm.conf` veya `/etc/sddm.conf.d/` altında:
```ini
[Theme]
Current=sddm-sugar-candy
```

### 3. SDDM'yi Yeniden Başlatma
```bash
sudo systemctl restart sddm
```

## ⚙️ Konfigürasyon

### theme.conf Önemli Ayarlar

#### Blur & Effects
```ini
FullBlur="true"              # Tam ekran blur
PartialBlur="true"           # Kart blur efekti
BlurRadius="80"              # Blur gücü (80-100 optimal)
DimBackgroundImage="0.5"     # Arka plan koyulaştırma
```

#### Layout
```ini
FormPosition="center"         # Kart pozisyonu (center/left/right)
HaveFormBackground="true"     # Glassmorphic kart aktif
```

#### Colors
```ini
MainColor="#ffffff"           # Ana metin rengi
AccentColor="#667eea"         # Vurgu rengi (mor-mavi)
BackgroundColor="#1a1a28"     # Kart arka plan rengi
```

#### Typography
```ini
Font="Inter"                  # Modern font (alternatif: SF Pro Display, Roboto)
RoundCorners="16"             # Border radius (8-24 arası)
```

#### Behavior
```ini
ForceLastUser="true"          # Son kullanıcıyı hatırla
ForcePasswordFocus="true"     # Parola alanına otomatik focus
ForceHideVirtualKeyboardButton="true"  # Virtual klavye butonunu gizle
```

## 🎨 Özelleştirme Önerileri

### 1. **Renk Teması Değiştirme**

#### Cyberpunk Neon
```ini
AccentColor="#00ff41"         # Matrix yeşili
BackgroundColor="#0d0208"     # Siyah
```

#### macOS Big Sur
```ini
AccentColor="#007aff"         # Apple mavi
BackgroundColor="#1c1c1e"     # Koyu gri
```

#### Sunset Warm
```ini
AccentColor="#ff6b6b"         # Mercan kırmızısı
BackgroundColor="#2d1b69"     # Koyu mor
```

### 2. **Font Değiştirme**
Sistem fontlarınızı kontrol edin:
```bash
fc-list | grep -i "inter\|roboto\|sf"
```

Popüler alternatifler:
- `Inter` - Modern, minimal
- `SF Pro Display` - macOS benzeri
- `Roboto` - Material Design
- `JetBrains Mono` - Monospace
- `Poppins` - Yuvarlaklık

### 3. **Animasyon Hızı Ayarlama**
`Components/Input.qml` ve diğer dosyalardaki `duration` değerlerini değiştirin:
```qml
duration: 300  // Hızlı: 200, Yavaş: 500
```

### 4. **Card Genişliği**
`Main.qml` içinde:
```qml
width: Math.min(480, parent.width * 0.9)  // 480px'i değiştirin
```

## 🎯 Ek Özellikler

### ✅ Uygulanmış
- [x] Glassmorphic card tasarımı
- [x] Backdrop blur efekti
- [x] Smooth hover/focus animasyonları
- [x] Modern gradient butonlar
- [x] Circular system buttons
- [x] Welcome text + separator
- [x] Large elegant clock
- [x] Multi-layer shadows

### 🚧 Gelecek Özellikler (İsteğe Bağlı)

#### 1. **Dinamik Arka Plan**
```qml
// Arka plan değiştirici ekleyin
property var backgrounds: ["bg1.jpg", "bg2.jpg", "bg3.jpg"]
property int bgIndex: Math.floor(Math.random() * backgrounds.length)
```

#### 2. **Otomatik Karanlık/Aydınlık Mod**
```qml
property bool isDark: new Date().getHours() >= 18 || new Date().getHours() < 6
AccentColor: isDark ? "#667eea" : "#007aff"
```

#### 3. **Parallax Mouse Tracking**
```qml
MouseArea {
    anchors.fill: parent
    onPositionChanged: {
        formBackground.x = (mouseX - width/2) * 0.02
        formBackground.y = (mouseY - height/2) * 0.02
    }
}
```

#### 4. **Weather Widget**
API entegrasyonu ile sıcaklık gösterimi (opsiyonel).

## 🛠️ Sorun Giderme

### Blur Çalışmıyor
```bash
# Qt GraphicalEffects kurulu mu kontrol edin
pacman -Q qt5-graphicaleffects  # Arch
apt install qml-module-qtgraphicaleffects  # Debian/Ubuntu
```

### Font Görünmüyor
```bash
# Fontu sistem geneline kurun
sudo cp font.ttf /usr/share/fonts/
sudo fc-cache -fv
```

### Tema Yüklenmiyor
```bash
# SDDM loglarını kontrol edin
journalctl -u sddm -b
```

### Çözünürlük Problemleri
`theme.conf`:
```ini
ScreenWidth="1920"   # Ekran genişliğiniz
ScreenHeight="1080"  # Ekran yüksekliğiniz
```

## 📸 Ekran Görüntüleri

**Öncesi:**
- Sol panel blur arka plan
- Turuncu accent
- Basic layout

**Sonrası:**
- Merkez glassmorphic card
- Mor-mavi gradient
- Modern minimalist
- Smooth animations

## 🎓 Öğrenilen Teknolojiler

- QML (Qt Meta Language)
- QtQuick 2.11
- QtGraphicalEffects
- Glassmorphism Design
- Animation & Easing
- State Management

## 📝 Lisans

SDDM Sugar Candy - GNU General Public License v3.0
Glassmorphic Mod - MIT License

## 🤝 Katkıda Bulunma

Önerileriniz ve geliştirmeleriniz için pull request açabilirsiniz!

## 🌟 İlham Kaynakları

- macOS Big Sur login screen
- Windows 11 Acrylic design
- Glassmorphism UI trend
- Material Design 3

---

**Hazırlayan:** Modern SDDM Theme Project  
**Tarih:** 2025  
**Versiyon:** 2.0 Glassmorphic Edition
