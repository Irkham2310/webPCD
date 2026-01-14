# Menggunakan base image Python 3.13 versi slim agar lebih ringan
FROM python:3.13-slim

# Menghindari pembuatan file .pyc dan memastikan log muncul secara real-time
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set direktori kerja di dalam container
WORKDIR /app

# Instalasi dependencies sistem yang mungkin dibutuhkan library PCD/AI
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Copy file requirements dan instal library
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy seluruh file project ke dalam container
COPY . .

# Port default Django
EXPOSE 8000

# Jalankan Django menggunakan Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "config.wsgi"]
