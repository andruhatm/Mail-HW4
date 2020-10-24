CREATE TABLE "Tutors" (
        "id" serial NOT NULL,
        "name" varchar(50) NOT NULL,
        "surname" varchar(50) NOT NULL,
        "email" varchar(100) NOT NULL,
        "phone" varchar(20) NOT NULL,
        CONSTRAINT "Tutors_pk" PRIMARY KEY ("id")
) WITH (
      OIDS=FALSE
);

CREATE TABLE "Students" (
        "id" serial NOT NULL,
        "name" varchar(50) NOT NULL,
        "surname" varchar(50) NOT NULL,
        "email" varchar(50) NOT NULL,
        "phone" varchar(20) NOT NULL,
        CONSTRAINT "Students_pk" PRIMARY KEY ("id")
) WITH (
      OIDS=FALSE
    );

CREATE TABLE "Courses" (
        "id" serial NOT NULL,
        "name" varchar(255) NOT NULL,
        "duration" varchar(255) NOT NULL,
        "description" varchar(255) NOT NULL,
        CONSTRAINT "Courses_pk" PRIMARY KEY ("id")
) WITH (
      OIDS=FALSE
    );

CREATE TABLE "courses_schedule" (
        "id" serial NOT NULL,
        "course_id" int NOT NULL,
        "Lecturer" int NOT NULL,
        "date" DATE NOT NULL,
        CONSTRAINT "courses_schedule_pk" PRIMARY KEY ("id")
) WITH (
      OIDS=FALSE
    );

CREATE TABLE "course_students" (
        "id" serial NOT NULL,
        "course_id" int NOT NULL,
        "student_id" int NOT NULL,
        CONSTRAINT "course_students_pk" PRIMARY KEY ("id")
) WITH (
      OIDS=FALSE
    );

CREATE TABLE "Progress" (
        "id" serial NOT NULL,
        "lecture_id" int NOT NULL,
        "student_id" int NOT NULL,
        "check_in" bool NOT NULL,
        "homework" bool NOT NULL,
        CONSTRAINT "Progress_pk" PRIMARY KEY ("id")
) WITH (
      OIDS=FALSE
    );

ALTER TABLE "courses_schedule" ADD CONSTRAINT "courses_schedule_fk0" FOREIGN KEY ("course_id") REFERENCES "Courses"("id");
ALTER TABLE "courses_schedule" ADD CONSTRAINT "courses_schedule_fk1" FOREIGN KEY ("Lecturer") REFERENCES "Tutors"("id");

ALTER TABLE "course_students" ADD CONSTRAINT "course_students_fk0" FOREIGN KEY ("course_id") REFERENCES "Courses"("id");
ALTER TABLE "course_students" ADD CONSTRAINT "course_students_fk1" FOREIGN KEY ("student_id") REFERENCES "Students"("id");

ALTER TABLE "Progress" ADD CONSTRAINT "Progress_fk0" FOREIGN KEY ("lecture_id") REFERENCES "courses_schedule"("id");
ALTER TABLE "Progress" ADD CONSTRAINT "Progress_fk1" FOREIGN KEY ("student_id") REFERENCES "Students"("id");
