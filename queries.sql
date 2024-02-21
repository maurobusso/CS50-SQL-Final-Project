-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

--select all patient in one country
SELECT * FROM "patient_country"
WHERE "name" = 'United States';

--order all the prescription
SELECT "prescription_date" FROM "last_medical_intervention"
ORDER BY "prescription_date";

--order all surgery
SELECT "surgery_date" FROM "last_medical_intervention"
ORDER BY "surgery_date";

--select a physician by name
SELECT "id", "date" FROM "surgery"
WHERE "physician" = "Dr. Mauro Busso"

--count the number of patient allergic to something
SELECT COUNT("id") FROM "patient_allergies"
WHERE "allergic_to" = 'Penicillin';

--number of surgery in a certain period of time
SELECT COUNT("id") FROM "last_medical_intervention"
WHERE "surgery_date" = '2023-10-01';


--add new prescription
INSERT INTO "prescription" ("id", "name", "brand", "started_on", "finished_on", "reason")
VALUES ('1', 'Ibuprofen', NULL, '2023-10-01', NULL, 'fever');

--add new patient
INSERT INTO "patient" (
    "id",
    "first_name",
    "last_name",
    "address",
    "DOB",
    "country_id",
    "registered_clinic",
    "lifestyle_id",
    "allergy_id",
    "blood_type",
    "deceased",
)
VALUES (
    1,
    'Mauro',
    'Busso',
    'Stevenage Road 6',
    '1993-01-06',
    'United Kingdom',
    'St Nichola Health Center',
    '1',
    '1',
    '0+'
    0
);

--add a new allergy
INSERT INTO "allergy" ("id", "allergic_to")
VALUES ('1', 'peanut');

--add lifestyle
INSERT INTO "lifestyle" ("id", "patient_id", "how_much_smoking_per_day",
"how_much_drinking_per_week", "how_much_excercise_per_week_in_h", "job")
VALUES ('1', '2', '20', NULL, '6', 'software engineer');


--update country of a patient
UPDATE "patient" SET "country_id" = (
    SELECT "id" FROM "country"
    WHERE "name" = 'United States'
)
WHERE "id" = (
    SELECT "id" FROM "patient"
    WHERE "first_name" = 'Mauro' AND "last_name" = 'Busso'
);

--update treatment notes
UPDATE "treatment" SET "note" = 'new note here'
WHERE "id" = '11' AND "date" = '2023-10-02';

--update patient details
UPDATE "patient" SET ("first_name" = 'Mauro', "DOB" = '1993-10-1', "registered_clinic" = 'Cheels Surgery')
WHERE "id" = '1';

--update patient when deceased
UPDATE "patient" SET "deceased" = 1
WHERE "id" = (
    SELECT "id"
    FROM "patient"
    WHERE "first_name" = 'Jessica'
    AND "last_name" = 'Day'
    AND "DOB" = '1992-10-23'
    AND "address" = 'George st 12'
);

--delete a patient
DELETE FROM "patient" WHERE "id" = (
    SELECT "id"
    FROM "patient"
    WHERE "first_name" = 'Winston'
    AND "last_name" = 'Bishop'
    AND "DOB" = '1992-10-23'
    AND "address" = 'George st 12'
);

--delete allergies
DELETE FROM "allergy" WHERE "id" = (
    SELECT "id"
    FROM "patient"
    WHERE "first_name" = 'Nick'
    AND "last_name" = 'Miller'
    AND "DOB" = '1992-10-23'
    AND "address" = 'George st 12'
);