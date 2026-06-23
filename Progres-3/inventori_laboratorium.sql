-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: inventori_laboratorium
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jumlah_stok` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_kondisi` int(11) NOT NULL,
  `id_lab` int(11) NOT NULL,
  PRIMARY KEY (`id_barang`),
  KEY `id_kategori` (`id_kategori`),
  KEY `id_kondisi` (`id_kondisi`),
  KEY `id_lab` (`id_lab`),
  CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_barang` (`id_kategori`),
  CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`id_kondisi`) REFERENCES `kondisi_barang` (`id_kondisi`),
  CONSTRAINT `barang_ibfk_3` FOREIGN KEY (`id_lab`) REFERENCES `laboratorium` (`id_lab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang`
--

LOCK TABLES `barang` WRITE;
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
INSERT INTO `barang` VALUES (1,'PC Praktikum',20,1,1,1),(2,'Laptop Lenovo',10,1,1,1),(3,'Router Cisco',8,2,1,2),(4,'Switch Mikrotik',12,2,1,2),(5,'Multimeter Digital',15,3,1,1);
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_peminjaman`
--

DROP TABLE IF EXISTS `detail_peminjaman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_peminjaman` (
  `id_detail` int(11) NOT NULL,
  `id_pinjam` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  PRIMARY KEY (`id_detail`),
  KEY `id_pinjam` (`id_pinjam`),
  KEY `id_barang` (`id_barang`),
  CONSTRAINT `detail_peminjaman_ibfk_1` FOREIGN KEY (`id_pinjam`) REFERENCES `peminjaman` (`id_pinjam`),
  CONSTRAINT `detail_peminjaman_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_peminjaman`
--

LOCK TABLES `detail_peminjaman` WRITE;
/*!40000 ALTER TABLE `detail_peminjaman` DISABLE KEYS */;
INSERT INTO `detail_peminjaman` VALUES (1,1,3,1),(2,1,4,1),(3,2,5,2);
/*!40000 ALTER TABLE `detail_peminjaman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori_barang`
--

DROP TABLE IF EXISTS `kategori_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori_barang` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  PRIMARY KEY (`id_kategori`),
  UNIQUE KEY `nama_kategori` (`nama_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori_barang`
--

LOCK TABLES `kategori_barang` WRITE;
/*!40000 ALTER TABLE `kategori_barang` DISABLE KEYS */;
INSERT INTO `kategori_barang` VALUES (3,'Peralatan Praktikum'),(2,'Perangkat Jaringan'),(1,'Perangkat Komputer');
/*!40000 ALTER TABLE `kategori_barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kondisi_barang`
--

DROP TABLE IF EXISTS `kondisi_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kondisi_barang` (
  `id_kondisi` int(11) NOT NULL,
  `nama_kondisi` varchar(30) NOT NULL,
  PRIMARY KEY (`id_kondisi`),
  UNIQUE KEY `nama_kondisi` (`nama_kondisi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kondisi_barang`
--

LOCK TABLES `kondisi_barang` WRITE;
/*!40000 ALTER TABLE `kondisi_barang` DISABLE KEYS */;
INSERT INTO `kondisi_barang` VALUES (1,'Baik'),(3,'Rusak Berat'),(2,'Rusak Ringan');
/*!40000 ALTER TABLE `kondisi_barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboran`
--

DROP TABLE IF EXISTS `laboran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboran` (
  `id_laboran` int(11) NOT NULL,
  `nama_laboran` varchar(100) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  PRIMARY KEY (`id_laboran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboran`
--

LOCK TABLES `laboran` WRITE;
/*!40000 ALTER TABLE `laboran` DISABLE KEYS */;
INSERT INTO `laboran` VALUES (1,'Bapak Ferdi','081234567890');
/*!40000 ALTER TABLE `laboran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratorium`
--

DROP TABLE IF EXISTS `laboratorium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboratorium` (
  `id_lab` int(11) NOT NULL,
  `nama_lab` varchar(100) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  PRIMARY KEY (`id_lab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratorium`
--

LOCK TABLES `laboratorium` WRITE;
/*!40000 ALTER TABLE `laboratorium` DISABLE KEYS */;
INSERT INTO `laboratorium` VALUES (1,'Lab Komputer UMRAH','FTTK'),(2,'Lab Jaringan UMRAH','FTTK');
/*!40000 ALTER TABLE `laboratorium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mahasiswa` (
  `nim` varchar(15) NOT NULL,
  `nama_mahasiswa` varchar(100) NOT NULL,
  `prodi` varchar(50) NOT NULL,
  `semester` int(11) NOT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES ('2501020130','Prayoga Kie','Informatika',2),('2501020133','Egi Fahrezi Winanda','Informatika',2),('2501020134','Farel','Informatika',2),('2501020140','Aldi Saputra','Informatika',2);
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peminjaman`
--

DROP TABLE IF EXISTS `peminjaman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peminjaman` (
  `id_pinjam` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `status_pinjam` varchar(20) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `id_laboran` int(11) NOT NULL,
  PRIMARY KEY (`id_pinjam`),
  KEY `nim` (`nim`),
  KEY `id_laboran` (`id_laboran`),
  CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_laboran`) REFERENCES `laboran` (`id_laboran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peminjaman`
--

LOCK TABLES `peminjaman` WRITE;
/*!40000 ALTER TABLE `peminjaman` DISABLE KEYS */;
INSERT INTO `peminjaman` VALUES (1,'2026-06-20','Dipinjam','2501020140',1),(2,'2026-06-21','Dipinjam','2501020134',1);
/*!40000 ALTER TABLE `peminjaman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengembalian`
--

DROP TABLE IF EXISTS `pengembalian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengembalian` (
  `id_kembali` int(11) NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `kondisi_kembali` varchar(30) NOT NULL,
  `id_pinjam` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kembali`),
  UNIQUE KEY `id_pinjam` (`id_pinjam`),
  CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`id_pinjam`) REFERENCES `peminjaman` (`id_pinjam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengembalian`
--

LOCK TABLES `pengembalian` WRITE;
/*!40000 ALTER TABLE `pengembalian` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengembalian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengguna`
--

DROP TABLE IF EXISTS `pengguna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `id_laboran` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pengguna`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `id_laboran` (`id_laboran`),
  CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`id_laboran`) REFERENCES `laboran` (`id_laboran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengguna`
--

LOCK TABLES `pengguna` WRITE;
/*!40000 ALTER TABLE `pengguna` DISABLE KEYS */;
INSERT INTO `pengguna` VALUES (1,'admin_lab','admin123','Admin',1);
/*!40000 ALTER TABLE `pengguna` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-23 17:44:33
