# Keycloak Docker Compose

ระบบการจัดการตัวตนและการรับรองความถูกต้อง (Identity and Access Management) โดยใช้ Keycloak บนแพลตฟอร์ม Docker Compose สำหรับสภาพแวดล้อมการพัฒนา ทดสอบ และผลิตภัณฑ์

## คำแนะนำการติดตั้งและเรียกใช้งาน

### ขั้นตอนที่ 1: เตรียมไฟล์การกำหนดค่า

1. **สร้างไฟล์ `.env`** จากไฟล์ตัวอย่าง `.env.example` (หากมี)
   ```bash
   cp .env.example .env
   ```
   
2. **แก้ไขไฟล์ `.env`** และตั้งค่าพารามิเตอร์สำคัญ เช่น:
   - `DB_VENDOR` - ประเภทฐานข้อมูล (PostgreSQL, MySQL, เป็นต้น)
   - `DB_ADDR` - ที่อยู่ฐานข้อมูล
   - `DB_PORT` - พอร์ตฐานข้อมูล
   - `DB_NAME` - ชื่อฐานข้อมูล
   - `DB_USER` - ชื่อผู้ใช้ฐานข้อมูล
   - `DB_PASSWORD` - รหัสผ่านฐานข้อมูล
   - `KC_BOOTSTRAP_ADMIN_USERNAME` - ชื่อผู้ดูแลระบบ Keycloak
   - `KC_BOOTSTRAP_ADMIN_PASSWORD` - รหัสผ่านผู้ดูแลระบบ


### ขั้นตอนที่ 2: เรียกใช้งาน Keycloak

1. **สร้างและเริ่มบริการ:**
   ```bash
   docker compose up -d --build
   ```
   - `-d` หมายถึงการทำงานในพื้นหลัง (detached mode)
   - `--build` จะสร้างภาพ Docker ใหม่ก่อนเรียกใช้งาน

2. **ตรวจสอบสถานะบริการ:**
   ```bash
   docker compose ps
   ```

3. **ดูบันทึกการทำงาน:**
   ```bash
   docker compose logs -f keycloak
   ```

### ขั้นตอนที่ 3: เข้าใช้งาน Keycloak

- http://localhost:8080

เข้าสู่ระบบด้วย:
- **Username:** ตามค่าที่ตั้งใน `KC_BOOTSTRAP_ADMIN_USERNAME`
- **Password:** ตามค่าที่ตั้งใน `KC_BOOTSTRAP_ADMIN_PASSWORD`

