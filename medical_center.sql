-- in terminal:
-- psql < medical_center.sql
-- psql medical_center

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty TEXT NOT NULL,
    accept_new_patient BOOLEAN NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    gender TEXT NOT NULL,
    birth_date DATE NOT NULL,
    height_inch INTEGER,
    weight_lb FLOAT
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    doctor_id INTEGER REFERENCES doctors,
    patient_id INTEGER REFERENCES patients,
    note TEXT
);

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits,
    disease_id INTEGER REFERENCES diseases
);

INSERT INTO doctors 
    (first_name, last_name, specialty, accept_new_patient)
VALUES
    ('Feihong', 'Ding', 'Internal Medicine', false),
    ('Nancy', 'Wang', 'Urology', true),
    ('Lindsay', 'Brown', 'Ophthalmology', true),
    ('Lucy', 'Ting', 'Family Medicine', false),
    ('Andrew', 'Shipton', 'Orthopaedics & Sports Medicine', true),
    ('Eric', 'Wong', 'Allergy', true),
    ('Anson', 'Hwang', 'Physical Therapy', false),
    ('Peirun', 'Ng', 'Physical Therapy', true),
    ('Adina', 'Leung', 'Physical Therapy', true);

INSERT INTO patients
    (first_name, last_name, gender, birth_date, height_inch, weight_lb)
VALUES
    ('Dina', 'Dee', 'Female', '1980-10-15', 62, 105.5),
    ('Raj', 'Kha', 'Male', '1988-02-09', Null, Null),
    ('Daniella', 'Albert', 'Non-binary', '1990-05-16', Null, Null),
    ('Christian', 'Bell', 'Male', '1975-02-28', Null, Null);

INSERT INTO diseases
    (name, description)
VALUES
    ('Interstitial Cystitis (IC)', 'nterstitial cystitis (IC), also known as bladder pain syndrome, is a chronic condition that causes bladder pain, pressure, and discomfort. The pain can range from mild to severe and can be felt below the belly button. IC can also cause an urgent or frequent need to urinate, and the bladder may not be able to hold as much urine as it used to. The condition can affect anyone at any age, but it is more common in women.'),
    ('Hip Impingement', 'Hip impingement, or femoroacetabular impingement (FAI), occurs when the femoral head (ball of the hip) pinches up against the acetabulum (cup of the hip). When this happens, damage to the labrum (cartilage that surrounds the acetabulum) can occur, causing hip stiffness and pain, and can lead to arthritis.'),
    ('HIV', 'Human immunodeficiency virus (HIV) is a virus that attacks the body''s immune system. Acquired immunodeficiency syndrome (AIDS) occurs at the most advanced stage of infection. HIV targets the body''s white blood cells, weakening the immune system.'),
    ('Allergic Rhinitis', 'Allergic rhinitis (AR) is an atopic disease characterized by symptoms of nasal congestion, clear rhinorrhea, sneezing, postnasal drip, and nasal pruritis. It affects one in six individuals and is associated with significant morbidity, loss of productivity, and healthcare costs.'),
    ('Astigmatism', 'Astigmatism is a common eye condition that occurs when the cornea or lens of the eye is an abnormal shape, causing light to bend differently as it enters the eye.'),
    ('Frequent UTI', 'Frequent urinary tract infections (UTIs), also known as recurrent UTIs or chronic cystitis, can be caused by a number of factors.'),
    ('Knee pain', ''),
    ('Nearsightedness', 'earsightedness is a refractive error that makes far-away objects look blurry.');

INSERT INTO visits
    (date, doctor_id, patient_id, note)
VALUES
    ('2019-05-05', 2, 1, 'Patient reported bladder pain and is diagnosed with IC'),
    ('2023-12-15', 1, 1, 'Patient came in for chronic left hip/knee pain and is referred to physical therapy'),
    ('2024-01-16', 8, 1, 'Physical therapy evaluation for left hip/knee pain.'),
    ('2024-02-01', 8, 1, 'Evaluate progress from physical therapy exercises in the last two weeks. Patient reported reduced pain.'),
    ('2024-06-28', 8, 2, 'Physical therapy evaluation for right knee injury.'),
    ('2022-04-25', 4, 3, 'Patient requested an HIV test.'),
    ('2022-06-22', 2, 3, 'Patient have frequent UTI and long-term antibiotics is prescribed.'),
    ('2004-11-18', 6, 4, 'Patient came in for seasonal allergy. OTC medicine is prescribed.'),
    ('2020-01-23', 3, 1, 'Astigmatism and near-sighted diagnosed.'),
    ('2024-07-06', 3, 2, 'Astigmatism is diagnosed after testing.');

INSERT INTO diagnoses
    (visit_id, disease_id)
VALUES
    (1, 1),
    (1, 1),
    (2, 2),
    (3, 2),
    (4, 2),
    (5, 7),
    (6, 3),
    (6, 6),
    (7, 6),
    (8, 4),
    (9, 5),
    (9, 8),
    (10, 5);
