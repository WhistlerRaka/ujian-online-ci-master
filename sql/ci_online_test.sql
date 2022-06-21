-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jun 2022 pada 03.32
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_online_test`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `nip` char(12) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `matkul_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nip`, `nama_dosen`, `email`, `matkul_id`) VALUES
(1, '12345678', 'Guru Bahasa Inggris SD', 'gurusd@kkn.com', 1),
(2, '123456789', 'Guru Bahasa Inggris SMP', 'gurusmp@kkn.com', 2),
(3, '1122334455', 'Arek Teknik', 'teknik@kkn.com', 1);

--
-- Trigger `dosen`
--
DELIMITER $$
CREATE TRIGGER `edit_user_dosen` BEFORE UPDATE ON `dosen` FOR EACH ROW UPDATE `users` SET `email` = NEW.email, `username` = NEW.nip WHERE `users`.`username` = OLD.nip
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hapus_user_dosen` BEFORE DELETE ON `dosen` FOR EACH ROW DELETE FROM `users` WHERE `users`.`username` = OLD.nip
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'dosen', 'Pembuat Soal dan ujian'),
(3, 'mahasiswa', 'Peserta Ujian');

-- --------------------------------------------------------

--
-- Struktur dari tabel `h_ujian`
--

CREATE TABLE `h_ujian` (
  `id` int(11) NOT NULL,
  `ujian_id` int(11) NOT NULL,
  `mahasiswa_id` int(11) NOT NULL,
  `list_soal` longtext NOT NULL,
  `list_jawaban` longtext NOT NULL,
  `jml_benar` int(11) NOT NULL,
  `nilai` decimal(10,2) NOT NULL,
  `nilai_bobot` decimal(10,2) NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `status` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `h_ujian`
--

INSERT INTO `h_ujian` (`id`, `ujian_id`, `mahasiswa_id`, `list_soal`, `list_jawaban`, `jml_benar`, `nilai`, `nilai_bobot`, `tgl_mulai`, `tgl_selesai`, `status`) VALUES
(1, 1, 4, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', '1:B:N,2:C:N,3:A:N,4:B:N,5:C:N,6:A:N,7:C:N,8:C:N,9:A:N,10:B:N,11:A:N,12:B:N,13:B:N,14:A:N,15:B:N,16:B:N,17:B:N,18:C:N,19:B:N,20:A:N', 20, '100.00', '500.00', '2022-06-14 23:37:19', '2022-06-15 00:37:19', 'N'),
(2, 1, 56, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', '1:A:N,2:B:N,3:B:N,4:B:N,5:A:N,6:A:N,7:B:N,8:A:N,9::N,10::N,11::N,12::N,13::N,14::N,15::N,16::N,17::N,18::N,19::N,20::N', 2, '10.00', '500.00', '2022-06-15 20:48:11', '2022-06-15 21:48:11', 'N'),
(3, 3, 56, '15,17', '15:D:N,17:E:N', 0, '0.00', '500.00', '2022-06-15 20:51:00', '2022-06-15 20:56:00', 'N'),
(4, 1, 51, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', '1:A:N,2::N,3::N,4::N,5::N,6::N,7::N,8::N,9::N,10::N,11::N,12::N,13::N,14::N,15::N,16::N,17::N,18::N,19::N,20::N', 0, '0.00', '0.00', '2022-06-15 21:47:44', '2022-06-15 22:47:44', 'Y'),
(5, 1, 39, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', '1:B:N,2:A:N,3:C:N,4:B:N,5:A:N,6:A:N,7:C:N,8:C:N,9:A:N,10:B:N,11:A:N,12:B:N,13:B:N,14:A:N,15:B:N,16:B:N,17:B:N,18:C:N,19:B:N,20:A:N', 17, '85.00', '500.00', '2022-06-15 21:49:00', '2022-06-15 22:49:00', 'N'),
(6, 1, 47, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', '1:B:N,2:B:N,3:A:N,4:B:N,5:B:N,6:A:N,7:C:N,8:C:N,9:C:N,10:C:N,11:A:N,12:B:N,13:B:N,14:A:N,15:C:N,16:B:N,17:B:N,18:B:N,19:C:N,20:B:N', 12, '60.00', '500.00', '2022-06-15 21:49:51', '2022-06-15 22:49:51', 'N'),
(7, 1, 48, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', '1:A:N,2:A:N,3:A:N,4:C:N,5:B:N,6:A:N,7:C:N,8:C:N,9:A:N,10:B:N,11:A:N,12:B:N,13:B:N,14:A:N,15:B:N,16:B:N,17:B:N,18:C:N,19:B:N,20:A:N', 16, '80.00', '500.00', '2022-06-15 21:49:56', '2022-06-15 22:49:56', 'N'),
(8, 1, 43, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', '1:C:Y,2:A:N,3:A:N,4:A:N,5:D:N,6:A:N,7:C:N,8:C:N,9:A:N,10:B:N,11:A:N,12:B:N,13:B:N,14:A:N,15:B:N,16:B:N,17:B:N,18:B:N,19:C:N,20:A:N', 14, '70.00', '500.00', '2022-06-15 21:50:00', '2022-06-15 22:50:00', 'N'),
(9, 1, 36, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', '1:B:N,2:C:N,3:A:N,4:A:N,5:B:N,6:A:N,7:C:N,8:C:N,9:A:N,10:B:N,11:A:N,12:B:N,13:B:N,14:A:N,15:B:N,16:B:N,17:B:N,18:C:N,19:B:N,20:A:N', 18, '90.00', '500.00', '2022-06-15 21:50:39', '2022-06-15 22:50:39', 'N'),
(10, 1, 38, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', '1:A:N,2:C:N,3:B:N,4:B:N,5:A:N,6:B:N,7:B:N,8:B:N,9:C:N,10:B:N,11:C:N,12:B:N,13:B:N,14:C:N,15:B:N,16:C:N,17:B:N,18:D:N,19:E:N,20:D:N', 7, '35.00', '500.00', '2022-06-15 21:50:48', '2022-06-15 22:50:48', 'N'),
(11, 1, 44, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', '1:A:N,2:A:N,3:A:N,4:A:N,5:A:N,6:A:N,7:C:N,8:C:N,9:A:N,10:B:N,11:A:N,12:B:N,13:A:N,14:A:N,15:B:N,16:B:N,17:B:N,18:C:N,19:B:N,20:A:N', 15, '75.00', '500.00', '2022-06-15 21:51:13', '2022-06-15 22:51:13', 'N'),
(12, 1, 46, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', '1:C:N,2:C:N,3:B:N,4:C:N,5:C:N,6:B:N,7:A:N,8:B:N,9:C:N,10:B:N,11:B:N,12:C:N,13:C:N,14:B:N,15:C:N,16:B:N,17:C:N,18:B:N,19:C:N,20::N', 4, '20.00', '500.00', '2022-06-15 21:51:18', '2022-06-15 22:51:18', 'N'),
(13, 1, 37, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', '1:C:N,2:A:N,3:A:N,4:A:N,5:B:N,6:A:N,7:C:N,8:C:N,9:A:N,10:B:N,11:C:N,12:C:N,13:C:N,14:C:N,15:C:N,16:C:N,17:C:N,18:C:N,19:C:N,20:C:N', 7, '35.00', '500.00', '2022-06-15 21:51:40', '2022-06-15 22:51:40', 'N'),
(14, 1, 50, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', '1:D:N,2:C:N,3:A:N,4:A:N,5:B:N,6:A:N,7:C:N,8:C:N,9:A:N,10:B:N,11:A:N,12:B:N,13:B:N,14:A:N,15:B:N,16:B:N,17:A:N,18:C:N,19:B:N,20:A:N', 16, '80.00', '500.00', '2022-06-15 21:55:10', '2022-06-15 22:55:10', 'N');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
(1, 'Kampoeng Semanggi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan_matkul`
--

CREATE TABLE `jurusan_matkul` (
  `id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `jurusan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `jurusan_matkul`
--

INSERT INTO `jurusan_matkul` (`id`, `matkul_id`, `jurusan_id`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(30) NOT NULL,
  `jurusan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `jurusan_id`) VALUES
(1, 'SD', 1),
(2, 'SMP', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas_dosen`
--

CREATE TABLE `kelas_dosen` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kelas_dosen`
--

INSERT INTO `kelas_dosen` (`id`, `kelas_id`, `dosen_id`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(30, '::1', 'bagus@kkn.com', 1655278307),
(31, '::1', 'bagus@kkn.com', 1655278324),
(32, '::1', 'bagus@kkn.com', 1655278345),
(33, '::1', 'mzidan@kkn.com', 1655278624),
(35, '::1', 'rizky@kkn.co', 1655279161),
(42, '::1', 'admi@admin.com', 1655303844),
(43, '172.16.80.1', 'taufiknurrahman88@gmail.com', 1655304246),
(44, '::1', 'gurusd@kkn.com', 1655304251),
(45, '172.16.80.1', 'iqbal@kkn.com', 1655304345),
(46, '172.16.80.1', 'iqbal@kkn.com', 1655304375),
(47, '172.16.80.1', 'iqbal@kkn.com', 1655304431);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nim` char(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `kelas_id` int(11) NOT NULL COMMENT 'kelas&jurusan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nama`, `nim`, `email`, `jenis_kelamin`, `kelas_id`) VALUES
(4, 'Saya Siswa SD', '0102030405', 'siswasd@kkn.com', 'L', 1),
(5, 'M. ZIDAN AL HAFIZH', '18082013', 'zidan@kkn.com', 'L', 1),
(6, 'BUNGA ROSALITA', '31032013', 'bunga@kkn.com', 'P', 1),
(7, 'FABIO DIEGO PUTRA', '14062012', 'fabio@kkn.com', 'L', 1),
(8, 'VIA DWI SAFIRA', '21032011', 'via@kkn.com', 'P', 1),
(9, 'FAIZAL FARDANI', '10092006', 'faizal@kkn.com', 'L', 2),
(10, 'MUHAMMAD DWI ALI', '08112006', 'mdwi@kkn.com', 'L', 2),
(11, 'KRISNA SAYYIDANA PRIANTO', '28042006', 'krisna@kkn.com', 'L', 2),
(12, 'SHAFABIE SALSABELLA PRIANTO', '27022009', 'shafabie@kkn.com', 'P', 1),
(13, 'SALWA BAHITY OVY PRIANTO', '10092010', 'salwa@kkn.com', 'P', 1),
(14, 'ERNAWATI', '28022012', 'ernawati@kkn.com', 'P', 1),
(15, 'MAYLANI REVALIA', '26052013', 'maylani@kkn.com', 'P', 1),
(16, 'KIRANIA SHALINA PUTRI', '13072008', 'kirania@kkn.com', 'P', 1),
(17, 'ALIF ARVIANSYAH', '28052013', 'alif@kkn.com', 'L', 1),
(18, 'DZAKIRA ALMEERA PUTRI ARDIANA', '29102012', 'dzakira@kkn.com', 'P', 1),
(19, 'YOGA SAPUTRA', '22042010', 'yoga@kkn.com', 'L', 1),
(20, 'YOLA SAPUTRI', '220420100', 'yola@kkn.com', 'P', 1),
(21, 'AQILA NAVIZA ZAHRA', '20052013', 'aqila@kkn.com', 'P', 1),
(22, 'FARA AMELIA NATASHA', '13032009', 'fara@kkn.com', 'P', 1),
(23, 'DWI RATNA SARI', '08052008', 'dwi@kkn.com', 'P', 1),
(24, 'ADINDA ZASKIA NURHABIBAH', '24122009', 'adinda@kkn.com', 'P', 1),
(25, 'JIHAN MUJAZARA HERAWATI', '04062013', 'jihan@kkn.com', 'P', 1),
(26, 'ANINDI NOVITA ANDRIANI', '11122014', 'anindi@kkn.com', 'P', 1),
(27, 'MOCH. RASYA RAMADHAN', '27082009', 'mrasya@kkn.com', 'L', 1),
(28, 'SHABILLA KHANZANIA AZZAHWA', '22072013', 'shabilla@kkn.com', 'P', 1),
(29, 'YEMIMA KEZIA PRAMUDITA PRAMONO', '28042008', 'yemima@kkn.com', 'P', 1),
(30, 'JOHANA ARETHA PUTRI PRAMONO', '01072012', 'johana@kkn.com', 'P', 1),
(31, 'ANINDA SAFATUS ZAHRA', '09102009', 'aninda@kkn.com', 'P', 1),
(32, 'NAFISA MUTIARA WIBOWO', '19082014', 'nafisa@kkn.com', 'P', 1),
(33, 'THALITA ANGELINA PUTRI RAMADHANI', '24072012', 'thalita@kkn.com', 'P', 1),
(34, 'REFHAN FAICHAL PUTRA PURNAMA', '23062010', 'refhan@kkn.com', 'L', 2),
(35, 'Saya Siswa SMP', '010203040506', 'siswasmp@kkn.com', 'L', 2),
(36, 'TAUFIK NUR RAHMAN', '19071020', 'taufik@kkn.com', 'L', 1),
(37, 'REZA NOER SYAFA\' AH', '19071006', 'reza@kkn.com', 'P', 1),
(38, 'IKA ALIYATUR ROFI\' AH', '19071003', 'ika@kkn.com', 'P', 1),
(39, 'MEOKBUN WIHELMINA ANASTASYA', '19071008', 'meokbun@kkn.com', 'P', 1),
(41, 'VIO JHONDAN PRASETIO', '19053010', 'vio@kkn.com', 'L', 1),
(43, 'DIAZ DAITA LARAS', '19071005', 'diaz@kkn.com', 'P', 1),
(44, 'SALSABYLA QURROTUN A\' YUN', '19071019', 'salsabyla@kkn.com', 'P', 1),
(45, 'IRZA PUTRA ALAMSYAH', '19053022', 'irza@kkn.com', 'L', 1),
(46, 'MOCHAMAD IQBAL ROMADHON', '19071021', 'miqbal@kkn.com', 'L', 1),
(47, 'SITI FATIMAH', '19071002', 'siti@kkn.com', 'P', 1),
(48, 'ALIP NUR LAILA', '19071001', 'alip@kkn.com', 'P', 1),
(49, 'WHISTLER RAKA PRATAMA L', '19053034', 'raka@kkn.com', 'L', 1),
(50, 'MARTHA LIAM', '19071010', 'martha@kkn.com', 'P', 1),
(51, 'NURMA YUNITA', '19053006', 'nurmay@kkn.com', 'P', 1),
(53, 'BAGUS SETYAWAN', '19053033', 'baguss@kkn.com', 'L', 1),
(54, 'MOHAMMAD RIZKY', '19053020', 'rizky@kkn.com', 'L', 1),
(56, 'Shelly A', '010101001', 'shelly@kkn.com', 'L', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `matkul`
--

CREATE TABLE `matkul` (
  `id_matkul` int(11) NOT NULL,
  `nama_matkul` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `matkul`
--

INSERT INTO `matkul` (`id_matkul`, `nama_matkul`) VALUES
(1, 'Bahasa Inggris SD'),
(2, 'Bahasa Inggris SMP');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_ujian`
--

CREATE TABLE `m_ujian` (
  `id_ujian` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `nama_ujian` varchar(200) NOT NULL,
  `jumlah_soal` int(11) NOT NULL,
  `waktu` int(11) NOT NULL,
  `jenis` enum('acak','urut') NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `terlambat` datetime NOT NULL,
  `token` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `m_ujian`
--

INSERT INTO `m_ujian` (`id_ujian`, `dosen_id`, `matkul_id`, `nama_ujian`, `jumlah_soal`, `waktu`, `jenis`, `tgl_mulai`, `terlambat`, `token`) VALUES
(1, 1, 1, 'Trial Error Pre Test SD', 20, 60, 'urut', '2022-06-14 05:23:47', '2022-06-16 23:23:59', 'UHRKM'),
(2, 2, 2, 'Trial Error Pre Test SMP', 20, 60, 'urut', '2022-06-15 13:03:23', '2022-06-16 13:03:28', 'IVXCS'),
(3, 1, 1, 'NN', 2, 5, 'acak', '2022-06-15 20:50:26', '2022-06-16 20:50:28', 'QBEPR');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_soal`
--

CREATE TABLE `tb_soal` (
  `id_soal` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `bobot` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tipe_file` varchar(50) NOT NULL,
  `soal` longtext NOT NULL,
  `opsi_a` longtext NOT NULL,
  `opsi_b` longtext NOT NULL,
  `opsi_c` longtext NOT NULL,
  `opsi_d` longtext NOT NULL,
  `opsi_e` longtext NOT NULL,
  `file_a` varchar(255) NOT NULL,
  `file_b` varchar(255) NOT NULL,
  `file_c` varchar(255) NOT NULL,
  `file_d` varchar(255) NOT NULL,
  `file_e` varchar(255) NOT NULL,
  `jawaban` varchar(5) NOT NULL,
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_soal`
--

INSERT INTO `tb_soal` (`id_soal`, `dosen_id`, `matkul_id`, `bobot`, `file`, `tipe_file`, `soal`, `opsi_a`, `opsi_b`, `opsi_c`, `opsi_d`, `opsi_e`, `file_a`, `file_b`, `file_c`, `file_d`, `file_e`, `jawaban`, `created_on`, `updated_on`) VALUES
(1, 1, 1, 5, '', '', '<p class=\"MsoListParagraph\" xss=removed><span lang=\"EN-ID\" xss=removed>What month is this month? This month\r\nis....<o></o></span></p>', '<p><span lang=\"EN-ID\" xss=removed>January</span><br></p>', '<p><span lang=\"EN-ID\" xss=removed><font color=\"#000000\" xss=removed>February</font></span><br></p>', '<p><span lang=\"EN-ID\" xss=removed>March</span><br></p>', '', '', '', '', '', '', '', 'B', 1655222834, 1655222834),
(2, 1, 1, 5, '', '', '<p class=\"MsoListParagraph\" xss=removed><span lang=\"EN-ID\" xss=removed>How is Dion?  Dion is very....<o></o></span></p>', '<p>Sad</p>', '<p>Hungry </p>', '<p>Happy</p>', '', '', '', '', '', '', '', 'C', 1655222916, 1655222916),
(3, 1, 1, 5, '', '', '<p class=\"MsoListParagraph\" xss=removed><span lang=\"EN-ID\" xss=removed>Where does Jane’s mother\r\ncook?<o></o></span></p>', '<p>Kitchen</p>', '<p>Bedroom</p>', '<p>Bathroom</p>', '', '', '', '', '', '', '', 'A', 1655222978, 1655222978),
(4, 1, 1, 5, '', '', '<p class=\"MsoListParagraph\" xss=\"removed\"><span lang=\"EN-ID\" xss=\"removed\">How many bedrooms are\r\nthere in the house?<o></o></span></p>', '<p>Three</p>', '<p>Four</p>', '<p>Five</p>', '', '', '', '', '', '', '', 'B', 1655223019, 1655223180),
(5, 1, 1, 5, '', '', '<p class=\"MsoListParagraph\" xss=removed><span lang=\"EN-ID\" xss=removed>What is next to the\r\nkitchen?<o></o></span></p>', '<p>Living room</p>', '<p>Bathroom</p>', '<p>Bedroom</p>', '', '', '', '', '', '', '', 'C', 1655223049, 1655223049),
(6, 1, 1, 5, '', '', '<p class=\"MsoListParagraphCxSpFirst\" xss=\"removed\"><span lang=\"EN-ID\" xss=\"removed\">Nadin       :\r\n\"Hello Chandra, how are you?\" </span></p><p class=\"MsoListParagraphCxSpFirst\" xss=\"removed\">Chandra   : \"....\"</p>', '<p>I\'m fine thank you</p>', '<p>Good bye</p>', '<p>Good morning</p>', '', '', '', '', '', '', '', 'A', 1655223115, 1655225541),
(7, 1, 1, 5, '', '', '<p class=\"MsoListParagraphCxSpFirst\" xss=\"removed\"><span lang=\"EN-ID\" xss=\"removed\">Teacher     :\r\n\"Good bye students.\" </span></p><p class=\"MsoListParagraphCxSpFirst\" xss=\"removed\">Students   : \"....\"</p>', '<p>Good morning teacher</p>', '<p>good afternoon teacher</p>', '<p>Good bye teacher</p>', '', '', '', '', '', '', '', 'C', 1655223261, 1655225556),
(8, 1, 1, 5, '', '', '<p class=\"MsoListParagraphCxSpFirst\" xss=removed><span lang=\"EN-ID\" xss=removed>Nisa          :\r\n\"Excuse me, what is your name?\" <o></o></span></p><p>\r\n\r\n</p><p class=\"MsoListParagraphCxSpLast\" xss=removed><span lang=\"EN-ID\" xss=removed>Nira          : \"...... is Nira.\"<o></o></span></p>', '<p>Hello</p>', '<p>I\'m fine</p>', '<p>My name</p>', '', '', '', '', '', '', '', 'C', 1655223304, 1655223304),
(9, 1, 1, 5, '', '', '<p>The sky is</p>', '<p>Blue</p>', '<p>red</p>', '<p>yellow</p>', '', '', '', '', '', '', '', 'A', 1655223352, 1655223352),
(10, 1, 1, 5, '', '', '<p><span lang=\"EN-ID\" xss=removed>My hair is.... (hitam) </span><br></p>', '<p>purple</p>', '<p>black</p>', '<p>yellow</p>', '', '', '', '', '', '', '', 'B', 1655223389, 1655223389),
(11, 1, 1, 5, '', '', '<p><span lang=\"EN-ID\" xss=removed>Banana is.... (kuning)  </span><br></p>', '<p>Yellow</p>', '<p>black</p>', '<p>blue</p>', '', '', '', '', '', '', '', 'A', 1655223413, 1655223413),
(12, 1, 1, 5, '', '', '<p><span lang=\"EN-ID\" xss=removed>We meet Mr.Benny in the morning. We say\r\n....   </span><br></p>', '<p>Good bye</p>', '<p>Good morning</p>', '<p>Good night</p>', '', '', '', '', '', '', '', 'B', 1655223485, 1655223485),
(13, 1, 1, 5, '', '', '<p>8 + 7 = .....</p>', '<p>fourteen</p>', '<p>fifteen</p>', '<p>sixteen</p>', '', '', '', '', '', '', '', 'B', 1655223523, 1655223523),
(14, 1, 1, 5, '', '', '<p>20 - 8 = .....</p>', '<p>twelve</p>', '<p>thirteen</p>', '<p>fourteen</p>', '', '', '', '', '', '', '', 'A', 1655223560, 1655223560),
(15, 1, 1, 5, '', '', '<p>Riana eats .... (nanas)</p>', '<p>Apple</p>', '<p>Pineapple</p>', '<p>mango</p>', '', '', '', '', '', '', '', 'B', 1655223587, 1655223587),
(16, 1, 1, 5, '7b89326816a6aa7d7771e5ea2960b8cf.PNG', 'image/png', '<p>It is a ... (TIME)</p>', '<p>Book</p>', '<p>Clock</p>', '<p>telephone</p>', '', '', '', '', '', '', '', 'B', 1655223656, 1655223656),
(17, 1, 1, 5, '', '', '<p>The day after Sunday is ... </p>', '<p>Thursday</p>', '<p>Monday</p>', '<p>Friday</p>', '', '', '', '', '', '', '', 'B', 1655223691, 1655225580),
(18, 1, 1, 5, '', '', '<p><span lang=\"EN-ID\" xss=removed>Today is Wednesday. In Indonesia is ….  </span><br></p>', '<p><span lang=\"EN-ID\" xss=removed>Hari ini hari Senin       </span><br></p>', '<p><span lang=\"EN-ID\" xss=removed>Hari ini hari Selasa</span><br></p>', '<p><span lang=\"EN-ID\" xss=removed>Hari ini hari Rabu</span><br></p>', '', '', '', '', '', '', '', 'C', 1655223738, 1655223738),
(19, 1, 1, 5, '', '', '<p><span xss=removed>My brother is playing football in the ………  </span><br></p>', '<p>Mall</p>', '<p>Field</p>', '<p>Swimming pool</p>', '', '', '', '', '', '', '', 'B', 1655223768, 1655223768),
(20, 1, 1, 5, '', '', '<p><span xss=removed>Alfiansyah is taking a bath in the ……………   </span><br></p>', '<p>Bathroom</p>', '<p>Bedroom</p>', '<p>Kitchen</p>', '', '', '', '', '', '', '', 'A', 1655223799, 1655223799),
(21, 2, 2, 5, '', '', '<p class=\"MsoNormal\"><b><span xss=removed>Listening\r\nSection:<o></o></span></b></p><p class=\"MsoNormal\"><span xss=removed> </span></p><p class=\"MsoNormal\"><span xss=removed>Choose the correct words to complete the dialogue\r\nbelow.<o></o></span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\"><span xss=removed>Indra is in the school library.</span></p><p class=\"MsoNormal\"><span xss=removed><o><br></o></span></p><p class=\"MsoNormal\"><span xss=removed><o><br></o></span></p><p class=\"MsoNormal\"><span xss=removed><o><br></o></span></p><p class=\"MsoNormal\"><span xss=removed><o></o></span></p><p class=\"MsoListParagraph\" xss=removed><span xss=removed>The correct words to complete the dialogue\r\nabove is...<o></o></span></p>', '<p><span xss=removed>Good afternoon.</span><br></p>', '<p>Good morning</p>', '<p>Good evening</p>', '<p>Good night</p>', '', '', '', '', '', '', 'B', 1655260652, 1655260652),
(22, 2, 2, 5, '', '', '<p class=\"MsoNormal\"><b><span xss=removed>Listening\r\nSection:<o></o></span></b></p><p class=\"MsoNormal\"><span xss=removed> </span></p><p>\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\"><span xss=removed>Choose the correct words to complete the dialogue\r\nbelow.</span></p><p class=\"MsoNormal\"><span xss=removed><o><br></o></span></p><p class=\"MsoNormal\"><span xss=removed><o><span xss=removed>What is the title of the text?</span><br></o></span></p>', '<p><span xss=removed>Rabbits are very funny</span><br></p>', '<p><span xss=removed>My Animal </span><br></p>', '<p>My favorite</p>', '<p><span xss=removed>Rabbit</span><br></p>', '', '', '', '', '', '', 'C', 1655260744, 1655260744),
(23, 2, 2, 5, '', '', '<p class=\"MsoListParagraph\" xss=removed><span xss=removed>The correct answer to complete the\r\ndialogue above is...<o></o></span></p>', '<p><span xss=removed>I don\'t want to finish</span><br></p>', '<p><span xss=removed>I must not finish</span><br></p>', '<p>I have to finish</p>', '<p><span xss=removed>I can finish</span><br></p>', '', '', '', '', '', '', 'C', 1655260938, 1655260938),
(24, 2, 2, 5, '', '', '<p class=\"MsoListParagraph\" xss=removed><span xss=removed>The correct answer to complete the\r\ndialogue above is...<o></o></span></p>', '<p><span xss=removed>you must go to bed late</span><br></p>', '<p><span xss=removed>you must go to bed soon</span><br></p>', '<p><span xss=removed>you should not go to bed</span><br></p>', '<p><span xss=removed>you should go to bed late</span><br></p>', '', '', '', '', '', '', 'B', 1655260981, 1655260981),
(25, 2, 2, 5, '', '', '<p class=\"MsoNormal\"><span xss=removed> </span></p><p>\r\n\r\n</p><table class=\"MsoTableGrid\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" xss=removed><p>\r\n <tbody><tr xss=removed>\r\n  <td width=\"623\" valign=\"top\" xss=removed>\r\n  <p class=\"MsoNormal\" xss=removed><span xss=removed>Happy\r\n  Parent Day!<br>\r\n  <br>\r\n  From a small girl until I grew up. From knowing nothing until I become smart.\r\n  From dependent until I’m independent. When I’m good and bad, you are always\r\n  there for me. You never leave me alone. I’m so grateful!<br>\r\n  <br>\r\n  Thank you, Mom and Dad!<o></o></span></p>\r\n  </td>\r\n </tr>\r\n</tbody></p><p><tbody><span xss=removed>Who sent the card?</span><br></tbody></p></table>', '<p>A Daughter</p>', '<p>A son</p>', '<p>Mother</p>', '<p>Father</p>', '', '', '', '', '', '', 'A', 1655261049, 1655261049),
(26, 2, 2, 5, '', '', '<p class=\"MsoListParagraph\" xss=removed><span xss=removed>The cows drink…<o></o></span></p>', '<p><span xss=removed>Milk </span><br></p>', '<p><span xss=removed>Grass juice</span><br></p>', '<p>Water</p>', '<p><font face=\"Times New Roman, serif\"><span xss=removed>Watermelon</span></font></p>', '', '', '', '', '', '', 'C', 1655261108, 1655261108),
(27, 2, 2, 5, '', '', '<p class=\"MsoListParagraphCxSpFirst\" xss=removed><span xss=removed>Rearrange the text below!</span><span xss=removed> </span></p><p class=\"MsoListParagraphCxSpFirst\" xss=removed><span xss=removed>your\r\n- what\'s - name</span></p>', '<p>What\'s your name</p>', '<p><span xss=removed>Your name what\'s</span><br></p>', '<p><span xss=removed>What\'s name your</span><br></p>', '<p><span xss=removed>Name what\'s your</span><br></p>', '', '', '', '', '', '', 'A', 1655261184, 1655261184),
(28, 2, 2, 5, '', '', '<p class=\"MsoNormal\"><span xss=\"removed\">Mr. Fahri is very happy. The rainy season of this year\r\nmakes the farm beautiful. It is planting time. Rice fields become fresh and\r\ngreen during this season and by the end of this season Mr. Fahri is ready to\r\nharvest his crops.<o></o></span></p><p class=\"MsoNormal\"><span xss=\"removed\">Mr. Fahri ploughs the land at the beginning of the\r\nrainy season. Then, he usually works early and finishes at noon. Milking the\r\ncows, feeding the livestock, and cleaning the barns are among Mr. Fahri’s\r\nduties before breakfast. He does most of the hard outdoor work by himself.</span></p><p class=\"MsoNormal\"><span xss=\"removed\"><br></span>What is a farm like\r\nduring the rainy season?</p>', '<p>Beautiful</p>', '<p>Happy</p>', '<p>Cloudly</p>', '<p>Rain</p>', '', '', '', '', '', '', 'A', 1655261241, 1655262375),
(29, 2, 2, 5, '', '', '<p class=\"MsoNormal\"><span xss=\"removed\">Mr. Fahri is very happy. The rainy season of this year\r\nmakes the farm beautiful. It is planting time. Rice fields become fresh and\r\ngreen during this season and by the end of this season Mr. Fahri is ready to\r\nharvest his crops.<o></o></span></p><p class=\"MsoNormal\"><span xss=\"removed\">Mr. Fahri ploughs the land at the beginning of the\r\nrainy season. Then, he usually works early and finishes at noon. Milking the\r\ncows, feeding the livestock, and cleaning the barns are among Mr. Fahri’s\r\nduties before breakfast. He does most of the hard outdoor work by himself.</span></p><p class=\"MsoNormal\"><span xss=\"removed\"><br></span>When does Mr. Fahri’s workday end?</p>', '<p><span xss=removed>Morning</span><br></p>', '<p><span xss=removed>Night   </span><br></p>', '<p><span xss=removed>Early morning</span><br></p>', '<p>Noon</p>', '', '', '', '', '', '', 'D', 1655261279, 1655262392),
(30, 2, 2, 5, '67123ca3bd3e0aff97ede6d3c3028b3a.PNG', 'image/png', '<p class=\"MsoListParagraph\" xss=removed><span xss=removed>Look at the picture</span></p><p class=\"MsoListParagraph\" xss=removed><span xss=removed><o><br></o></span></p><p class=\"MsoListParagraph\" xss=removed><span xss=removed><o></o></span></p><p class=\"MsoListParagraph\" xss=removed><span xss=removed>The\r\ncorrect greeting based on the picture is . . .<o></o></span></p>', '<p><span xss=removed>Good afternoon.</span><br></p>', '<p>Good morning</p>', '<p>Good evening</p>', '<p>Good night</p>', '', '', '', '', '', '', 'B', 1655261373, 1655261373),
(31, 2, 2, 5, '', '', '<p class=\"MsoListParagraphCxSpFirst\" xss=\"removed\"><span xss=\"removed\">Faiz and Rizqi is in the cinema to watch a\r\nmovie. Suddenly they meets Aji, Friend of Faiz outside of the cinema.<o></o></span></p><p class=\"MsoListParagraphCxSpMiddle\" xss=\"removed\"><span xss=\"removed\"> </span></p><p class=\"MsoListParagraphCxSpMiddle\" xss=\"removed\"><span xss=\"removed\">Faiz:\r\nHello Aji, Good Afternoon.<o></o></span></p><p class=\"MsoListParagraphCxSpMiddle\" xss=\"removed\"><span xss=\"removed\">Aji:\r\nGood Afternoon, Faiz (11)……………………..?<o></o></span></p><p class=\"MsoListParagraphCxSpMiddle\" xss=\"removed\"><span xss=\"removed\">Faiz:\r\nI’m fine thank you and how about you?<o></o></span></p><p class=\"MsoListParagraphCxSpMiddle\" xss=\"removed\"><span xss=\"removed\"> </span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoListParagraphCxSpLast\" xss=\"removed\"><span xss=\"removed\">Fill\r\nthe blank space in the dialogue above!<o></o></span></p>', '<p><span xss=removed>Nice to meet you</span><br></p>', '<p><span xss=removed>Where are you?</span><br></p>', '<p>How are you?</p>', '<p><span xss=removed>Glad to see you</span><br></p>', '', '', '', '', '', '', 'C', 1655261423, 1655262405),
(32, 2, 2, 5, '', '', '<p class=\"MsoListParagraph\" xss=\"removed\"><span xss=\"removed\">It’s nine o’clock in the night. Gia will\r\ngo to sleep. He says……. to his parents<o></o></span></p>', '<p><span xss=removed>Good bye</span><br></p>', '<p>Good night</p>', '<p>See you</p>', '<p><span xss=removed>Good Afternoon</span><br></p>', '', '', '', '', '', '', 'B', 1655261472, 1655262415),
(33, 2, 2, 5, '', '', '<p class=\"MsoListParagraphCxSpFirst\" xss=\"removed\"><span xss=\"removed\">Ani: Happy birthday, Wina! Here is a\r\npresent for you.<o></o></span></p><p>\r\n\r\n</p><p class=\"MsoListParagraphCxSpLast\" xss=\"removed\"><span xss=\"removed\">Wina:\r\n. . .<o></o></span></p>', '<p><span xss=removed>Wow, you look beautiful!</span><br></p>', '<p><span xss=removed>Welcome to my house, Ani</span><br></p>', '<p><span xss=removed><font color=\"#000000\" xss=removed>Thank you. That’s very kind\r\nof you.</font></span><br></p>', '<p class=\"MsoListParagraph\" xss=removed><span xss=removed>Your\r\npresent must be expen<o></o></span></p>', '', '', '', '', '', '', 'C', 1655261524, 1655262422),
(34, 2, 2, 5, '', '', '<p class=\"MsoListParagraphCxSpFirst\" xss=\"removed\"><span xss=\"removed\">X: I\'m leaving to go camping in Bantir his\r\nweekend.</span></p><p class=\"MsoListParagraphCxSpFirst\" xss=\"removed\"><span xss=\"removed\">Y:\r\nWell, I think you . . . take a raincoat with you. It\'s the rainy season now.</span></p><p class=\"MsoListParagraphCxSpFirst\" xss=\"removed\"><span xss=\"removed\">X:\r\nYou\'re right.</span></p><p class=\"MsoListParagraphCxSpMiddle\" xss=\"removed\"><span xss=\"removed\"> </span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoListParagraphCxSpLast\" xss=\"removed\"><span xss=\"removed\">Fill\r\nthe blank space in the dialogue above!<o></o></span></p>', '<p>should</p>', '<p><span xss=removed>must not</span><br></p>', '<p><span xss=removed>should not</span><br></p>', '<p><span xss=removed>don\'t have</span><br></p>', '', '', '', '', '', '', 'A', 1655261576, 1655262362),
(35, 2, 2, 5, '96a2eb2046f92151246c1a2919aea74c.PNG', 'image/png', '<p class=\"MsoListParagraph\" xss=removed><span xss=removed>What does the notice mean?<o></o></span></p>', '<p><span xss=removed>People aren\'t permitted to\r\nthrow rubbish here.</span><br></p>', '<p><span xss=removed>People can get gasoline for their cars here.</span><br></p>', '<p class=\"MsoNormal\" xss=removed><span xss=removed>People must be careful\r\nwith their hands.<o></o></span></p>', '', '', '', '', '', '', '', 'A', 1655261653, 1655261653),
(36, 2, 2, 5, '', '', '<p class=\"MsoListParagraphCxSpFirst\" xss=\"removed\"><span xss=\"removed\">\"<b>DO\r\nNOT FEED THE ANIMALS</b>\"<o></o></span></p><p>\r\n\r\n</p><p class=\"MsoListParagraphCxSpLast\" xss=\"removed\"><span xss=\"removed\">From\r\nthe text, we can conclude that we . . . feed the animals.<o></o></span></p>', '<p><span xss=removed>must </span><br></p>', '<p><span xss=removed>should</span><br></p>', '<p>must not</p>', '<p><span xss=removed>don\'t have to</span><br></p>', '', '', '', '', '', '', 'C', 1655262246, 1655262338),
(37, 2, 2, 5, '', '', '<p class=\"MsoNormal\"><span xss=\"removed\"> </span></p><p>\r\n\r\n</p><div align=\"center\">\r\n\r\n<table class=\"MsoNormalTable\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" width=\"0\" xss=\"removed\">\r\n <tbody><tr>\r\n  <td xss=\"removed\">\r\n  <p class=\"MsoNormal\"><span xss=\"removed\">Dear Ariani<br>\r\n  <br>\r\n  Congratulations on your winning at the regional chess competition!<br>\r\n  Your hard work has been paid off.<br>\r\n  Wishing you get the best result in the higher competition.<br>\r\n  Good luck!<br>\r\n  <br>\r\n  Samson<o></o></span></p>\r\n  </td>\r\n </tr>\r\n</tbody></table></div><div align=\"center\"><br><table class=\"MsoNormalTable\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" width=\"0\" xss=\"removed\"><tbody></tbody></table>Why does Samson send the greeting card?</div><div align=\"center\"><table class=\"MsoNormalTable\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" width=\"0\" xss=\"removed\"><tbody></tbody></table>\r\n\r\n</div>', '<p><span xss=removed>To compliment Ariani on her success.</span><br></p>', '<p><span xss=removed>To congratulate Ariani on\r\nher winning.</span><br></p>', '<p><span xss=removed>To encourge Ariani to be successful.</span><br></p>', '<p><span xss=removed>To wish Ariani win in the higher competition</span><br></p>', '', '', '', '', '', '', 'B', 1655262316, 1655262329),
(38, 2, 2, 5, '', '', '<div align=\"center\"><table class=\"MsoNormalTable\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" width=\"0\" xss=\"removed\">\r\n <tbody><tr>\r\n  <td xss=\"removed\">\r\n  <p class=\"MsoNormal\"><span xss=\"removed\">Dear Ariani<br>\r\n  <br>\r\n  Congratulations on your winning at the regional chess competition!<br>\r\n  Your hard work has been paid off.<br>\r\n  Wishing you get the best result in the higher competition.<br>\r\n  Good luck!<br>\r\n  <br>\r\n  Samson<o></o></span></p>\r\n  </td>\r\n </tr>\r\n</tbody></table></div><div align=\"center\"><br><table class=\"MsoNormalTable\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" width=\"0\" xss=\"removed\"><tbody></tbody></table></div><div align=\"center\"><table class=\"MsoNormalTable\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" width=\"0\" xss=\"removed\"><tbody></tbody></table></div><div align=\"center\"><table class=\"MsoNormalTable\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" width=\"0\" xss=\"removed\"><tbody></tbody></table></div><div align=\"center\"><span xss=\"removed\">How does Samson probably fell when giving the greeting card to Ariani?</span><br>\r\n\r\n</div>', '<p>Proud</p>', '<p><span xss=removed>Anxious</span><br></p>', '<p><span xss=removed>Amused</span><br></p>', '<p><span xss=removed>Surprised</span><br></p>', '', '', '', '', '', '', 'A', 1655262502, 1655262556),
(39, 2, 2, 5, '', '', '<p class=\"MsoNormal\"><span xss=\"removed\"> </span></p><p>\r\n\r\n</p><div align=\"center\">\r\n\r\n<table class=\"MsoNormalTable\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" width=\"0\" xss=\"removed\">\r\n <tbody><tr>\r\n  <td xss=\"removed\">\r\n  <p class=\"MsoNormal\"><span xss=\"removed\">Dear my best friend, Futu.<br>\r\n  <br>\r\n  Now you are turning 23.<br>\r\n  Wishing your birthday full of joy and wonderful memories.<br>\r\n  <b>Happy Birthday!</b><br>\r\n  May you have a healthy and long life and grab the bright future!<br>\r\n  <br>\r\n  Vandra<o></o></span></p>\r\n  </td>\r\n </tr>\r\n</tbody></table></div><div align=\"center\"><span xss=\"removed\">Vandra writes the text in order to …..</span><br>\r\n\r\n</div>', '<p><span xss=removed>thank</span><br></p>', '<p><span xss=removed>apologise</span><br></p>', '<p><span xss=removed>compliment</span><br></p>', '<p>congratulate</p>', '', '', '', '', '', '', 'D', 1655262612, 1655262630),
(40, 2, 2, 5, '', '', '<p class=\"MsoNormal\"><span xss=removed> </span></p><p>\r\n\r\n</p><div align=\"center\">\r\n\r\n<table class=\"MsoNormalTable\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" width=\"0\" xss=removed>\r\n <tbody><tr>\r\n  <td xss=removed>\r\n  <p class=\"MsoNormal\"><span xss=removed>Dear my best friend, Futu.<br>\r\n  <br>\r\n  Now you are turning 23.<br>\r\n  Wishing your birthday full of joy and wonderful memories.<br>\r\n  <b>Happy Birthday!</b><br>\r\n  May you have a healthy and long life and grab the bright future!<br>\r\n  <br>\r\n  Vandra<o></o></span></p>\r\n  </td>\r\n </tr>\r\n</tbody></table></div><div align=\"center\"><table class=\"MsoNormalTable\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" width=\"0\" xss=removed><tbody><span xss=removed>What is the relationship between Vandra and Futu?</span><br></tbody></table>\r\n\r\n</div>', '<p><span xss=removed>Siblings</span><br></p>', '<p><span xss=removed>A very close friend</span><br></p>', '<p><span xss=removed>Pen pals</span><br></p>', '<p><span xss=removed>Schoolmates</span><br></p>', '', '', '', '', '', '', 'B', 1655262674, 1655262674);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'Administrator', '$2y$12$tGY.AtcyXrh7WmccdbT1rOuKEcTsKH6sIUmDr0ore1yN4LnKTTtuu', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1655341390, 1, 'Admin', 'Istrator', 'ADMIN', '0'),
(19, '::1', '123456789', '$2y$10$y01c7SV.BXJMD.RmOVqyn.rHC1Cr1oVgbkEbfaKVmYpEAGaJsOqRO', 'gurusmp@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655222044, 1655278375, 1, 'Guru', 'SMP', NULL, NULL),
(24, '::1', '12345678', '$2y$10$0TBECYkDuUg8hKk2jmwkwOUnLa1xNjRI7GM0tKqjut8LLutYNTpKW', 'gurusd@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655258259, 1655304105, 1, 'Guru', 'SD', NULL, NULL),
(25, '::1', '01072012', '$2y$10$0Ymyd4y07byg7kk6rt7BduyBnHrhcuvj55VTzz9zoZyAcTaBluAPK', 'johana@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259947, NULL, 1, 'JOHANA', 'PRAMONO', NULL, NULL),
(26, '::1', '04062013', '$2y$10$PDvmYqkf5.Sl/wdYunhjM.REDrIxlEGWDKD9JUvwdGmxoOGK1gaBK', 'jihan@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259949, NULL, 1, 'JIHAN', 'HERAWATI', NULL, NULL),
(27, '::1', '08052008', '$2y$10$eHSjU7fSY6q9DPnV1EY/w.ZkGcATkPK42DXHw0JJavoLPAFXqLJg2', 'dwi@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259951, NULL, 1, 'DWI', 'SARI', NULL, NULL),
(28, '::1', '08112006', '$2y$10$zrhc7Z.eL4jrwuIxQXe42OJUzNbCuBM139xFgCVe7xoyVt6KAXrIm', 'mdwi@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259952, NULL, 1, 'MUHAMMAD', 'ALI', NULL, NULL),
(29, '::1', '09102009', '$2y$10$518XE6SlsuiLYET.5xM.S.UVF9.z3r.vYmCH4n4aN6T6dFQDDpVxi', 'aninda@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259955, NULL, 1, 'ANINDA', 'ZAHRA', NULL, NULL),
(30, '::1', '10092006', '$2y$10$t9cJj5nlcyiDplX0NSpAYOteHCfxQTCvAhLyOmMcvfJu7jdru.x1u', 'faizal@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259956, NULL, 1, 'FAIZAL', 'FARDANI', NULL, NULL),
(31, '::1', '10092010', '$2y$10$xzEq.XI3.2IzCyg/cVOfYOZ/YT.vZUU/vf9AoXhNnt7tnR294ALfu', 'salwa@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259957, NULL, 1, 'SALWA', 'PRIANTO', NULL, NULL),
(32, '::1', '11122014', '$2y$10$NlJ//wLAXkwcmzLNplCZX.W.Jzpi65T9/iP17ijSPDMceylt22ube', 'anindi@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259958, NULL, 1, 'ANINDI', 'ANDRIANI', NULL, NULL),
(33, '::1', '13032009', '$2y$10$jK4y4VbOgv2rnFP55j/bpe8KjXb9IeeGs5E5Xh/DPHqzOCkOzO3sm', 'fara@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259960, NULL, 1, 'FARA', 'NATASHA', NULL, NULL),
(34, '::1', '13072008', '$2y$10$oy5UFmo9sC8cWFUgL6tPM.uHxHjGEuqRx/dK6slayDUTm9mCqL5wq', 'kirania@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259961, NULL, 1, 'KIRANIA', 'PUTRI', NULL, NULL),
(35, '::1', '14062012', '$2y$10$mTmCxVoucPY6YRPPszS9/OD7bjCRZptpsVHDp3Sgi1ceEtSmokINu', 'fabio@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259962, NULL, 1, 'FABIO', 'PUTRA', NULL, NULL),
(36, '::1', '18082013', '$2y$10$41TAmGPuIjdwWe9wmuLKzeQ6jp6F0NJaCvzU//W4U9cqY307uS5x.', 'zidan@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259963, 1655278642, 1, 'M.', 'HAFIZH', NULL, NULL),
(37, '::1', '19082014', '$2y$10$RJN.S65BK8MDdOOfwCAPs.fNk2LgoEVoqBu4Zz8K4iDIDM3FpfN2y', 'nafisa@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259964, NULL, 1, 'NAFISA', 'WIBOWO', NULL, NULL),
(38, '::1', '20052013', '$2y$10$56s0Nze2IjGvfuFQSOyhauce5OA4Vrze8KvDAprqFhWsbjZ8ncMTK', 'aqila@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259965, NULL, 1, 'AQILA', 'ZAHRA', NULL, NULL),
(39, '::1', '21032011', '$2y$10$qZ0ZftEsXb8F91wDTxLr1uCNsqO0aBmI5hUUtUTpoRd0o1aK45mde', 'via@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259967, NULL, 1, 'VIA', 'SAFIRA', NULL, NULL),
(40, '::1', '22042010', '$2y$10$ay2HpYh8eh3PnEwu22VY4u4w910JQBE7/pvwxWZ2c7SFb4WfhBL9a', 'yoga@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259968, NULL, 1, 'YOGA', 'SAPUTRA', NULL, NULL),
(41, '::1', '220420100', '$2y$10$DkmB3InmKr4HAJ8Ilwpbhu.LicXS5Rb3Vh36WtfxgH2OS0z.QTdKu', 'yola@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259970, NULL, 1, 'YOLA', 'SAPUTRI', NULL, NULL),
(42, '::1', '22072013', '$2y$10$OFJO7N.x8ktsRd7Wmk2CjehhddaDk7GEdDHlnZxjJmMYaTOfNONsy', 'shabilla@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259971, NULL, 1, 'SHABILLA', 'AZZAHWA', NULL, NULL),
(43, '::1', '23062010', '$2y$10$.JF4T3waMTtrhXJEHcHPTe3o6Kegpqf38wfnoOLsAJBR/Miiz2F2K', 'refhan@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259973, NULL, 1, 'REFHAN', 'PURNAMA', NULL, NULL),
(44, '::1', '24072012', '$2y$10$RhWzwKcQETVFrwtUrMscI.gkJn5taSojNwvubjzYcjsZA6ck5QcZG', 'thalita@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259975, NULL, 1, 'THALITA', 'RAMADHANI', NULL, NULL),
(45, '::1', '24122009', '$2y$10$lBoXD6IeailJFCsrp6b7TuYFhgxhkrBvsXY6pbP6UP664wfuNJY0K', 'adinda@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259976, NULL, 1, 'ADINDA', 'NURHABIBAH', NULL, NULL),
(46, '::1', '26052013', '$2y$10$YwJzEs48jJHSbLhnbdT8yusSo1fL8M5pPoaEeh0a4TBVeTqSdXa/e', 'maylani@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259977, NULL, 1, 'MAYLANI', 'REVALIA', NULL, NULL),
(47, '::1', '27022009', '$2y$10$jQ91CJr09JXNy.vaPx6m..lNGXrd4m34L5xSpxi/.wsBmQ8mcd28C', 'shafabie@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259978, NULL, 1, 'SHAFABIE', 'PRIANTO', NULL, NULL),
(48, '::1', '27082009', '$2y$10$W8utEQyMSOFCymEy6K251u90Ez8TVuiVOqq4aGAVQEqeCdjBGn.eW', 'mrasya@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259979, NULL, 1, 'MOCH.', 'RAMADHAN', NULL, NULL),
(49, '::1', '28022012', '$2y$10$p4YbiybM9DfqABayjQRKDeVrE7pI/3cCcoeg6KjxdzuIvhOiPVVq2', 'ernawati@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259980, NULL, 1, 'ERNAWATI', 'ERNAWATI', NULL, NULL),
(50, '::1', '28042006', '$2y$10$zZNbGW9nEg.DKxQZyYRoxenWcUpZud.IdAaDka3e.roWVxr5oerny', 'krisna@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259981, NULL, 1, 'KRISNA', 'PRIANTO', NULL, NULL),
(51, '::1', '28042008', '$2y$10$cXt/YXp.CU6gRQ4syIOMl.8audhIe5cpb6cUdQl4rMkLTV4IEpYlW', 'yemima@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259982, NULL, 1, 'YEMIMA', 'PRAMONO', NULL, NULL),
(52, '::1', '28052013', '$2y$10$oP/JwBT7skKJGsBH0PzsceIA21WvHu5Fd2sKRs0Wjg62hYlSTdeae', 'alif@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259983, NULL, 1, 'ALIF', 'ARVIANSYAH', NULL, NULL),
(53, '::1', '29102012', '$2y$10$p2E1FghD7ZpXSvsNjpduGejcmVTnF6c3QVImxS1hI6/9my8xjQMsm', 'dzakira@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259984, NULL, 1, 'DZAKIRA', 'ARDIANA', NULL, NULL),
(54, '::1', '31032013', '$2y$10$PVwUZ6jG8.qnQ7VYqYbvWu8WNs8YC5MaNP1fdTWxsn9ZUi8qTTrsi', 'bunga@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655259986, 1655278865, 1, 'BUNGA', 'ROSALITA', NULL, NULL),
(55, '::1', '0102030405', '$2y$10$6JA4qEcfqb5uG9jVIPTxreAO72OtzJTowwcDdDPngor2EAgamQOoW', 'siswasd@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655273295, 1655304267, 1, 'Saya', 'SD', NULL, NULL),
(56, '::1', '1122334455', '$2y$12$Ckcb.DzPTdRwD8MlTAA20Ozw.fG1CBE4hX4LilzBtTGcNJ2u.HjbW', 'teknik@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655273979, 1655277979, 1, 'Arek', 'Teknik', NULL, NULL),
(57, '::1', '010203040506', '$2y$10$86BMe6Yla6CSeorqCc6Rfu6PpoznPr6TBx9gdO8JJKL8fb0lehShW', 'siswasmp@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655274887, 1655300502, 1, 'Saya', 'SMP', NULL, NULL),
(58, '::1', '19053010', '$2y$10$PSpPk0LS5yKbnIxTj5BaJ.kxsuu0R2gYq7W16Pnxwz2okpQrgdv7e', 'vio@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655277280, 1655278603, 1, 'VIO', 'PRASETIO', NULL, NULL),
(59, '::1', '19053022', '$2y$10$lvRIQJYIHFKhpSiGVAytl.l3pGMi3O1VePm.Q/gsrgVBu5k5.gkC6', 'irza@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655277282, NULL, 1, 'IRZA', 'ALAMSYAH', NULL, NULL),
(62, '::1', '19053034', '$2y$10$QSVC3dMkdkrX11h3GwsfMuVlmXCmuVVsWaTc9DTKzKjvQi29zMOoW', 'raka@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655277286, 1655278487, 1, 'WHISTLER', 'L', NULL, NULL),
(63, '::1', '19071001', '$2y$10$k.iKdNWowUqez5bOyv0fkO7LaWtVwiXfvfyMgeNnvzv2RUqDCfu/G', 'alip@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655277287, 1655304401, 1, 'ALIP', 'LAILA', NULL, NULL),
(64, '::1', '19071002', '$2y$10$UiVEoi9v1GXZbZh/rESJVeVtrAiakZs2Az99k3cVl6H6c7JTvxx0a', 'siti@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655277288, 1655304385, 1, 'SITI', 'FATIMAH', NULL, NULL),
(65, '::1', '19071003', '$2y$10$M5LbNriutv3dQ80Pb7ohs.Wlz92OFlZ.OwFoR/gUcUruH3srCsf/6', 'ika@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655277289, 1655304158, 1, 'IKA', 'AH', NULL, NULL),
(66, '::1', '19071005', '$2y$10$15OHtgbr7ygjPsrvrZDNV.Asz.I/fZaZgycwrDrEXJeOHIcVeMIgK', 'diaz@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655277291, 1655341588, 1, 'DIAZ', 'LARAS', NULL, NULL),
(67, '::1', '19071006', '$2y$10$f3NezDrRL77kggFxZxXmz.cJZCTYYjBaYH/8topPnqeBXYwsaZvke', 'reza@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655277293, 1655304639, 1, 'REZA', 'AH', NULL, NULL),
(68, '::1', '19071008', '$2y$10$ox1TAW8XDRAUSSNocVWesO4dCCIKIICvz9Ozw1vpJATa36newZMHa', 'meokbun@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655277294, 1655304462, 1, 'MEOKBUN', 'ANASTASYA', NULL, NULL),
(69, '::1', '19071010', '$2y$10$3DIZZyhhmWDPX0seBsLZsu.yHScGPK1fiRihNzybopRJ.hBG1TNae', 'martha@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655277295, 1655341564, 1, 'MARTHA', 'LIAM', NULL, NULL),
(70, '::1', '19071019', '$2y$10$RnAfphxSu27eAt3cXYFAz.X4EO5I0FgdEZILd4OLE6czQT05r94HO', 'salsabyla@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655277296, 1655304562, 1, 'SALSABYLA', 'YUN', NULL, NULL),
(71, '::1', '19071020', '$2y$10$OpKikFIc9WluImVDJzW.V.6Mfbh0uEr3n882NLf01fKUMJr/mTr1e', 'taufik@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655277297, 1655304308, 1, 'TAUFIK', 'RAHMAN', NULL, NULL),
(72, '::1', '19071021', '$2y$10$T2lfMTgqOjuhPPncg51YSOvRSDfLoxY8XslfF6D1HDTR4JKvqpBh.', 'miqbal@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655277298, 1655304553, 1, 'MOCHAMAD', 'ROMADHON', NULL, NULL),
(73, '::1', '19053006', '$2y$10$QusJsldFW1.F6NA1qZvvpuc5.m5HgDYYplLfDEXvmxujQhVGEcQdW', 'nurmay@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655277548, 1655304328, 1, 'NURMA', 'YUNITA', NULL, NULL),
(75, '::1', '19053033', '$2y$10$OFjuhuejnIxiURjRhB1KFeBqs2pCUlwEz8heO8JYTMo0IfpZmvVVi', 'baguss@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655278741, 1655278751, 1, 'BAGUS', 'SETYAWAN', NULL, NULL),
(76, '::1', '19053020', '$2y$10$c3W1O3EGAfbyY7Tub9ZyieBzDh72DoAZzoQLg1yM4/8Rx7IYPJwaW', 'rizky@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655279153, 1655304066, 1, 'MOHAMMAD', 'RIZKY', NULL, NULL),
(78, '::1', '010101001', '$2y$10$to.WcP0rlqiljsGpwDHEoelVkL0XmTO4LVDHF0Vl/3m0KyLVkdWLy', 'shelly@kkn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1655300356, 1655300821, 1, 'Shelly', 'Shelly', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(3, 1, 1),
(21, 19, 2),
(26, 24, 2),
(27, 25, 3),
(28, 26, 3),
(29, 27, 3),
(30, 28, 3),
(31, 29, 3),
(32, 30, 3),
(33, 31, 3),
(34, 32, 3),
(35, 33, 3),
(36, 34, 3),
(37, 35, 3),
(38, 36, 3),
(39, 37, 3),
(40, 38, 3),
(41, 39, 3),
(42, 40, 3),
(43, 41, 3),
(44, 42, 3),
(45, 43, 3),
(46, 44, 3),
(47, 45, 3),
(48, 46, 3),
(49, 47, 3),
(50, 48, 3),
(51, 49, 3),
(52, 50, 3),
(53, 51, 3),
(54, 52, 3),
(55, 53, 3),
(56, 54, 3),
(57, 55, 3),
(58, 56, 1),
(59, 57, 3),
(60, 58, 3),
(61, 59, 3),
(64, 62, 3),
(65, 63, 3),
(66, 64, 3),
(67, 65, 3),
(68, 66, 3),
(69, 67, 3),
(70, 68, 3),
(71, 69, 3),
(72, 70, 3),
(73, 71, 3),
(74, 72, 3),
(75, 73, 3),
(77, 75, 3),
(78, 76, 3),
(80, 78, 3);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `matkul_id` (`matkul_id`);

--
-- Indeks untuk tabel `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `h_ujian`
--
ALTER TABLE `h_ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ujian_id` (`ujian_id`),
  ADD KEY `mahasiswa_id` (`mahasiswa_id`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `jurusan_matkul`
--
ALTER TABLE `jurusan_matkul`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jurusan_id` (`jurusan_id`),
  ADD KEY `matkul_id` (`matkul_id`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `jurusan_id` (`jurusan_id`);

--
-- Indeks untuk tabel `kelas_dosen`
--
ALTER TABLE `kelas_dosen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas_id` (`kelas_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indeks untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `kelas_id` (`kelas_id`);

--
-- Indeks untuk tabel `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indeks untuk tabel `m_ujian`
--
ALTER TABLE `m_ujian`
  ADD PRIMARY KEY (`id_ujian`),
  ADD KEY `matkul_id` (`matkul_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indeks untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `matkul_id` (`matkul_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`),
  ADD UNIQUE KEY `uc_email` (`email`) USING BTREE;

--
-- Indeks untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `h_ujian`
--
ALTER TABLE `h_ujian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `jurusan_matkul`
--
ALTER TABLE `jurusan_matkul`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kelas_dosen`
--
ALTER TABLE `kelas_dosen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `matkul`
--
ALTER TABLE `matkul`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `m_ujian`
--
ALTER TABLE `m_ujian`
  MODIFY `id_ujian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`);

--
-- Ketidakleluasaan untuk tabel `h_ujian`
--
ALTER TABLE `h_ujian`
  ADD CONSTRAINT `h_ujian_ibfk_1` FOREIGN KEY (`ujian_id`) REFERENCES `m_ujian` (`id_ujian`),
  ADD CONSTRAINT `h_ujian_ibfk_2` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id_mahasiswa`);

--
-- Ketidakleluasaan untuk tabel `jurusan_matkul`
--
ALTER TABLE `jurusan_matkul`
  ADD CONSTRAINT `jurusan_matkul_ibfk_1` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`id_jurusan`),
  ADD CONSTRAINT `jurusan_matkul_ibfk_2` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`);

--
-- Ketidakleluasaan untuk tabel `kelas_dosen`
--
ALTER TABLE `kelas_dosen`
  ADD CONSTRAINT `kelas_dosen_ibfk_1` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `kelas_dosen_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id_kelas`);

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id_kelas`);

--
-- Ketidakleluasaan untuk tabel `m_ujian`
--
ALTER TABLE `m_ujian`
  ADD CONSTRAINT `m_ujian_ibfk_1` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `m_ujian_ibfk_2` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`);

--
-- Ketidakleluasaan untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD CONSTRAINT `tb_soal_ibfk_1` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`),
  ADD CONSTRAINT `tb_soal_ibfk_2` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id_dosen`);

--
-- Ketidakleluasaan untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
