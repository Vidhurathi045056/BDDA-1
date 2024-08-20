CREATE DATABASE IF NOT EXISTS aadhaar_enrolment;
USE aadhaar_enrolment;

CREATE TABLE enrolment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    enrolment_type ENUM('New Enrolment', 'Update') NOT NULL,
    resident_status ENUM('Resident Indian', 'Non-Resident Indian') NOT NULL,
    aadhaar_number VARCHAR(12) UNIQUE,
    update_type SET('Biometric Update', 'Mobile', 'Date of Birth', 'Address', 'Name', 'Gender', 'Email', 'Document update', 'Language only Update'),
    name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Transgender') NOT NULL,
    age INT,
    date_of_birth DATE,
    address_c_o VARCHAR(255),
    house_no VARCHAR(100),
    street VARCHAR(255),
    landmark VARCHAR(255),
    ward_no VARCHAR(50),
    area VARCHAR(255),
    village_city VARCHAR(255),
    post_office VARCHAR(255) NOT NULL,
    district VARCHAR(255),
    sub_district VARCHAR(255),
    state VARCHAR(255),
    email VARCHAR(255),
    mobile VARCHAR(15),
    pin_code VARCHAR(6) NOT NULL,
    verification_type ENUM('Document Based', 'Head of Family (HoF) Based'),
    document_poi VARCHAR(255),
    document_poa VARCHAR(255),
    document_dob VARCHAR(255),
    hof_aadhaar VARCHAR(12),
    hof_name VARCHAR(100),
    hof_relationship ENUM('Father', 'Mother', 'Guardian', 'Husband', 'Wife', 'Others'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE document_update (
    id INT AUTO_INCREMENT PRIMARY KEY,
    enrolment_id INT,
    document_type ENUM('POI', 'POA', 'DOB', 'POR') NOT NULL,
    document_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (enrolment_id) REFERENCES enrolment(id) ON DELETE CASCADE
);

CREATE TABLE biometric_update (
    id INT AUTO_INCREMENT PRIMARY KEY,
    enrolment_id INT,
    photo BLOB,
    fingerprint BLOB,
    iris_scan BLOB,
    FOREIGN KEY (enrolment_id) REFERENCES enrolment(id) ON DELETE CASCADE
);

CREATE TABLE hof_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    enrolment_id INT,
    hof_aadhaar VARCHAR(12) NOT NULL,
    hof_name VARCHAR(100) NOT NULL,
    relationship ENUM('Father', 'Mother', 'Guardian', 'Husband', 'Wife', 'Others') NOT NULL,
    FOREIGN KEY (enrolment_id) REFERENCES enrolment(id) ON DELETE CASCADE
);

SHOW TABLES LIKE 'enrolment';

-- If it exists, you can directly create hof_details, otherwise recreate it as shown below:

-- Drop the tables if they exist to start clean
DROP TABLE IF EXISTS hof_details;
DROP TABLE IF EXISTS enrolment;

-- Recreate the enrolment table
CREATE TABLE enrolment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    enrolment_type ENUM('New Enrolment', 'Update') NOT NULL,
    resident_status ENUM('Resident Indian', 'Non-Resident Indian') NOT NULL,
    aadhaar_number VARCHAR(12) UNIQUE,
    update_type SET('Biometric Update', 'Mobile', 'Date of Birth', 'Address', 'Name', 'Gender', 'Email', 'Document update', 'Language only Update'),
    name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Transgender') NOT NULL,
    age INT,
    date_of_birth DATE,
    address_c_o VARCHAR(255),
    house_no VARCHAR(100),
    street VARCHAR(255),
    landmark VARCHAR(255),
    ward_no VARCHAR(50),
    area VARCHAR(255),
    village_city VARCHAR(255),
    post_office VARCHAR(255) NOT NULL,
    district VARCHAR(255),
    sub_district VARCHAR(255),
    state VARCHAR(255),
    email VARCHAR(255),
    mobile VARCHAR(15),
    pin_code VARCHAR(6) NOT NULL,
    verification_type ENUM('Document Based', 'Head of Family (HoF) Based'),
    document_poi VARCHAR(255),
    document_poa VARCHAR(255),
    document_dob VARCHAR(255),
    hof_aadhaar VARCHAR(12),
    hof_name VARCHAR(100),
    hof_relationship ENUM('Father', 'Mother', 'Guardian', 'Husband', 'Wife', 'Others'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Now create the hof_details table
CREATE TABLE hof_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    enrolment_id INT,
    hof_aadhaar VARCHAR(12) NOT NULL,
    hof_name VARCHAR(100) NOT NULL,
    relationship ENUM('Father', 'Mother', 'Guardian', 'Husband', 'Wife', 'Others') NOT NULL,
    FOREIGN KEY (enrolment_id) REFERENCES enrolment(id) ON DELETE CASCADE
);