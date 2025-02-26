<?php
$host = "localhost";
$user = "root";
$pass = "";
$db = "tiket_jihan";

// Perbaiki koneksi ke MySQL
$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
} else {
    // Koneksi berhasil
    // echo "Koneksi berhasil";
}
?>
