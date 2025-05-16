-- Create a new Database
CREATE DATABASE clinic; 

USE clinic;

-- Departments table
CREATE TABLE Departments(
   department_id INT PRIMARY KEY,
   name VARCHAR(50) NOT NULL
 );
 
 -- Doctors Table
 CREATE TABLE Doctors(
   doctor_id INT PRIMARY KEY,
   name VARCHAR(100) NOT NULL,
   specialization VARCHAR(150) NOT NULL,
   department_id INT,
   FOREIGN KEY(department_id)
   REFERENCES Departments(department_id)
);

-- Patients Table
CREATE TABLE Patients(
  patient_id INT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender ENUM('Male', 'Female', 'Other') NOT NULL,
  identity_number VARCHAR(15) NOT NULL UNIQUE,
  phone_number VARCHAR(15) NOT NULL,
  email VARCHAR(100)
  );
  
-- Appointments Table
CREATE TABLE Appointments(
  appointment_id INT PRIMARY KEY,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  appointment_date DATE NOT NULL,
  notes TEXT,
  FOREIGN KEY(patient_id)
  REFERENCES Patients(patient_id),
  FOREIGN KEY( doctor_id)
  REFERENCES Doctors(doctor_id)
  );
   
-- Treatments Table
CREATE TABLE Treatments(
  treatment_id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
  );
  
-- Appointment_Treatments Table
CREATE TABLE Appointment_Treatments(
  appointment_id INT,
  treatment_id INT,
  PRIMARY KEY (appointment_id, treatment_id),
  FOREIGN KEY(appointment_id) 
  REFERENCES Appointments(appointment_id),
  FOREIGN KEY (treatment_id)
  REFERENCES Treatments(treatment_id)
  );
  
  
  

 