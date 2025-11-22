# 1. ADIM: Minimal Başlangıç (Alpine Linux - Çok küçüktür)
FROM python:3.9-alpine

# 2. ADIM: Çalışma klasörünü ayarla
WORKDIR /app

# 3. ADIM: Önce ihtiyaç listesini kopyala ve yükle
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. ADIM: Kalan kodları kopyala
COPY . .

# 5. ADIM: GÜVENLİK! Root (Yönetici) kullanıcısı yerine standart kullanıcı aç.
# Bu, saldırganın konteyneri ele geçirse bile sisteme zarar vermesini engeller.
RUN adduser -D pythonuser
USER pythonuser

# 6. ADIM: Başlat
CMD ["python", "app.py"]