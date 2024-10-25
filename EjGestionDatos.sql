drop database  if exists Hospital;
Create database Hospital;
use Hospital;

create table Psicologo(
	N_Licencia int primary key ,
    Nombre varchar(50) not null,
    Tlf int ,
    Edad tinyint 
    
);
create table Paciente(
	DNI char(9) primary key ,
    Nombre varchar(50),
    Tlf int,
    Direccion varchar(50)
);
create table Cita(
	IDCita int primary key unique auto_increment,
    N_Licencia int,
    DNI char(9),
    Fecha date not null,
    Hora time not null,
    Modalidad set("presencial","telefono","videollamada") not null,
	foreign key (N_Licencia) references Psicologo(N_Licencia),
    foreign key (DNI) references Paciente(DNI)
    
);


insert into Psicologo values ("12345", "Dr. Juan Pérez", 5551234, "45");
insert into Psicologo values ("67890", "Dra. Ana Gómez", 5555678, "38");
insert into Psicologo values ("11223", "Dr. Luis Fernández", 5559012, "50");



insert into Paciente values ("11111111A", 'Marta López', 6661111, "Calle Falsa 123");
insert into Paciente values ("22222222B", 'Carlos Ruiz', 6662222, "Avenida Siempre Viva 456");
insert into Paciente values ("33333333C", 'Laura Martínez', 6663333, "Paseo de la Reforma 789");
insert into Paciente values ("44444444D", 'Javier Torres', 6664444, "Plaza Mayor 101");
insert into Paciente values ("55555555E", 'Patricia Sánchez', 6665555, "Calle de la Paz 202");
insert into Paciente values ("66666666F", 'Andrés García', 6666666, "Av. de la Libertad 303");
insert into Paciente values ("77777777G", 'Sofía Jiménez', 6667777, "Ctra. de la Esperanza 404");
insert into Paciente values ("88888888H", 'Fernando Delgado', 6668888, "Calle de la Amistad 505");
insert into Paciente values ("99999999I", 'Rosa Castillo', 6669999, "Av. del Progreso 606");
insert into Paciente values ("00000000J", 'David Méndez', 6660000, "C/ de la Alegría 707");



insert into Cita values (001, '12345', "11111111A", "2024-10-15", "10:00", "Presencial");
insert into Cita values (002, '67890', "22222222B", "2024-10-16", "11:00", "Teléfono");
insert into Cita values (003, '12345', "55555555E", "2024-10-17", "14:00", "Videollamada");
insert into Cita values (004, '11223', "77777777G", "2024-10-18", "9:30", "Videollamada");
insert into Cita values (005, '12345', "99999999I", "2024-10-19", "17:00", "Presencial");
insert into Cita values (006, '67890', "33333333C", "2024-10-20", "19:30", "Presencial");
insert into Cita values (007, '12345', "00000000J", "2024-10-21", "12:00", "Presencial");
insert into Cita values (008, '11223', "22222222B", "2024-10-22", "15:45", "Teléfono");
insert into Cita values (009, '11223', "11111111A", "2024-10-23", "11:15", "Teléfono");
insert into Cita values (010, '12345', "88888888H", "2024-10-24", "10:00", "Presencial");


insert into Cita values (011, '67890', "11111111A", "2024-11-10", "9:00", "Presencial");
insert into Cita values (012, '11223', "88888888H", "2024-11-11", "15:00", "Videollamada");
insert into Cita values (013, '11223', "22222222B", "2024-11-12", "18:00", "Presencial");
insert into Cita values (014, '67890', "66666666F", "2024-11-13", "19:30", "Teléfono");
insert into Cita values (015, '12345', "88888888H", "2024-11-14", "12:00", "Presencial");
insert into Cita values (016, '12345', "77777777G", "2024-11-15", "14:00", "Teléfono");
insert into Cita values (017, '67890', "22222222B", "2024-11-16", "21:00", "Presencial");
insert into Cita values (018, '12345', "99999999I", "2024-11-17", "9:30", "Videollamada");
insert into Cita values (019, '12345', "11111111A", "2024-11-18", "10:00", "Presencial");
insert into Cita values (020, '11223', "33333333C", "2024-11-19", "20:00", "Presencial");

insert into Cita values (021, '67890', "22222222B", "2024-12-10", "20:00", "Presencial");
insert into Cita values (022, '67890', "99999999I", "2024-12-11", "20:00", "Teléfono");
insert into Cita values (023, '11223', "22222222B", "2024-12-12", "20:00", "Presencial");
insert into Cita values (024, '11223', "88888888H", "2024-12-13", "20:00", "Videollamada");
insert into Cita values (025, '12345', "33333333C", "2024-12-14", "20:00", "Presencial");
insert into Cita values (026, '67890', "77777777G", "2024-12-15", "20:00", "Videollamada");
insert into Cita values (027, '12345', "33333333C", "2024-12-16", "20:00", "Teléfono");
insert into Cita values (028, '11223', "11111111A", "2024-12-17", "20:00", "Videollamada");
insert into Cita values (029, '12345', "66666666F", "2024-12-18", "20:00", "Presencial");
insert into Cita values (030, '11223', "33333333C", "2024-12-19", "20:00", "Teléfono");
