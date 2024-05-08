create database Terminal;

use terminal;

create table Terminal(
    Id_Terminal CHAR(6) NOT NULL,
    Nama_Terminal VARCHAR(100) NOT NULL,
    Lokasi_Terminal VARCHAR(100),
    PRIMARY KEY (Id_Terminal)
);

create table Pemilik_Perusahaan(    
    Id_Pemilik CHAR(5) NOT NULL,
    Nama_Pemilik VARCHAR(100) NOT NULL,
    Tgl_Lahir_Berdiri DATE,
    Asal VARCHAR(50),
    PRIMARY KEY (Id_Pemilik)
);

create table Staff(
    Id_Staff CHAR(5) NOT NULL,
    Nama VARCHAR(50) NOT NULL,
    Tanggal_Lahir DATE,
    Alamat VARCHAR(100),
    Crew_Bagian VARCHAR(50) NOT NULL,
    PRIMARY KEY (Id_Staff)
);

create table Perusahaan(
    Id_Perusahaan CHAR(5) NOT NULL,
    Nama_Perusahaan VARCHAR(100) NOT NULL,
    Id_Pemilik CHAR(5) NOT NULL,
    Jumlah_Bus BIGINT,
    PRIMARY KEY (Id_Perusahaan),
    FOREIGN KEY (Id_Pemilik) REFERENCES Pemilik_Perusahaan(Id_Pemilik)
);

create table Bus(
    Id_Bus CHAR(5) NOT NULL,
    Nama_Bus VARCHAR(100) NOT NULL,
    Jenis_Bus VARCHAR(100),
    Merek_Kendaraan VARCHAR(100),
    Id_Staff CHAR(5) NOT NULL,
    PRIMARY KEY (Id_Bus),
    FOREIGN KEY (Id_Staff) REFERENCES Staff(Id_Staff)
);

create table Perjalanan(
    Id_Perjalanan CHAR(8) NOT NULL,
    Id_Perusahaan CHAR(5) NOT NULL,
    Id_Bus CHAR(5) NOT NULL,
    Tanggal DATE,
    Id_Terminal_Keberangkatan CHAR(8) NOT NULL,
    Id_Terminal_Tujuan CHAR(8) NOT NULL,
    PRIMARY KEY (Id_Perjalanan),
    FOREIGN KEY (Id_Perusahaan) REFERENCES Perusahaan(Id_Perusahaan),
    FOREIGN KEY (Id_Bus) REFERENCES Bus(Id_Bus)
);

insert into Terminal values 
('T-0001', 'Kalideres', 'Kalideres, Jakarta Barat'),
('T-0002', 'Poris', 'Poris Plawad, Kota Tangerang'),
('T-0003', 'Grogol', 'Grogol, Jakarta Barat');

insert into Pemilik_Perusahaan values
('A0001', 'Herman Rusly', '1965-08-12', 'Jawa Tengah'),
('A0002', 'Humam Akmal', '1970-03-26', 'Abu Dabi'),
('A0003', 'Haryanto Diningrat', '1967-05-28', 'Jawa Timur');

insert into Staff values
('0001S', 'Jamal', '1990-05-11', 'Jl. Abu Kabar No.7', 'Supir'),
('0002S', 'Maya Linata', '1998-02-28', '-', 'Pramugari'),
('0003S', 'Lintang Khatul', '2000-01-01', 'Jl. Pegangsaan Tenggara No.65', 'Montir');

insert into Perusahaan values 
('PO001', 'PT.Sinar Jaya', 'A0001', '200'),
('PO002', 'PT.Rosalia Indah', 'A0002', '300'),
('PO003', 'PO Haryanto', 'A0003', '250');

insert into Bus values
('B0001', 'Sinar Jaya', 'First Class Double Decker', 'Mercedes Bens', '0001S'),
('B0002', 'Rosalia Indah', 'Executive Plus Double Decker', 'Mercedes Bens', '0002S'),
('B0003', 'Sinar Jaya', 'Super Executive', 'Hino', '0001S');

insert into Perjalanan values
('00000001', 'PO001', 'B0001', '2023-04-11', 'TS-00001','TF-000010'),
('00000002', 'PO002', 'B0002', '2023-05-05', 'TS-00005','TF-000002'),
('00000003', 'PO003', 'B0003', '2024-01-01', 'TS-00101','TF-000067');

select * from Terminal;
select * from Pemilik_Perusahaan;
select * from Staff;
select * from Perusahaan;
select * from Bus;
select * from Perjalanan;



