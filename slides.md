---
title: Simulasi Containerized Workload Prediction Menggunakan Model SARIMA dengan Pendekatan AIOps
class: text-center
transition: view-transition
mdc: true
drawings:
  persist: false
fonts:
  sans: "Cerebri Sans Pro, Cerebri Sans, sans-serif"
  serif: "Cerebri Sans Pro, Cerebri Sans, sans-serif"
  mono: "Cerebri Sans Pro, Cerebri Sans, monospace"
  provider: none
---

# Simulasi Containerized Workload Prediction

## Menggunakan Model SARIMA dengan Pendekatan AIOps

**Achmad Fadil Nur Ramdhani**

SMKN 1 Cimahi

<p style="view-transition-name: judul-indostorage" class="font-bold text-2xl text-blue-700">PT Indostorage Solusi Teknologi</p>

---
layout: two-cols
layoutClass: gap-12
---

<h1 style="view-transition-name: judul-indostorage">PT Indostorage Solusi Teknologi</h1>

<!-- Muncul saat klik pertama -->
<img src="./images/indostorageGedung.jpg" class="w-full h-78 object-cover rounded-xl shadow-md my-4 border border-gray-200" alt="Gedung PT Indostorage" />
<p class="text-sm">Jl. Pramuka Raya, Mampang, Kec. Pancoran Mas, Kota Depok, Jawa Barat</p>

::right::

<!-- Muncul saat klik kedua -->
<div v-click class="feature-card-no-ts flex-col gap-4">
  <p>
    PT Indostorage Solusi Teknologi adalah perusahaan yang bergerak di bidang konsultasi teknologi informasi dan integrasi sistem. Perusahaan ini berkomitmen membantu organisasi dalam merancang, mengembangkan, serta menerapkan solusi teknologi yang tepat guna. Tujuannya adalah meningkatkan efisiensi operasional dan mendukung proses transformasi digital klien.
  </p>
  <p>
    PT Indostorage Solusi Teknologi memiliki kompetensi di berbagai bidang, seperti infrastruktur TI, kecerdasan buatan, analitik data, pengembangan aplikasi, komputasi awan, keamanan siber, dan integrasi sistem. 
  </p>
</div>

---
layout: two-cols
layoutClass: gap-10

---

<h1>Latar Belakang</h1>

<div class="grid grid-cols-1 gap-4">
  <div v-click="[1]" class="feature-card">
    Perkembangan teknologi yang cepat
  </div>
  <div v-click="[2]" class="feature-card">
    Sistem harus efisien & otomatis
  </div>
  <div v-click="[3]" class="feature-card">
    Kubernetes
  </div>
</div>

::right::

<div class="relative w-full min-h-[400px]">
  <!-- Kelompok 1: Chart dan Teks (Klik 1) -->
  <div v-click="[1]" class="absolute inset-0 flex flex-col items-center justify-start gap-4">
    <!-- Chart -->
    <div class="h-80 w-full max-w-3xl">
      <Chart
        type="bar"
        :data="{
          labels: ['2020','2021','2022','2023','2024','2025'],
          datasets: [{
            label: 'Persen',
            data: [71, 77, 81, 84, 87, 90],
            backgroundColor: '#007bffff'
          }]
        }"
        :options="{
          responsive: true,
          maintainAspectRatio: false,
          plugins: { legend: { display: false }, tooltip: { enabled: true } },
          scales: { y: { beginAtZero: true, max: 100 }, x: { grid: { display: false } } },
          animation: { duration: 1000, easing: 'easeOutBounce' }
        }"
      />
    </div>
    <p>
      Berdasarkan data Komdigi (per April 2026), sebanyak 89 persen atau sekitar 167 juta penduduk Indonesia sudah menggunakan smartphone.
    </p>
  </div>
  <div class="absolute inset-0 flex items-center justify-center">
    <SlidevVideo
      v-click="2"
      autoplay
      controls
      class="max-h-full w-full max-w-3xl rounded-lg object-contain shadow-md"
    >
      <source src="./video/latarBelakang.mp4" type="video/mp4" />
    </SlidevVideo>
  </div>
</div>

---

# Tujuan
<div class="grid grid-cols-1 gap-4">
  <div v-click="[1]" class="feature-card">
    Merancang dan menyimulasikan sistem observabilitas pada lingkungan Kubernetes untuk mengumpulkan metrik aplikasi kontainer menggunakan Prometheus dan Grafana.
  </div>
  <div v-click="[2]" class="feature-card">
    Melakukan analisis deret waktu terhadap metrik beban kerja kontainer dan membangun model prediksi menggunakan model SARIMA.
  </div>
  <div v-click="[3]" class="feature-card">
    Mengembangkan alur kerja AIOps yang mengintegrasikan hasil prediksi model SARIMA ke dalam mekanisme penskalaan Kubernetes menggunakan skrip Python.
  </div>
</div>
---

<h1>Batasan Masalah</h1>

<div class="text-sm">
  <ul>
    <li>Penulis membangun dan menguji seluruh kebutuhan sistem pada server Research & Development milik PT. Indostorage Solusi Teknologi.</li>
    <li>Infrastruktur server menggunakan sistem operasi Ubuntu 22.04.5 LTS dan diimplementasikan pada satu klaster Kubernetes berbasis RKE2 dengan spesifikasi 1 Node, ditambah 1 Node terpisah untuk simulasi permintaan.</li>
    <li>Aplikasi yang digunakan sebagai target prediksi adalah Nginx.</li>
    <li>Perangkat lunak K6 digunakan untuk membuat simulasi permintaan ke aplikasi Nginx, dan tidak mencakup stress test ekstrem atau failure testing.</li>
    <li>Akses ke layanan Grafana, Prometheus, dan Nginx diekspos menggunakan Ingress.</li>
    <li>Fokus simulasi model SARIMA terbatas pada prediksi satu metrik spesifik, yaitu metrik permintaan HTTP Nginx dari data observabilitas.</li>
    <li>Metode prediksi yang digunakan hanya model SARIMA, tanpa melakukan perbandingan dengan model pembelajaran mesin atau prediksi lain.</li>
    <li>Data metrik diambil melalui Prometheus dalam interval 15 detik.</li>
    <li>Penelitian tidak mencakup domain AIOps lain—seperti anomaly detection, log correlation, root cause analysis, atau incident remediation.</li>
  </ul>
</div>

---

<h1>Topologi Jaringan</h1>
<img src="./images/Topologi.png" alt="Topologi" class="w-auto h-100 object-cover feature-card-no-ts" />

---

<h1>Diagram Arsitektur</h1>
<img src="./images/diagramArsitektur.png" alt="Diagram Arsitektur" class="w-auto h-100 object-cover rounded-xl shadow-md my-4 border border-gray-200" />

---

<h1>Diagram Workflow</h1>
<img src="./images/workflow.png" alt="Workflow" class="w-auto h-100 object-cover feature-card-no-ts" />

---

<h1>Langkah Kerja</h1>

<div>
  <ul>
    <li>Akses dan Persiapan Lingkungan Virtual Machine</li>
    <li>Pembangunan Klaster Kubernetes</li>
    <li>Instalasi Lingkungan Pengujian dan Pengembangan</li>
    <li>Simulasi Layanan Web dan Sistem Pemantauan</li>
    <li>Konfigurasi Integrasi Antar Komponen Sistem</li>
    <li>Pelaksanaan Pengujian Beban Menggunakan K6</li>
    <li>Pengolahan dan Analisis Data Permintaan</li>
    <li>Pelatihan Model Prediksi Menggunakan SARIMA</li>
  </ul>
</div>

---

<h1>Akses dan Persiapan Lingkungan Virtual Machine dan Pembangunan Klaster Kubernetes</h1>

<div class="relative mx-auto mt-8 w-full max-w-5xl min-h-[320px]">
  <div v-click="[1,2]" class="absolute inset-0 flex items-center justify-center gap-6">
    <div class="feature-card-no-ts !border-orange-500 !bg-transparent !px-14 !py-10 !text-3xl !text-orange-500">
      Ubuntu
      <p class="text-sm text-center">10.10.51.231</p>
    </div>
    <div class="feature-card-no-ts !border-orange-500 !bg-transparent !px-14 !py-10 !text-3xl !text-orange-500">
      Ubuntu
      <p class="text-sm text-center">10.10.51.232</p>
    </div>
    <div class="feature-card-no-ts !border-orange-500 !bg-transparent !px-14 !py-10 !text-3xl !text-orange-500">
      Ubuntu
      <p class="text-sm text-center">10.10.51.233</p>
    </div>
  </div>

  <div v-click="2" class="absolute inset-0 flex items-center justify-center">
    <div class="feature-card-no-ts !border-cyan-500 !bg-transparent !px-8 !py-6">
      <h2 class="mb-6 text-center !text-4xl !text-[#015fdb]">Kubernetes</h2>
      <div class="flex items-center justify-center gap-6">
        <div class="feature-card-no-ts !border-orange-500 !bg-transparent !px-14 !py-10 !text-3xl !text-orange-500">
          Ubuntu
          <p class="text-sm text-center">10.10.51.231</p>
        </div>
        <div class="feature-card-no-ts !border-orange-500 !bg-transparent !px-14 !py-10 !text-3xl !text-orange-500">
          Ubuntu
          <p class="text-sm text-center">10.10.51.232</p>
        </div>
        <div class="feature-card-no-ts !border-orange-500 !bg-transparent !px-14 !py-10 !text-3xl !text-orange-500">
          Ubuntu
          <p class="text-sm text-center">10.10.51.233</p>
        </div>
      </div>
    </div>
  </div>
</div>
---

<h1>Instalasi Lingkungan Pengujian dan Pengembangan</h1>
<div class="grid grid-cols-2 gap-4 mt-15">
    <div class="feature-card-no-ts !border-orange-500 !bg-transparent !px-14 !py-10 !text-3xl !text-orange-500 text-center">
      Ubuntu
      <p class="text-sm text-center">10.10.51.231</p>
      <img v-click="1" src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1280px-Python-logo-notext.svg.png" alt="Python" class="w-10 h-10 mx-auto" />
    </div>
    <div class="feature-card-no-ts !border-orange-500 !bg-transparent !px-14 !py-10 !text-3xl !text-orange-500 text-center">
      Ubuntu
      <p class="text-sm text-center">10.10.51.232</p>
      <img v-click="2" src="https://grafana.com/media/docs/k6/GrafanaLogo_k6_orange_icon.svg" alt="Grafana" class="w-10 h-10 mx-auto" />
    </div>
</div>
---

<h1>Simulasi Layanan Web dan Sistem Pemantauan</h1>

<div class="feature-card-no-ts mt-15">
<h2 class="mb-6 text-center !text-4xl !text-[#015fdb]">Kubernetes</h2>
<div class="feature-class">
</div>
---

# Terima Kasih
## Tanya Jawab

<div class="pt-6 text-sm opacity-70">
Achmad Fadil Nur Ramdhani
</div>
