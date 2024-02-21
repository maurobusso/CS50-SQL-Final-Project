# Design Document

Global Health care Database
By Mauro Busso
London UK

Video overview: https://youtu.be/gbu0T5bOB6w

## Scope

In this, perhaps a bit ambitious, final project for CS50 SQL you can see all the code to implement and start a global health database.
It will store healthcare records, including patient information, medical history, prescriptions etc.

* What is the purpose of your database?
The purpose of this database is to record patients health details all around the world in order to help understand health care trends and for research purposes.

* Which people, places, things, etc. are you including in the scope of your database?
This DB includes:
Patients and their identity informations
Country of residence
The medical history is divided into:
  -visits
  -prescriptions
  -surgery
  -and tretments
Allergies which includes all the allergiers of the patient
Lifestyle in which is a general overview of how a patient conduct his life, health wise.

* Which people, places, things, etc. are *outside* the scope of your database?
Is not gonna include and extensive list of all the medications and diseases.
Is going to assume that a patient is treated is only one country.
Not going to have a database of the single clinics in every country
Will not comprend a database of the physiscians

## Functional Requirements

* What should a user be able to do with your database?
CRUD operations with patients
Been able to standardize data across different country
Been able to trace an accurate picture of the medical history of a person.

* What's beyond the scope of what a user should be able to do with your database?
It will not support specialized security features.
Wont support different languages which would be important for a global scale project.

## Representation

Here are the following schema for SQLite tables

### Entities

The database includes the following entities:

#### Patient
The `Patient` table contains:

* `id`, which specifies the unique ID for the patient as an `INTEGER`. This column has the `PRIMARY KEY` constraint applied.
* `first_name`, specifies the patient's first name as `TEXT`, given `TEXT` is appropriate for name fields.
* `last_name`, specifies the patient's last name. `TEXT` is used for the same reason as `first_name`.
* `address`, this specifies the address of the patient. `TEXT` type is used.
* `DOB`, this is the date of birth of the patient and the `DATE` type is used in this occasion.
* `country_id` this is the id of the country the patient is resindent in, it is a foreign key that reference the country table.
* `clinic` this cointaint the name of the clinic in which the patient is registered to.
* `lifestyle_id` this reference the lifestyle table therefore is a foreign key
* `allergy_id` this is also referencing a table in this case the allergy table that contain all the possible allergies that a patient might have. This too is a foreign key.
* `blood_type` this is a column the contain the blood type of the patient and it has been assign a type of `TEXT`. It can be NULL because this info is not always available.
* `deceased` this will contain a value of either 1 or 0 where a 1 represent patient has passed and a 0 will mean that patient still alive. Type `INTEGER`. It has also been set `DEFAULT` value of 0 and a check

Most of the fields have `NOT NULL` where a foreigh key or primary key constraint are not applied however few column can have a value of null where information are not available such as blood type.

#### Country
The countrytable includes:

* `id`, this is the unique id for the country and is set as `INTEGER`. It also Has the primary key.
* `name`, this is the name of the country and the data type is `TEXT` also it can not be null so `NOT NULL` has been applied.

#### Medical History
This table rapresent a many to many relatioship and it consist of

* `id` as in the previus tables ,this is the unique id for this table and is set as `INTEGER`. It also Has the primary key.
* `patient_id` which is the id of the patient as `INTEGER` and has the `FOREIGN KEY` whit all constraint applied referencing the `id` column in the patient table. Making sure each medical history belongs to a patient.
* `surgery_id` this is the id of the surgery as `INTEGER` and again has the `FOREIGN KEY` with all the constraints applied referencing the `id` column in the surgery table.
* `prescriptions_id` id of the prescription as `INTEGER` with `FOREIGN KEY` referencing the `id` column in the prescription table.
* `visit_id` id for the visit as `INTEGER` with `FOREIGN KEY` referencing the `id` column in the visit table.
* `treatment_id` id of the tratment as `INTEGER` with `FOREIGN KEY` referencing the `id` column in the prescription table.

#### Prescription

* `id` this is the unique id for this table and is set as `INTEGER`. It also has the primary key.
* `name` name of the medication prescribed as type `TEXT`
* `brand` name of the brand as there are multiple brands selling the same medication sometimes (admitidly not supre important) type affinity `TEXT`
* `started_on` when the drug was started type `DATETIME` rather than just `DATE` because sometime when it comes to drug administration even the hour matter.
* `finished_on` when the drug was finished type `DATETIME` same reason as above.
* `reason` this is the reason why the drug was prescribed. Type `TEXT`

#### Visit

* `id` this is the unique id for this table and is set as `INTEGER`. It also has the primary key.
* `physician` name of the doctor visiting the patient type `TEXT`
* `reason` this is the reason why the visit was scheduled type `TEXT`
* `date` when the visit was performed `DATE`
* `note` this are the note from the doctor type `TEXT`

#### Surgery

* `id` this is the unique id for this table and is set as `INTEGER`. It also has the primary key.
* `physician` name of the doctor visiting the patient type `TEXT`
* `type` this is the type of procedure had from the patient type `TEXT`
* `date` when the visit was performed `DATE`
* `note` this are the note from the doctor type `TEXT`

#### Treatment

* `id` this is the unique id for this table and is set as `INTEGER`. It also has the primary key.
* `physician` name of the doctor visiting the patient type `TEXT`
* `reason` this is the reason why the visit was scheduled type `TEXT`
* `date` when the visit was performed `DATE`
* `note` this are the note from the doctor type `TEXT`

#### Allergy

* `id` this is the unique id for this table and is set as `INTEGER`. It also has the primary key.
* `patient_id` which is the id of the patient as `INTEGER` and has the `FOREIGN KEY` whit all constraint applied referencing the `id` column in the patient table. Making sure each allery belongs to a patient.
* `allergic_to` this is what the patient is allergic to it can obviusly be null as not everyone is allergic to something. type `TEXT`

#### Lifestyle

* `id` unique id for this table and is set as `INTEGER` with the primary key.
* `patient_id` `FOREIGN KEY`referencing the id in the patient table this has type `INTEGER`
* `how_much_smoking_per_day` this is the number of cigaret smoked in one day and it is set to be `REAL` number to include floating numbers.
* `how_much_drinking_per_week` this is how much unit of alchol the patient drink in one week and it is set to be `REAL` number to include floating numbers.
* `how_much_excercise_per_week_in_h` this is the ammount of hours the patient spen excercising of doing physical activity in one week and again it is set to be `REAL` number to include floating numbers.
* `job` this is the job of the patient of type `TEXT`

### Relationships

![ER Diagram](cs50-sql-project.jpg)

In this section, you should include your entity-relationship diagram and describe the relationships between the entities in your database.

As shown in the diagram

* A patient can have one and only one country of origin, and a country can have 0 or many patients.
* A patient can have one and only one lifestyle; however, a lifestyle can have multiple patients, as a lifestyle can be shared among multiple patients.
* Patients can have multiple allergies, and allergies can be present in multiple people or not present at all. So in both directions, there is a zero-to-many relationship.
* In the case of medical history, a patient can have one and only one medical history comprising multiple health interventions, and multiple patients can share, even if rarely, the same medical history.
* For the last four tables, surgery, prescription, visit, and treatment, the medical history table can have zero or more for each of these tables, and the same is true in the opposite direction: a surgery, prescription, visit, or treatment can be in multiple patient medical histories. Although if a medical history doesn't have any of the above, it is not really a medical history at all.

## Optimizations

* Which optimizations (e.g., indexes, views) did you create? Why?

Some of the typical query that can be run are, looking if a patient is allergic to something. So an index with `patient_id` in the allergy teble has been created.
Similarly looking for a patient by country or looking for all patient who are not deceased. Therefore indexes on the country table on the `id` column and on the patient table `deceased` column have been created.
One common query could be to find the most recent medical intervention by date or by physician name, therefore indexes on the `date` and `physician` columns have been made in the treatment, surgery, visit and prescription tables.
One index on medical_history table was made to speed the retrival of the medical history by `patient_id`.

Regarding views
One has been created to show all the prescription that a patient is currently on. Using a `JOIN` statement to unite medical_history and prescription on the patient table. But selecting only medication where finished_on `IS NULL`.
Another one has been crteated to check the name and what are they allergic to using `JOIN` on the `patient` table.
One was created to quickly retrieve and display the `first_name` and `last_name` of a patient and their `country`.
A view was created to see a list of `lifestyle` informations using `JOIN` on `lifestyle` to `patient` table
The last table was made to create a view of all the medical interventions ordered by date and `JOIN` was used to unite the `surgery`, `visit`, `treatment` and `prescription` table dates on to the patient table. This will help to organize and track data.

## Limitations

* What are the limitations of your design?
* What might your database not be able to represent very well?

* This database desgin assume the health care in the country is free.
* To make this database more comprehensive, additional tables could be considered. These might include a table for all the clinics in a country and a table listing all the physicians registered in a country.
* Currently, the database assumes that a patient will always be treated in one country.
* For a more practical real-world application, it might be necessary to include table translations.
* This database does not contain soft deletion system (which it could be beneficial with the appropriate security measures)
* Additionally, the lifestyle data may not always be reliable.
* Most importantly patient details are not anonymized.