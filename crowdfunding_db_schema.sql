-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Student
-- -
-- StudentID int PK
-- Name varchar(30)
-- DepartmentID int
-- Adress varchar(50)
-- DateOfBirth date
-- Course
-- -
-- CourseID int PK
-- StudentID int
-- LessonID int
-- Description varchar(50)
-- StartDate date
-- EndDate date
-- Lesson
-- -
-- LessonID int PK
-- Description varchar(30)
-- TutorID int
-- Tutor
-- -
-- TutorID int PK
-- Name varchar(30)
-- Title varchar(30)

CREATE TABLE "Category" (
    "category_id" varchar(10)   NOT NULL,
    "category" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "Subcategory" (
    "subcategory_id" varchar(10)   NOT NULL,
    "subcategory" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "Campaign" (
    "cf_id" int(64)   NOT NULL,
    "contact_id" int(64)   NOT NULL,
    "company_name" varchar(200)   NOT NULL,
    "description" varchar(200)   NOT NULL,
    "goal" float(64)   NOT NULL,
    "pledged" float(64)   NOT NULL,
    "outcome" varchar(200)   NOT NULL,
    "backers_count" int64   NOT NULL,
    "country" varchar(200)   NOT NULL,
    "currency" varchar(200)   NOT NULL,
    "launch_date" datetime   NOT NULL,
    "end_date" datetime   NOT NULL,
    "category_id" varchar(200)   NOT NULL,
    "subcategory_id" varchar(200)   NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "Contacts" (
    "contact_id" int(64)   NOT NULL,
    "first_name" varchar(200)   NOT NULL,
    "last_name" varchar(200)   NOT NULL,
    "email" varchar(200)   NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY (
        "contact_id"
     )
);

ALTER TABLE "Category" ADD CONSTRAINT "fk_Category_category_id" FOREIGN KEY("category_id")
REFERENCES "Campaign" ("category_id");

ALTER TABLE "Subcategory" ADD CONSTRAINT "fk_Subcategory_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "Campaign" ("subcategory_id");

ALTER TABLE "Contacts" ADD CONSTRAINT "fk_Contacts_contact_id" FOREIGN KEY("contact_id")
REFERENCES "Campaign" ("contact_id");

