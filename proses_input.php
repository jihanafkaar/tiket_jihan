<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

</body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</html>
<?php
include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $nama_film = $_POST['nama_film'];
    $judul = $_POST['judul'];
    $usia = (int) $_POST['usia'];
    $genre = $_POST['genre'];
    $menit = (int) $_POST['menit'];
    $dimensi = $_POST['dimensi'];
    $producer = $_POST['producer'];
    $director = $_POST['director'];
    $writer = $_POST['writer'];
    $cast = $_POST['cast'];
    $distributor = $_POST['distributor'];
    $harga = (int) $_POST['harga'];

    function uploadFile($file, $target_dir, $allowed_types, $max_size)
    {
        $target_file = $target_dir . basename($file["name"]);
        $file_type = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        $check = getimagesize($file["tmp_name"]);

        if ($check === false && !in_array($file_type, ['mp4', 'avi', 'mov', 'wmv'])) {
            return [false, "File bukan gambar atau video yang diperbolehkan."];
        }

        if ($file["size"] > $max_size) {
            return [false, "Ukuran file terlalu besar."];
        }

        if (!in_array($file_type, $allowed_types)) {
            return [false, "Format file tidak diperbolehkan."];
        }

        if (move_uploaded_file($file["tmp_name"], $target_file)) {
            return [true, $target_file];
        } else {
            return [false, "Gagal mengupload file."];
        }
    }

    list($uploadPoster, $posterPath) = uploadFile($_FILES['poster'], "uploads/poster/", ['jpg', 'jpeg', 'png', 'gif'], 500000);
    list($uploadBanner, $bannerPath) = uploadFile($_FILES['banner'], "uploads/banner/", ['jpg', 'jpeg', 'png', 'gif'], 500000);
    list($uploadTrailer, $trailerPath) = uploadFile($_FILES['trailer'], "uploads/trailer/", ['mp4', 'avi', 'mov', 'wmv'], 50000000);

    if ($uploadPoster && $uploadBanner && $uploadTrailer) {
        $stmt = $conn->prepare("INSERT INTO film (poster, trailer, banner, nama_film, judul, total_menit, usia, genre, dimensi, Producer, Director, Writer, Cast, Distributor, harga) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssssiisssssssi", $posterPath, $trailerPath, $bannerPath, $nama_film, $judul, $menit, $usia, $genre, $dimensi, $producer, $director, $writer, $cast, $distributor, $harga);

        if ($stmt->execute()) {
            echo "<script>Swal.fire({
                title: 'Berhasil!',
                text: 'Data Film Berhasil Ditambahkan!',
                icon: 'success',
                timer: 3000,
                showConfirmButton: false
            }).then(() => {
                window.location.href = 'admin/data_film.php';
            });</script>";
        } else {
            echo "Error: " . $stmt->error;
        }
        $stmt->close();
    } else {
        echo "<script>Swal.fire({
            title: 'Gagal!',
            text: '" . ($uploadPoster ? ($uploadBanner ? $trailerPath : $bannerPath) : $posterPath) . "',
            icon: 'error'
        });</script>";
    }

    $conn->close();
}
?>