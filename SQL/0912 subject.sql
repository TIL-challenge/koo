use ssafydb;
#학급(t_class)
# no int pk auto increment
# loc - enum 서울, 대전, 구미, 부울경, 광주, not null
# class_no int not null, 1<=class_no<=20 check 

create table t_class(
	no int not null auto_increment,
    loc enum('서울', '대전', '구미', '부울경', '광주') not null,
    class_no int not null,
    constraint t_class_pk primary key(no),
    constraint class_no_check check (0<=class_no and class_no<=20)
);
desc t_class;
# 학생들(t_student)
# no, int, pk ai
# name varchar 100자, not null
# class - t_class의 no - foreign key, not null
# email - unique

create table t_student(
	no int auto_increment,
    name varchar(100) not null,
    class int not null,
    email varchar(100),
    constraint t_student_pk primary key(no),
    constraint t_student_email_unique unique(email),
    constraint t_student_class_tclass_no foreign key(class) references t_class(no)
);
desc t_student;

# 제약 사항을 위배하면서 t_class에 데어트를 추가해보자.
insert into t_class(loc, class_no) values('뉴욕',10);
insert into t_class(loc, class_no) values('광주',-1);
insert into t_class(loc, class_no) values('서울',5);

insert into t_student(name, class) values('강희진', 1);
insert into t_student(name, class) values('구본관', 2);
select * from t_class;
select * from t_student;

#직원의 ID, Email, 관리자 id, 관리자 eal 조회
create or replace view emp_with_manager
as
select e.employee_id as emp_id, e.email as emp_email, m.employee_id as man_id, m.email as man_email
from employees e join employees m on a.manager_id = m.enpkoyee_id;
