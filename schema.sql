-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

--This table represents the patients
CREATE TABLE "patient" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "DOB" DATE NOT NULL,
    "country_id" TEXT,
    "clinic" TEXT NOT NULL,
    "lifestyle_id" INTEGER,
    "allergy_id" INTEGER,
    "medical_history_id" INTEGER,
    "blood_type" TEXT,
    "deceased" INTEGER NOT NULL CHECK("deceased" BETWEEN 0 AND 1) DEFAULT 0,
    PRIMARY KEY("id"),
    FOREIGN KEY("lifestyle_id") REFERENCES "lifestyle"("id"),
    FOREIGN KEY("allergy_id") REFERENCES "allergy"("id"),
    FOREIGN KEY("medical_history_id") REFERENCES "medical_history"("id")
);

--This is the table that includes all the country in the database
CREATE TABLE "country"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

--This table represent the many to many relatioship with patient and
--different treatments,visit surgeries procedures etc.
CREATE TABLE "medical_history" (
    "id" INTEGER,
    "patient_id" INTEGER,
    "surgery_id" INTEGER,
    "prescriptions_id" INTEGER,
    "visit_id" INTEGER,
    "treatment_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("patient_id") REFERENCES "patient"("id"),
    FOREIGN KEY("surgery_id") REFERENCES "surgery"("id"),
    FOREIGN KEY("prescription_id") REFERENCES "prescription"("id"),
    FOREIGN KEY("visit_id") REFERENCES "visit"("id"),
    FOREIGN KEY("treatment_id") REFERENCES "treatment"("id")
);

CREATE TABLE "prescription" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "brand" TEXT,
    "started_on" DATETIME,
    "finished_on" DATETIME,
    "reason" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "visit" (
    "id" INTEGER,
    "physician" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    "note" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "surgery" (
    "id" INTEGER,
    "physician" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    "notes" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "treatment" (
    "id" INTEGER,
    "physician" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    "notes" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "allergy" (
    "id" INTEGER,
    "patient_id" INTEGER,
    "allergic_to" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("patient_id") REFERENCES "patient"("id")
);

CREATE TABLE "lifestyle" (
    "id" INTEGER,
    "patient_id" INTEGER,
    "how_much_smoking_per_day" REAL NOT NULL,
    "how_much_drinking_per_week" REAL NOT NULL,
    "how_much_excercise_per_week_in_h" REAL NOT NULL,
    "job" TEXT NOT NULL,
     PRIMARY KEY("id"),
     FOREIGN KEY("patient_id") REFERENCES "patient"("id")
);


--reate indexes to speed common searches
--This is an index to quickly check the allergy of a patient useful incase of emergency
CREATE INDEX "patient_allergies" ON "allergy" ("patient_id");

--This index is to speed up query based on country specific informations.
CREATE INDEX "patient_contry" ON "country" ("id");

--This are to fast retreive a treatment of surgery based on the date or physician
CREATE INDEX "treatment_date" ON "treatment" ("date", "physician");
CREATE INDEX "surgery_date" ON "surgery" ("date", "physician");
CREATE INDEX "visit_date" ON "visit" ("date", "physician");
CREATE INDEX "prescription_dates" ON "prescription" ("date", "physician");

--Index to quickly find a patient medical history
CREATE INDEX "patient_medical_history" ON "medical_history" ("patient_id");

--To see quickly check if a patient is alive
CREATE INDEX "patient_deceased" ON "patient" ("deceased");


--Create view for complex query
--This is a view will show prescription of patients
CREATE VIEW "patient_medication" AS
SELECT "first_name", "last_name", "prescription"."name" FROM "patient"
JOIN "medical_history" ON "patient"."id" = "medical_history"."patient_id"
JOIN "prescription" ON "medical_history"."prescription_id" = "prescription"."id"
WHERE "prescription"."started_on" IS NOT NULL AND "prescription"."finished_on" IS NULL;

--View to check what patient are allergic to
CREATE VIEW "patient_allergies" AS
SELECT "first_name", "last_name", "allergy"."allergic_to" FROM "patient"
JOIN "allergy" ON "allergy"."id" = "patient"."allergy_id";

--Group patients by country
CREATE VIEW "patient_country" AS
SELECT "first_name", "last_name", "country"."name" FROM "patient"
JOIN "country" ON "patient"."country_id" = "country"."id";

--View of all the
CREATE VIEW "last_medical_intervention" AS
SELECT "first_name", "last_name",
"prescription"."date" AS "prescription_date",
"surgery"."date" AS "surgery_date",
"visit"."date" AS "visit_date",
"treatment"."date" AS "treatment_date"
FROM "medical_history"
JOIN "patient" ON "medical_history"."patient_id" = "patient"."id"
JOIN "surgery" ON "medical_history"."surgery_id" = "surgery"."id"
JOIN "prescription" ON "medical_history"."prescription_id" = "prescription"."id"
JOIN "visit" ON "medical_history"."visit_id" = "visit"."id"
JOIN "treatment" ON "medical_history"."treatment_id" = "treatment"."id";

--View of all lifestyle of patient
CREATE VIEW "patient_lifestyle" AS
SELECT "lifestyle"."how_much_smoking_per_day", "lifestyle"."how_much_drinking_per_week", "lifestyle"."how_much_excercise_per_week_in_h"
FROM "patient"
JOIN "lifestyle" ON "patient"."id" = "lifestyle"."patient_id";