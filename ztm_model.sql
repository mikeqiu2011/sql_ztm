create table student (
    student_id UUID primary key default uuid_generate_v4(),
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    email varchar(255) not null,
    date_of_birth date not null
);

create table if not exists subject(
    subject_id uuid primary key default uuid_generate_v4(),
    subject Text not null,
    description text
);

create TABLE if not exists teacher(
    teacher_id uuid primary key default uuid_generate_v4(),
    first_name VARCHAR(255) not NULL,
    last_name varchar(255) not NULL,
    email varchar(255) not NULL,
    date_of_birth date not null
);

create table if not exists course(
    course_id uuid primary key default uuid_generate_v4(),
    "name" text not NULL,
    description text,
    subject_id uuid REFERENCES subject (subject_id),
    teacher_id uuid REFERENCES teacher (teacher_id),
    feadback feedback[]  
);

create table if not exists enrollment(
    course_id uuid references course (course_id),
    student_id uuid references student (student_id),
    enrollment_date date not null,
    constraint pk_enrollment primary key (course_id, student_id)
);