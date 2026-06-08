#!/bin/bash
echo "🔧 ดาวน์โหลด Gradle Wrapper JAR..."
mkdir -p gradle/wrapper
curl -fsSL -o gradle/wrapper/gradle-wrapper.jar \
  https://raw.githubusercontent.com/gradle/gradle/v8.4.0/gradle/wrapper/gradle-wrapper.jar
chmod +x gradlew
echo "✅ Gradle พร้อมแล้ว"

git init
git add .
git commit -m "Initial commit: EV Diagnostic Web App (Release, Light theme)"
git branch -M main
echo ""
echo "✅ Git พร้อมแล้ว"
echo "➡️  ขั้นต่อไป: ตั้งค่า GitHub Secrets ตาม README.md แล้ว push"
