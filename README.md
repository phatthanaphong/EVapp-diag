# EV Diagnostic Web App — Android (Release)

แอป Android สำหรับ EV OBD2 Diagnostic Training (Deepal L07/S07)  
Default theme: **สว่าง (Light)**

---

## ขั้นตอนที่ 1 — สร้าง Keystore (ทำครั้งเดียว)

รันคำสั่งนี้บนเครื่องที่ติดตั้ง Java แล้ว:

```bash
keytool -genkey -v \
  -keystore keystore.jks \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000 \
  -alias ev-diagnostic \
  -storepass YOUR_STORE_PASSWORD \
  -keypass YOUR_KEY_PASSWORD \
  -dname "CN=MQ Square, OU=EV Training, O=MQSquare, L=Bangkok, S=Bangkok, C=TH"
```

แล้วแปลงเป็น base64:
```bash
# macOS / Linux
base64 -w 0 keystore.jks

# Windows (PowerShell)
[Convert]::ToBase64String([IO.File]::ReadAllBytes("keystore.jks"))
```

---

## ขั้นตอนที่ 2 — ตั้งค่า GitHub Secrets

ไปที่ repo → **Settings → Secrets and variables → Actions → New repository secret**

| Secret Name        | ค่า                                      |
|--------------------|------------------------------------------|
| `KEYSTORE_BASE64`  | ผลลัพธ์จาก base64 ด้านบน                |
| `KEY_STORE_PASSWORD` | รหัสผ่าน store (YOUR_STORE_PASSWORD)  |
| `KEY_ALIAS`        | `ev-diagnostic`                          |
| `KEY_PASSWORD`     | รหัสผ่าน key (YOUR_KEY_PASSWORD)        |

---

## ขั้นตอนที่ 3 — Push ขึ้น GitHub

```bash
# ดาวน์โหลด gradle-wrapper.jar และ init git
chmod +x setup.sh && ./setup.sh

# เพิ่ม remote และ push
git remote add origin https://github.com/YOUR_USERNAME/ev-diagnostic-web.git
git push -u origin main
```

---

## ขั้นตอนที่ 4 — ดาวน์โหลด APK

1. ไปที่ **Actions** tab บน GitHub
2. รอ workflow ทำงาน (~6-8 นาที)
3. คลิก run ล่าสุด → **Artifacts** → ดาวน์โหลด `ev-diagnostic-release-N`
4. แตก zip → `app-release.apk`
5. ติดตั้งบน Android (เปิด Unknown sources ก่อน)

---

## ข้อแตกต่างจาก Flipbook version

| Feature              | Flipbook (debug)   | Web App (release)     |
|----------------------|--------------------|-----------------------|
| Default theme        | Dark               | **Light** ✅           |
| Layout               | Landscape flipbook | Portrait grid         |
| APK type             | Debug              | **Release (signed)**  |
| Exit button          | —                  | JS bridge → native    |
