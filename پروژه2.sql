-- =========================
-- Organization (حداقل 15)
-- =========================

-- 1. غیرفعال کردن محدودیت‌ها
PRAGMA foreign_keys = OFF;
DELETE FROM Payment;
DELETE FROM Invoice;
DELETE FROM ServiceUsage;
DELETE FROM EventParticipant;
DELETE FROM Event;
DELETE FROM Booking;
DELETE FROM MemberPlanHistory;
DELETE FROM Member;
DELETE FROM Staff;
DELETE FROM Space;
DELETE FROM MembershipPlan;
DELETE FROM Organization;
PRAGMA foreign_keys = ON;

INSERT INTO Organization VALUES (1,'AlphaTech','Startup','info@alphatech.com');
INSERT INTO Organization VALUES (2,'NovaSoft','Company','contact@novasoft.com');
INSERT INTO Organization VALUES (3,'FreelanceHub','Freelancer','hello@fhub.com');
INSERT INTO Organization VALUES (4,'DataWorks','Company','data@works.com');
INSERT INTO Organization VALUES (5,'TeamX','Team','teamx@mail.com');
INSERT INTO Organization VALUES (6,'DigitalLab','Startup','digital@lab.com');
INSERT INTO Organization VALUES (7,'BetaCorp','Company','beta@corp.com');
INSERT INTO Organization VALUES (8,'CodeSpace','Startup','code@space.com');
INSERT INTO Organization VALUES (9,'Visionary','Company','vision@mail.com');
INSERT INTO Organization VALUES (10,'FutureMakers','Team','future@makers.com');


-- =========================
-- MembershipPlan (حداقل 3)
-- =========================
INSERT INTO MembershipPlan VALUES (1,'Basic',50,10,0.0);
INSERT INTO MembershipPlan VALUES (2,'Pro',120,30,0.1);
INSERT INTO MembershipPlan VALUES (3,'Premium',200,50,0.15);
INSERT INTO MembershipPlan VALUES (4,'Enterprise',350,100,0.2);


-- =========================
-- Member (حداقل 20)
-- =========================
INSERT INTO Member VALUES (1,'Ali','Ahmadi','ali@mail.com','0912000001','2024-01-10',1);
INSERT INTO Member VALUES (2,'Sara','Karimi','sara@mail.com','0912000002','2024-01-15',1);
INSERT INTO Member VALUES (3,'Reza','Moradi','reza@mail.com','0912000003','2024-02-01',2);
INSERT INTO Member VALUES (4,'Neda','Hashemi','neda@mail.com','0912000004','2024-02-05',3);
INSERT INTO Member VALUES (5,'Mina','Jafari','mina@mail.com','0912000005','2024-02-10',NULL);
INSERT INTO Member VALUES (6,'Hamed','Rahimi','hamed@mail.com','0912000006','2024-02-12',2);
INSERT INTO Member VALUES (7,'Leila','Nazari','leila@mail.com','0912000007','2024-02-14',4);
INSERT INTO Member VALUES (8,'Omid','Sadeghi','omid@mail.com','0912000008','2024-02-20',5);
INSERT INTO Member VALUES (9,'Parsa','Ebrahimi','parsa@mail.com','0912000009','2024-02-22',NULL);
INSERT INTO Member VALUES (10,'Maryam','Fallahi','maryam@mail.com','0912000010','2024-03-01',3);
INSERT INTO Member VALUES (11,'Arman','Zarei','arman@mail.com','0912000011','2024-03-02',6);
INSERT INTO Member VALUES (12,'Sina','Ghasemi','sina@mail.com','0912000012','2024-03-03',7);
INSERT INTO Member VALUES (13,'Fatemeh','Rostami','fatemeh@mail.com','0912000013','2024-03-04',8);
INSERT INTO Member VALUES (14,'Pouya','Shiri','pouya@mail.com','0912000014','2024-03-05',9);
INSERT INTO Member VALUES (15,'Elham','Akbari','elham@mail.com','0912000015','2024-03-06',NULL);
INSERT INTO Member VALUES (16,'Navid','Taheri','navid@mail.com','0912000016','2024-03-07',10);
INSERT INTO Member VALUES (17,'Zahra','Mousavi','zahra@mail.com','0912000017','2024-03-08',1);
INSERT INTO Member VALUES (18,'Amir','Kiani','amir@mail.com','0912000018','2024-03-09',2);
INSERT INTO Member VALUES (19,'Shiva','Azimi','shiva@mail.com','0912000019','2024-03-10',3);
INSERT INTO Member VALUES (20,'Hossein','Piri','hossein@mail.com','0912000020','2024-03-11',4);

-- =========================
-- MemberPlanHistory (Plan فعال)
-- =========================
INSERT INTO MemberPlanHistory VALUES (1,1,'2024-01-10',NULL);
INSERT INTO MemberPlanHistory VALUES (2,2,'2024-01-15',NULL);
INSERT INTO MemberPlanHistory VALUES (3,2,'2024-02-01',NULL);
INSERT INTO MemberPlanHistory VALUES (4,1,'2024-02-05',NULL);
INSERT INTO MemberPlanHistory VALUES (5,1,'2024-02-10',NULL);
INSERT INTO MemberPlanHistory VALUES (6,3,'2024-02-12',NULL);
INSERT INTO MemberPlanHistory VALUES (7,2,'2024-02-14',NULL);
INSERT INTO MemberPlanHistory VALUES (8,4,'2024-02-20',NULL);
INSERT INTO MemberPlanHistory VALUES (9,1,'2024-02-22',NULL);
INSERT INTO MemberPlanHistory VALUES (10,2,'2024-03-01',NULL);
INSERT INTO MemberPlanHistory VALUES (11,1,'2024-03-02',NULL);
INSERT INTO MemberPlanHistory VALUES (12,2,'2024-03-03',NULL);
INSERT INTO MemberPlanHistory VALUES (13,1,'2024-03-04',NULL);
INSERT INTO MemberPlanHistory VALUES (14,3,'2024-03-05',NULL);
INSERT INTO MemberPlanHistory VALUES (15,1,'2024-03-06',NULL);
INSERT INTO MemberPlanHistory VALUES (16,2,'2024-03-07',NULL);
INSERT INTO MemberPlanHistory VALUES (17,1,'2024-03-08',NULL);
INSERT INTO MemberPlanHistory VALUES (18,2,'2024-03-09',NULL);
INSERT INTO MemberPlanHistory VALUES (19,1,'2024-03-10',NULL);
INSERT INTO MemberPlanHistory VALUES (20,4,'2024-03-11',NULL);
-- =========================
-- Space 
-- =========================
INSERT INTO Space VALUES (1,'Room A','MeetingRoom',10,'08:00','18:00');
INSERT INTO Space VALUES (2,'Room B','MeetingRoom',8,'08:00','18:00');
INSERT INTO Space VALUES (3,'Room C','MeetingRoom',12,'08:00','18:00');
INSERT INTO Space VALUES (4,'Room D','MeetingRoom',6,'08:00','18:00');
INSERT INTO Space VALUES (5,'Hall 1','Hall',40,'09:00','22:00');
INSERT INTO Space VALUES (6,'Hall 2','Hall',60,'09:00','22:00');
INSERT INTO Space VALUES (7,'Private 1','PrivateOffice',4,'08:00','18:00');
INSERT INTO Space VALUES (8,'Private 2','PrivateOffice',4,'08:00','18:00');
INSERT INTO Space VALUES (9,'Desk 1','SharedDesk',20,'08:00','20:00');
INSERT INTO Space VALUES (10,'Desk 2','SharedDesk',20,'08:00','20:00');
INSERT INTO Space VALUES (11,'Room E','MeetingRoom',15,'08:00','18:00');
INSERT INTO Space VALUES (12,'Room F','MeetingRoom',20,'08:00','18:00');
INSERT INTO Space VALUES (13,'Hall 3','Hall',50,'09:00','22:00');
INSERT INTO Space VALUES (14,'Private 3','PrivateOffice',6,'08:00','18:00');
INSERT INTO Space VALUES (15,'Desk 3','SharedDesk',25,'08:00','20:00');

-- =========================
-- Staff (حداقل 3)
-- =========================
DELETE FROM Staff;
INSERT INTO Staff VALUES (1, 'Admin One', 'Admin', 'admin@mail.com');
INSERT INTO Staff VALUES (2, 'Reception One', 'Reception', 'reception@mail.com');
INSERT INTO Staff VALUES (3, 'Finance Manager', 'Admin', 'finance@mail.com');
INSERT INTO Staff VALUES (4, 'Mentor Reza', 'Mentor', 'mentor1@mail.com');
INSERT INTO Staff VALUES (5, 'Mentor Sara', 'Mentor', 'mentor2@mail.com');
INSERT INTO Staff VALUES (6, 'Mentor Ali', 'Mentor', 'mentor3@mail.com');
-- =========================
-- Booking (10 تا)
-- =========================
DELETE FROM Booking;
-- 50 رزرو کامل و درست
INSERT INTO Booking VALUES (1,1,1,'2024-04-01 09:00','2024-04-01 11:00',0,'2024-04-01 09:00','2024-04-01 11:00',2);
INSERT INTO Booking VALUES (2,2,2,'2024-04-02 10:00','2024-04-02 12:00',0,NULL,NULL,NULL);
INSERT INTO Booking VALUES (3,3,3,'2024-04-03 14:00','2024-04-03 18:00',1,'2024-04-03 14:00','2024-04-03 18:00',2);
INSERT INTO Booking VALUES (4,4,4,'2024-04-04 09:00','2024-04-04 17:00',0,NULL,NULL,NULL);
INSERT INTO Booking VALUES (5,5,5,'2024-04-05 10:00','2024-04-05 15:00',0,NULL,NULL,NULL);
INSERT INTO Booking VALUES (6,6,6,'2024-04-06 08:00','2024-04-06 12:00',0,'2024-04-06 08:05','2024-04-06 11:55',2);
INSERT INTO Booking VALUES (7,7,7,'2024-04-07 09:00','2024-04-07 13:00',0,NULL,NULL,NULL);
INSERT INTO Booking VALUES (8,8,8,'2024-04-08 10:00','2024-04-08 14:00',1,'2024-04-08 10:00','2024-04-08 14:00',3);
INSERT INTO Booking VALUES (9,9,9,'2024-04-09 11:00','2024-04-09 15:00',0,'2024-04-09 11:05','2024-04-09 14:50',2);
INSERT INTO Booking VALUES (10,10,10,'2024-04-10 12:00','2024-04-10 16:00',0,NULL,NULL,NULL);
INSERT INTO Booking VALUES (11,11,11,'2024-04-11 08:30','2024-04-11 11:30',0,'2024-04-11 08:35','2024-04-11 11:25',2);
INSERT INTO Booking VALUES (12,12,12,'2024-04-12 13:00','2024-04-12 17:00',0,'2024-04-12 13:00','2024-04-12 16:45',3);
INSERT INTO Booking VALUES (13,13,13,'2024-04-13 09:00','2024-04-13 12:00',0,NULL,NULL,NULL);
INSERT INTO Booking VALUES (14,14,14,'2024-04-14 14:00','2024-04-14 18:00',0,'2024-04-14 14:10','2024-04-14 17:50',2);
INSERT INTO Booking VALUES (15,15,15,'2024-04-15 10:00','2024-04-15 13:00',1,'2024-04-15 10:00','2024-04-15 13:00',2);
INSERT INTO Booking VALUES (16,16,1,'2024-04-16 09:00','2024-04-16 11:00',0,'2024-04-16 09:10','2024-04-16 10:50',2);
INSERT INTO Booking VALUES (17,17,2,'2024-04-17 14:00','2024-04-17 16:00',0,NULL,NULL,NULL);
INSERT INTO Booking VALUES (18,18,3,'2024-04-18 08:30','2024-04-18 12:30',0,'2024-04-18 08:35','2024-04-18 12:25',3);
INSERT INTO Booking VALUES (19,19,4,'2024-04-19 10:00','2024-04-19 14:00',0,'2024-04-19 10:05','2024-04-19 13:55',2);
INSERT INTO Booking VALUES (20,20,5,'2024-04-20 13:00','2024-04-20 17:00',0,NULL,NULL,NULL);
-- ادامه رزروها (30 رزرو دیگر)
INSERT INTO Booking VALUES (21,1,6,'2024-05-01 09:00','2024-05-01 12:00',0,'2024-05-01 09:00','2024-05-01 12:00',2);
INSERT INTO Booking VALUES (22,2,7,'2024-05-02 14:00','2024-05-02 18:00',0,'2024-05-02 14:15','2024-05-02 17:45',3);
INSERT INTO Booking VALUES (23,3,8,'2024-05-03 10:00','2024-05-03 13:00',0,NULL,NULL,NULL);
INSERT INTO Booking VALUES (24,4,9,'2024-05-04 08:00','2024-05-04 11:00',1,'2024-05-04 08:05','2024-05-04 10:55',2);
INSERT INTO Booking VALUES (25,5,10,'2024-05-05 12:00','2024-05-05 15:00',0,'2024-05-05 12:00','2024-05-05 15:00',3);
INSERT INTO Booking VALUES (26,6,11,'2024-05-06 09:00','2024-05-06 12:00',0,'2024-05-06 09:05','2024-05-06 11:55',2);
INSERT INTO Booking VALUES (27,7,12,'2024-05-07 14:00','2024-05-07 16:00',0,NULL,NULL,NULL);
INSERT INTO Booking VALUES (28,8,13,'2024-05-08 08:00','2024-05-08 10:00',0,'2024-05-08 08:10','2024-05-08 09:50',3);
INSERT INTO Booking VALUES (29,9,14,'2024-05-09 11:00','2024-05-09 15:00',0,'2024-05-09 11:05','2024-05-09 14:45',2);
INSERT INTO Booking VALUES (30,10,15,'2024-05-10 13:00','2024-05-10 17:00',0,NULL,NULL,NULL);
INSERT INTO Booking VALUES (31,11,1,'2024-05-11 09:00','2024-05-11 11:00',0,'2024-05-11 09:00','2024-05-11 11:00',2);
INSERT INTO Booking VALUES (32,12,2,'2024-05-12 14:00','2024-05-12 16:00',0,'2024-05-12 14:10','2024-05-12 15:50',3);
INSERT INTO Booking VALUES (33,13,3,'2024-05-13 08:30','2024-05-13 12:30',0,NULL,NULL,NULL);
INSERT INTO Booking VALUES (34,14,4,'2024-05-14 10:00','2024-05-14 14:00',0,'2024-05-14 10:05','2024-05-14 13:55',2);
INSERT INTO Booking VALUES (35,15,5,'2024-05-15 13:00','2024-05-15 17:00',0,'2024-05-15 13:00','2024-05-15 17:00',3);
INSERT INTO Booking VALUES (36,16,6,'2024-06-01 09:00','2024-06-01 12:00',0,'2024-06-01 09:05','2024-06-01 11:55',2);
INSERT INTO Booking VALUES (37,17,7,'2024-06-02 14:00','2024-06-02 16:00',0,NULL,NULL,NULL);
INSERT INTO Booking VALUES (38,18,8,'2024-06-03 08:00','2024-06-03 10:00',0,'2024-06-03 08:10','2024-06-03 09:50',3);
INSERT INTO Booking VALUES (39,19,9,'2024-06-04 11:00','2024-06-04 15:00',0,'2024-06-04 11:05','2024-06-04 14:45',2);
INSERT INTO Booking VALUES (40,20,10,'2024-06-05 13:00','2024-06-05 17:00',0,NULL,NULL,NULL);
INSERT INTO Booking VALUES (41,1,11,'2024-06-06 09:00','2024-06-06 12:00',0,'2024-06-06 09:00','2024-06-06 12:00',2);
INSERT INTO Booking VALUES (42,2,12,'2024-06-07 14:00','2024-06-07 18:00',0,'2024-06-07 14:10','2024-06-07 17:50',3);
INSERT INTO Booking VALUES (43,3,13,'2024-06-08 10:00','2024-06-08 13:00',0,NULL,NULL,NULL);
INSERT INTO Booking VALUES (44,4,14,'2024-06-09 08:00','2024-06-09 11:00',1,'2024-06-09 08:05','2024-06-09 10:55',2);
INSERT INTO Booking VALUES (45,5,15,'2024-06-10 12:00','2024-06-10 15:00',0,'2024-06-10 12:00','2024-06-10 15:00',3);
INSERT INTO Booking VALUES (46,6,1,'2024-06-11 09:00','2024-06-11 11:00',0,'2024-06-11 09:10','2024-06-11 10:50',2);
INSERT INTO Booking VALUES (47,7,2,'2024-06-12 14:00','2024-06-12 16:00',0,NULL,NULL,NULL);
INSERT INTO Booking VALUES (48,8,3,'2024-06-13 08:30','2024-06-13 12:30',0,'2024-06-13 08:35','2024-06-13 12:25',3);
INSERT INTO Booking VALUES (49,9,4,'2024-06-14 10:00','2024-06-14 14:00',0,'2024-06-14 10:05','2024-06-14 13:55',2);
INSERT INTO Booking VALUES (50,10,5,'2024-06-15 13:00','2024-06-15 17:00',0,NULL,NULL,NULL);

-- =========================
-- Event (نمونه)
-- =========================
DELETE FROM Event;
INSERT INTO Event VALUES (1,'AI Workshop','Workshop','2024-05-01','10:00','14:00',30,5,4);
INSERT INTO Event VALUES (2,'Startup Meetup','Meetup','2024-05-10','16:00','19:00',40,6,5);
INSERT INTO Event VALUES (3,'Data Hackathon','Hackathon','2024-06-01','09:00','18:00',50,13,4);
INSERT INTO Event VALUES (4,'ML Workshop','Workshop','2024-06-15','10:00','14:00',25,11,6);
INSERT INTO Event VALUES (5,'UX Talk','Workshop','2024-06-20','15:00','17:00',20,1,4);
INSERT INTO Event VALUES (6,'Cloud Seminar','Workshop','2024-06-25','10:00','13:00',35,12,5);
INSERT INTO Event VALUES (7,'Security Meetup','Meetup','2024-07-01','16:00','19:00',30,6,6);
INSERT INTO Event VALUES (8,'DevOps Workshop','Workshop','2024-07-05','10:00','14:00',25,2,4);
INSERT INTO Event VALUES (9,'Startup Pitch','Meetup','2024-07-10','15:00','18:00',40,13,5);
INSERT INTO Event VALUES (10,'AI Talk','Workshop','2024-07-15','14:00','16:00',30,3,4);
INSERT INTO Event VALUES (11,'Web Conference','Workshop','2024-07-20','09:00','17:00',60,13,6);
INSERT INTO Event VALUES (12,'Python Bootcamp','Workshop','2024-07-25','09:00','16:00',35,12,4);
INSERT INTO Event VALUES (13,'Mobile Dev Meetup','Meetup','2024-08-01','17:00','20:00',25,7,5);
INSERT INTO Event VALUES (14,'Blockchain Workshop','Workshop','2024-08-05','10:00','15:00',30,8,6);
INSERT INTO Event VALUES (15,'Networking Event','Meetup','2024-08-10','16:00','19:00',50,13,4);

-- =========================
-- EventParticipant
-- =========================
INSERT INTO EventParticipant VALUES (1,1);
INSERT INTO EventParticipant VALUES (1,2);
INSERT INTO EventParticipant VALUES (1,3);
INSERT INTO EventParticipant VALUES (1,4);
INSERT INTO EventParticipant VALUES (1,5);
INSERT INTO EventParticipant VALUES (2,6);
INSERT INTO EventParticipant VALUES (2,7);
INSERT INTO EventParticipant VALUES (2,8);
INSERT INTO EventParticipant VALUES (2,9);
INSERT INTO EventParticipant VALUES (2,10);
INSERT INTO EventParticipant VALUES (3,11);
INSERT INTO EventParticipant VALUES (3,12);
INSERT INTO EventParticipant VALUES (3,13);
INSERT INTO EventParticipant VALUES (3,14);
INSERT INTO EventParticipant VALUES (3,15);
INSERT INTO EventParticipant VALUES (4,16);
INSERT INTO EventParticipant VALUES (4,17);
INSERT INTO EventParticipant VALUES (4,18);
INSERT INTO EventParticipant VALUES (4,19);
INSERT INTO EventParticipant VALUES (4,20);
INSERT INTO EventParticipant VALUES (5,1);
INSERT INTO EventParticipant VALUES (5,3);
INSERT INTO EventParticipant VALUES (5,5);
INSERT INTO EventParticipant VALUES (5,7);
INSERT INTO EventParticipant VALUES (5,9);
INSERT INTO EventParticipant VALUES (6,2);
INSERT INTO EventParticipant VALUES (6,4);
INSERT INTO EventParticipant VALUES (6,6);
INSERT INTO EventParticipant VALUES (6,8);
INSERT INTO EventParticipant VALUES (6,10);
INSERT INTO EventParticipant VALUES (7,11);
INSERT INTO EventParticipant VALUES (7,13);
INSERT INTO EventParticipant VALUES (7,15);
INSERT INTO EventParticipant VALUES (7,17);
INSERT INTO EventParticipant VALUES (7,19);
INSERT INTO EventParticipant VALUES (8,12);
INSERT INTO EventParticipant VALUES (8,14);
INSERT INTO EventParticipant VALUES (8,16);
INSERT INTO EventParticipant VALUES (8,18);
INSERT INTO EventParticipant VALUES (8,20);
INSERT INTO EventParticipant VALUES (9,1);
INSERT INTO EventParticipant VALUES (9,6);
INSERT INTO EventParticipant VALUES (9,11);
INSERT INTO EventParticipant VALUES (9,16);
INSERT INTO EventParticipant VALUES (10,2);
INSERT INTO EventParticipant VALUES (10,7);
INSERT INTO EventParticipant VALUES (10,12);
INSERT INTO EventParticipant VALUES (10,17);
INSERT INTO EventParticipant VALUES (11,3);
INSERT INTO EventParticipant VALUES (11,8);
INSERT INTO EventParticipant VALUES (11,13);
INSERT INTO EventParticipant VALUES (11,18);
INSERT INTO EventParticipant VALUES (12,4);
INSERT INTO EventParticipant VALUES (12,9);
INSERT INTO EventParticipant VALUES (12,14);
INSERT INTO EventParticipant VALUES (12,19);
INSERT INTO EventParticipant VALUES (13,5);
INSERT INTO EventParticipant VALUES (13,10);
INSERT INTO EventParticipant VALUES (13,15);
INSERT INTO EventParticipant VALUES (13,20);
INSERT INTO EventParticipant VALUES (14,1);
INSERT INTO EventParticipant VALUES (14,8);
INSERT INTO EventParticipant VALUES (14,15);
INSERT INTO EventParticipant VALUES (15,2);
INSERT INTO EventParticipant VALUES (15,9);
INSERT INTO EventParticipant VALUES (15,16);

-- =========================
-- Service
-- =========================

INSERT INTO Service VALUES (1,'Printing',0.5);
INSERT INTO Service VALUES (2,'Parking',5);
INSERT INTO Service VALUES (3,'Locker',3);
INSERT INTO Service VALUES (4,'VirtualAddress',20);

-- =========================
-- ServiceUsage
-- =========================

INSERT INTO ServiceUsage VALUES (1,1,1,'2024-04-01',20);
INSERT INTO ServiceUsage VALUES (2,2,2,'2024-04-02',1);
INSERT INTO ServiceUsage VALUES (3,3,3,'2024-04-03',2);
INSERT INTO ServiceUsage VALUES (4,4,4,'2024-04-04',1);
INSERT INTO ServiceUsage VALUES (5,5,1,'2024-04-05',15);
INSERT INTO ServiceUsage VALUES (6,6,2,'2024-04-06',2);
INSERT INTO ServiceUsage VALUES (7,7,3,'2024-04-07',3);
INSERT INTO ServiceUsage VALUES (8,8,4,'2024-04-08',1);
INSERT INTO ServiceUsage VALUES (9,9,1,'2024-04-09',25);
INSERT INTO ServiceUsage VALUES (10,10,2,'2024-04-10',3);
INSERT INTO ServiceUsage VALUES (11,11,3,'2024-04-11',1);
INSERT INTO ServiceUsage VALUES (12,12,4,'2024-04-12',1);
INSERT INTO ServiceUsage VALUES (13,13,1,'2024-04-13',30);
INSERT INTO ServiceUsage VALUES (14,14,2,'2024-04-14',2);
INSERT INTO ServiceUsage VALUES (15,15,3,'2024-04-15',2);
INSERT INTO ServiceUsage VALUES (16,16,4,'2024-04-16',1);
INSERT INTO ServiceUsage VALUES (17,17,1,'2024-04-17',18);
INSERT INTO ServiceUsage VALUES (18,18,2,'2024-04-18',4);
INSERT INTO ServiceUsage VALUES (19,19,3,'2024-04-19',1);
INSERT INTO ServiceUsage VALUES (20,20,4,'2024-04-20',1);
INSERT INTO ServiceUsage VALUES (21,1,2,'2024-05-01',2);
INSERT INTO ServiceUsage VALUES (22,2,3,'2024-05-02',1);
INSERT INTO ServiceUsage VALUES (23,3,4,'2024-05-03',1);
INSERT INTO ServiceUsage VALUES (24,4,1,'2024-05-04',22);
INSERT INTO ServiceUsage VALUES (25,5,2,'2024-05-05',1);
INSERT INTO ServiceUsage VALUES (26,6,3,'2024-05-06',2);
INSERT INTO ServiceUsage VALUES (27,7,4,'2024-05-07',1);
INSERT INTO ServiceUsage VALUES (28,8,1,'2024-05-08',28);
INSERT INTO ServiceUsage VALUES (29,9,2,'2024-05-09',3);
INSERT INTO ServiceUsage VALUES (30,10,3,'2024-05-10',1);


-- =========================
-- Invoice 
-- =========================
INSERT INTO Invoice VALUES (1,1,'2024-04',185,'2024-04-30');
INSERT INTO Invoice VALUES (2,2,'2024-04',210,'2024-04-30');
INSERT INTO Invoice VALUES (3,3,'2024-04',195,'2024-04-30');
INSERT INTO Invoice VALUES (4,4,'2024-04',230,'2024-04-30');
INSERT INTO Invoice VALUES (5,5,'2024-04',175,'2024-04-30');
INSERT INTO Invoice VALUES (6,6,'2024-04',220,'2024-04-30');
INSERT INTO Invoice VALUES (7,7,'2024-04',190,'2024-04-30');
INSERT INTO Invoice VALUES (8,8,'2024-04',240,'2024-04-30');
INSERT INTO Invoice VALUES (9,9,'2024-04',180,'2024-04-30');
INSERT INTO Invoice VALUES (10,10,'2024-04',215,'2024-04-30');
INSERT INTO Invoice VALUES (11,11,'2024-05',200,'2024-05-31');
INSERT INTO Invoice VALUES (12,12,'2024-05',225,'2024-05-31');
INSERT INTO Invoice VALUES (13,13,'2024-05',210,'2024-05-31');
INSERT INTO Invoice VALUES (14,14,'2024-05',235,'2024-05-31');
INSERT INTO Invoice VALUES (15,15,'2024-05',190,'2024-05-31');
INSERT INTO Invoice VALUES (16,16,'2024-05',245,'2024-05-31');
INSERT INTO Invoice VALUES (17,17,'2024-06',205,'2024-06-30');
INSERT INTO Invoice VALUES (18,18,'2024-06',230,'2024-06-30');
INSERT INTO Invoice VALUES (19,19,'2024-06',195,'2024-06-30');
INSERT INTO Invoice VALUES (20,20,'2024-06',250,'2024-06-30');


-- =========================
-- 13. پرداخت‌ها (متناسب با فاکتورها)
-- =========================
INSERT INTO Payment VALUES (1,1,'2024-05-01',185,'Card');
INSERT INTO Payment VALUES (2,2,'2024-05-02',210,'Online');
INSERT INTO Payment VALUES (3,3,'2024-05-03',195,'Cash');
INSERT INTO Payment VALUES (4,4,'2024-05-04',230,'Card');
INSERT INTO Payment VALUES (5,5,'2024-05-05',175,'Online');
INSERT INTO Payment VALUES (6,6,'2024-05-06',220,'Cash');
INSERT INTO Payment VALUES (7,7,'2024-05-07',190,'Card');
INSERT INTO Payment VALUES (8,8,'2024-05-08',240,'Online');
INSERT INTO Payment VALUES (9,9,'2024-05-09',180,'Cash');
INSERT INTO Payment VALUES (10,10,'2024-05-10',215,'Card');
INSERT INTO Payment VALUES (11,11,'2024-06-01',200,'Online');
INSERT INTO Payment VALUES (12,12,'2024-06-02',225,'Cash');
INSERT INTO Payment VALUES (13,13,'2024-06-03',210,'Card');
INSERT INTO Payment VALUES (14,14,'2024-06-04',235,'Online');
INSERT INTO Payment VALUES (15,15,'2024-06-05',190,'Cash');
INSERT INTO Payment VALUES (16,16,'2024-06-06',245,'Card');
INSERT INTO Payment VALUES (17,17,'2024-07-01',205,'Online');
INSERT INTO Payment VALUES (18,18,'2024-07-02',230,'Cash');
INSERT INTO Payment VALUES (19,19,'2024-07-03',195,'Card');
INSERT INTO Payment VALUES (20,20,'2024-07-04',250,'Online');


SELECT COUNT(*) FROM ServiceUsage;
SELECT COUNT(*) FROM Invoice;
SELECT COUNT(*) FROM Payment;

SELECT * FROM ServiceUsage LIMIT 5;
SELECT * FROM Invoice LIMIT 5;
SELECT * FROM Payment LIMIT 5;
