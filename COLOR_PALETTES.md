# 🎨 RENK PALETİ ALTERNATİFLERİ

Bu dosya, farklı tema stilleri için hazır renk paletleri içerir. `theme.conf` dosyasındaki ilgili satırları aşağıdaki değerlerle değiştirerek temayı özelleştirebilirsiniz.

---

## 1️⃣ GLASSMORPHIC PURPLE (Varsayılan)

**Stil:** Modern, şık, profesyonel  
**Ruh Hali:** Yaratıcı, premium

```ini
MainColor="#ffffff"
AccentColor="#667eea"
BackgroundColor="#1a1a28"
DimBackgroundImage="0.5"
```

**Gradient Önizleme:**
```
Primary:  #667eea → #764ba2 (Mor-Mavi)
Accent:   #f093fb → #f5576c (Pembe)
```

---

## 2️⃣ CYBERPUNK NEON

**Stil:** Futuristik, teknolojik  
**Ruh Hali:** Hacker, matrix, sci-fi

```ini
MainColor="#00ff41"
AccentColor="#00ff41"
BackgroundColor="#0d0208"
DimBackgroundImage="0.7"
```

**Gradient Önizleme:**
```
Primary:  #00ff41 → #00d4aa (Matrix Yeşil)
Accent:   #ff006e → #8338ec (Neon Pembe-Mor)
```

**Input.qml Gradient Düzenlemesi:**
```qml
gradient: Gradient {
    GradientStop { position: 0.0; color: "#00ff41" }
    GradientStop { position: 1.0; color: "#00d4aa" }
}
```

---

## 3️⃣ MACOS BIG SUR

**Stil:** Apple benzeri, minimal  
**Ruh Hali:** Temiz, profesyonel, zarif

```ini
MainColor="#ffffff"
AccentColor="#007aff"
BackgroundColor="#1c1c1e"
DimBackgroundImage="0.4"
```

**Gradient Önizleme:**
```
Primary:  #007aff → #5ac8fa (Apple Mavi)
Accent:   #ff375f → #ff9f0a (Turuncu-Kırmızı)
```

---

## 4️⃣ SUNSET WARM

**Stil:** Sıcak, samimi, romantik  
**Ruh Hali:** Günbatımı, rahatlatıcı

```ini
MainColor="#fff8f0"
AccentColor="#ff6b6b"
BackgroundColor="#2d1b69"
DimBackgroundImage="0.5"
```

**Gradient Önizleme:**
```
Primary:  #ff6b6b → #ff8e53 (Mercan Turuncu)
Accent:   #ffa07a → #fa709a (Pembe Şeftali)
```

**Input.qml Gradient Düzenlemesi:**
```qml
gradient: Gradient {
    GradientStop { position: 0.0; color: "#ff6b6b" }
    GradientStop { position: 1.0; color: "#ff8e53" }
}
```

---

## 5️⃣ OCEAN DEEP

**Stil:** Okyanus, derin, sakin  
**Ruh Hali:** Huzurlu, profesyonel

```ini
MainColor="#e0f7fa"
AccentColor="#00bcd4"
BackgroundColor="#0a192f"
DimBackgroundImage="0.6"
```

**Gradient Önizleme:**
```
Primary:  #00bcd4 → #26c6da (Cyan)
Accent:   #1de9b6 → #00e676 (Turkuaz)
```

---

## 6️⃣ DARK MONOCHROME

**Stil:** Minimalist, siyah-beyaz  
**Ruh Hali:** Ciddi, profesyonel, odaklı

```ini
MainColor="#f5f5f5"
AccentColor="#ffffff"
BackgroundColor="#0f0f0f"
DimBackgroundImage="0.8"
```

**Gradient Önizleme:**
```
Primary:  #ffffff → #e0e0e0 (Beyaz-Gri)
Accent:   #666666 → #999999 (Koyu Gri)
```

---

## 7️⃣ FOREST GREEN

**Stil:** Doğa, yeşil, organik  
**Ruh Hali:** Huzurlu, toprakla bağlantılı

```ini
MainColor="#f1f8e9"
AccentColor="#66bb6a"
BackgroundColor="#1b5e20"
DimBackgroundImage="0.5"
```

**Gradient Önizleme:**
```
Primary:  #66bb6a → #81c784 (Yeşil)
Accent:   #aed581 → #dce775 (Açık Yeşil-Limon)
```

---

## 8️⃣ NORDIC BLUE

**Stil:** İskandinav, soğuk, minimal  
**Ruh Hali:** Sakin, odaklı, temiz

```ini
MainColor="#eceff4"
AccentColor="#88c0d0"
BackgroundColor="#2e3440"
DimBackgroundImage="0.4"
```

**Gradient Önizleme:**
```
Primary:  #88c0d0 → #81a1c1 (İskandinav Mavi)
Accent:   #5e81ac → #b48ead (Mor-Mavi)
```

---

## 9️⃣ SAKURA PINK

**Stil:** Japon, kiraz çiçeği, zarif  
**Ruh Hali:** Romantik, yumuşak, nazik

```ini
MainColor="#fff0f5"
AccentColor="#ff69b4"
BackgroundColor="#4a1942"
DimBackgroundImage="0.5"
```

**Gradient Önizleme:**
```
Primary:  #ff69b4 → #ff85c1 (Pembe)
Accent:   #ffc0cb → #ffb3d9 (Açık Pembe)
```

---

## 🔟 DRACULA DARK

**Stil:** Popüler karanlık tema, canlı renkler  
**Ruh Hali:** Geliştirici dostu, gece modu

```ini
MainColor="#f8f8f2"
AccentColor="#bd93f9"
BackgroundColor="#282a36"
DimBackgroundImage="0.6"
```

**Gradient Önizleme:**
```
Primary:  #bd93f9 → #ff79c6 (Mor-Pembe)
Accent:   #50fa7b → #8be9fd (Yeşil-Cyan)
```

---

## 🎨 ÖZEL GRADIENT NASIL YAPILIR?

### Adım 1: Input.qml Dosyasını Açın
`Components/Input.qml` dosyasını düzenleyin.

### Adım 2: Login Button Gradient Bölümünü Bulun
```qml
gradient: Gradient {
    GradientStop { position: 0.0; color: "#667eea" }
    GradientStop { position: 1.0; color: "#764ba2" }
}
```

### Adım 3: Renkleri Değiştirin
```qml
// Örnek: Sunset Gradient
gradient: Gradient {
    GradientStop { position: 0.0; color: "#ff6b6b" }
    GradientStop { position: 0.5; color: "#ff8e53" }  // Orta renk (opsiyonel)
    GradientStop { position: 1.0; color: "#ffa07a" }
}
```

### Adım 4: Animasyon Rengi Güncelleyin
Hover/Press state'lerinde de gradient renklerini güncelleyin.

---

## 🌈 GRADIENT ARAÇLARI

Online gradient oluşturucu araçlar:

1. **CSS Gradient** - cssgradient.io
2. **Coolors** - coolors.co
3. **UI Gradients** - uigradients.com
4. **Gradient Hunt** - gradienthunt.com

---

## 💡 İPUÇLARI

### 1. Kontrast Önemli
- Koyu arka plan → Açık metin
- Accent rengi arka plandan belirgin olmalı
- WCAG AA standardına uyum sağlayın (4.5:1 kontrast)

### 2. Blur ile Uyum
- Yüksek blur (80-100) → Daha fazla karartma (DimBackgroundImage 0.6-0.8)
- Düşük blur (20-50) → Az karartma (0.3-0.5)

### 3. Renk Psikolojisi
- **Mavi**: Güven, profesyonellik
- **Mor**: Yaratıcılık, lüks
- **Yeşil**: Huzur, doğa
- **Kırmızı**: Enerji, tutku
- **Turuncu**: Sıcaklık, arkadaşlık

### 4. Test Edin
Farklı duvar kağıtlarıyla test edin:
- Karanlık duvar kağıdı
- Aydınlık duvar kağıdı
- Renkli duvar kağıdı

---

## 📦 HIZLI DEĞİŞTİRME

Terminalde hızlıca renk değiştirmek için:

```bash
cd /usr/share/sddm/themes/sddm-sugar-candy

# Cyberpunk Neon
sudo sed -i 's/AccentColor=.*/AccentColor="#00ff41"/' theme.conf
sudo sed -i 's/BackgroundColor=.*/BackgroundColor="#0d0208"/' theme.conf

# macOS Big Sur
sudo sed -i 's/AccentColor=.*/AccentColor="#007aff"/' theme.conf
sudo sed -i 's/BackgroundColor=.*/BackgroundColor="#1c1c1e"/' theme.conf

# SDDM'yi yeniden başlat
sudo systemctl restart sddm
```

---

**Favori paletinizi buldunuz mu? Kendi özel paletinizi oluşturun ve paylaşın! 🎨**
