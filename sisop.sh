#!/bin/bash

# UAS - SISTEM OPERASI
# Nama  : Afifah Khoirunnisa
# NIM   : 2341720250
# Kelas : TI -1B

menu() {
    echo "SELAMAT DATANG DI APLIKASI FILE MASTER"
    echo "======================================"
    echo "Pilih salah satu fitur berikut"
    echo "- Management Direktori -"
    echo "1. Membuat direktori baru"
    echo "2. Melihat direktori dalam perangkat"
    echo "3. Membuat file baru"
    echo "4. Menghapus file"
    echo "5. Mengganti nama file/direktori"
    echo ""
    echo "- Management Perangkat -"
    echo "6. Memeriksa koneksi internet"
    echo "7. Menampilkan informasi sistem"
    echo "8. Menampilkan penggunaan disk"
    echo "9. Menampilkan penggunaan memori"
    echo "10. Menampilkan informasi CPU"
    echo "11. Menampilkan daftar proses yang sedang berjalan di sistem"
    echo "12. Menghitung uptime sistem."
    echo "13. Memeriksa update sistem."
    echo ""
    echo "0. Keluar"
}

membuat_direktori_baru() {
    read -p "Masukkan nama direktori baru: " dirnama
    mkdir "$dirnama"
    echo "Direktori '$dirnama' telah dibuat."
    echo ""
}

menampilkan_isi_direktori() {
    echo "Berikut adalah isi dari seluruh direktori: "
    ls
    echo ""
}

membuat_file_baru() {
    read -p "Masukkan nama file baru: " filename
    nano "$filename"
    echo ""
    if [ ! -f "$filename" ]; then
        echo "File tidak disimpan. Membatalkan pembuatan file baru."
    else
        echo "File berhasil dibuat: $filename"
    fi
}

menghapus_file() {
    read -p "Masukkan nama file yang ingin dihapus: " filename
    if [ -f "$filename" ]; then
        rm "$filename"
        echo "File '$filename' telah dihapus."
    else
        echo "File '$filename' tidak ditemukan."
    fi
    echo ""
}

mengganti_nama_file() {
    read -p "Masukkan nama file/direktori yang ingin diubah namanya: " oldname
    if [ -e "$oldname" ]; then
        read -p "Masukkan nama file/direktori baru: " newname
        mv "$oldname" "$newname"
        echo "Nama file/direktori '$oldname' telah diubah menjadi '$newname'."
    else
        echo "File/direktori '$oldname' tidak ditemukan."
    fi
    echo ""
}

memeriksa_koneksi_internet() {
    echo "Mengecek koneksi internet...."
    if ping -c 4 google.com; then
        echo ""
        echo "Koneksi internet OK"
    else
        echo ""
        echo "Koneksi internet gagal"
    fi
    echo ""
}

menampilkan_informasi_system() {
    echo "Informasi sistem: "
    uname -a
    echo ""
}

menampilkan_penggunaan_disk() {
    echo "Penggunaan disk: "
    df -h
    echo ""
}

menampilkan_penggunaan_memori() {
    echo "Penggunaan memori:"
    free -h
    echo ""
}

menampilkan_cpu_info() {
    echo "Informasi CPU:"
    lscpu
    echo ""
}

daftar_proses_berjalan(){
    echo "Daftar proses yang berjalan: "
    ps aux
    echo ""
}

menghitung_uptime_sistem(){
    echo "Uptime sistem:"
    cat /proc/uptime | awk '{print $1/3600 " jam"}'
    echo ""
}

memeriksa_update_sistem(){
    echo "Memeriksa pembaruan sistem..."
    sudo apt update
    sudo apt list --upgradable
    echo ""
}

echo "Selamat Datang di Aplikasi File Master"
echo "======================================"
echo "Aplikasi ini akan membantu Anda membuat dan memanajemen file/direktori" 
echo "menampilkan informasi mengenai perangkat Anda"
echo ""

while true; do
    menu
    read -p "Pilihan Anda: " choice
    case $choice in
        1) membuat_direktori_baru ;;
        2) menampilkan_isi_direktori ;;
        3) membuat_file_baru ;;
        4) menghapus_file ;;
        5) mengganti_nama_file ;;
        6) memeriksa_koneksi_internet ;;
        7) menampilkan_informasi_system ;;
        8) menampilkan_penggunaan_disk ;;
        9) menampilkan_penggunaan_memori ;;
        10) menampilkan_cpu_info ;;
        11) daftar_proses_berjalan ;;
        12) menghitung_uptime_sistem ;;
        13) memeriksa_update_sistem ;;
        0) break ;;
        *) echo "Pilihan tidak valid!" ;;
    esac
done
