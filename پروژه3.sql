--تمام رزروهای یک عضو خاص
SELECT Booking.BookingID,
       Booking.StartDateTime,
       Booking.EndDateTime,
       Space.Name AS SpaceName,
       Space.SpaceType
FROM Booking
JOIN Space ON Booking.SpaceID = Space.SpaceID
WHERE Booking.MemberID = 1;

-- تعداد اعضای هر پلن فعال
SELECT 
    MembershipPlan.PlanID,
    MembershipPlan.PlanName AS PlanName,
    COUNT(DISTINCT MemberPlanHistory.MemberID) AS MemberCount
FROM MembershipPlan
LEFT JOIN MemberPlanHistory
    ON MembershipPlan.PlanID = MemberPlanHistory.PlanID
    AND MemberPlanHistory.EndDate IS NULL
GROUP BY MembershipPlan.PlanID, MembershipPlan.PlanName
ORDER BY MembershipPlan.PlanID;


 --فضاهای آزاد در بازه زمانی
 SELECT Space.SpaceID,
       Space.Name,
       Space.SpaceType
FROM Space
WHERE Space.SpaceID NOT IN (
    SELECT Booking.SpaceID
    FROM Booking
    WHERE Booking.StartDateTime < '2024-04-02 12:00'
      AND Booking.EndDateTime   > '2024-04-02 10:00'
);

--رویدادهای ۷ روز آینده + برگزارکننده + تعداد شرکت‌کننده
SELECT 
    Event.EventID,
    Event.Title AS عنوان_رویداد,
    Event.EventType AS نوع_رویداد,
    Event.EventDate AS تاریخ_رویداد,
    Event.StartTime AS زمان_شروع,
    Event.EndTime AS زمان_پایان,
    Staff.Name AS برگزارکننده,
    Staff.Email AS ایمیل_برگزارکننده,
    COUNT(EventParticipant.MemberID) AS تعداد_شرکت‌کنندگان
FROM Event
INNER JOIN Staff ON Event.OrganizerStaffID = Staff.StaffID
LEFT JOIN EventParticipant ON Event.EventID = EventParticipant.EventID
WHERE Event.EventDate BETWEEN '2024-05-01' AND DATE('2024-05-01', '+7 days')
GROUP BY 
    Event.EventID,
    Event.Title,
    Event.EventType,
    Event.EventDate,
    Event.StartTime,
    Event.EndTime,
    Staff.Name,
    Staff.Email
ORDER BY Event.EventDate, Event.StartTime;

--شرکت‌کنندگان یک رویداد + پلن فعال

SELECT 
    Member.MemberID,
    Member.FirstName AS Name,
    Member.LastName AS LastName,
    Member.Email AS Email,
    MembershipPlan.PlanName AS ActivatePlan,
    MembershipPlan.MonthlyPrice AS MonthlyPrice
FROM EventParticipant
JOIN Member ON EventParticipant.MemberID = Member.MemberID
LEFT JOIN MemberPlanHistory 
    ON Member.MemberID = MemberPlanHistory.MemberID 
    AND MemberPlanHistory.EndDate IS NULL
LEFT JOIN MembershipPlan 
    ON MemberPlanHistory.PlanID = MembershipPlan.PlanID
WHERE EventParticipant.EventID = 1
ORDER BY Member.MemberID;

--رزروهای یک روز خاص + check-in/check-out
SELECT Booking.BookingID,
       Member.FirstName || ' ' || Member.LastName AS MemberName,
       Space.Name AS SpaceName,
       Booking.CheckInTime,
       Booking.CheckOutTime,
       Staff.Name AS CheckedInBy
FROM Booking
JOIN Member
  ON Booking.MemberID = Member.MemberID
JOIN Space
  ON Booking.SpaceID = Space.SpaceID
LEFT JOIN Staff
  ON Booking.CheckedInByStaffID = Staff.StaffID
WHERE DATE(Booking.StartDateTime) = '2024-04-01';

--مجموع ساعات رزرو هر فضا در ماه گذشته
-- برای ماه آوریل 2024
SELECT 
    Space.Name AS نام_فضا,
    Space.SpaceType AS نوع_فضا,
    COUNT(Booking.BookingID) AS تعداد_رزروها,
    ROUND(SUM(
        (JULIANDAY(Booking.EndDateTime) - JULIANDAY(Booking.StartDateTime)) * 24
    ), 2) AS مجموع_ساعات
FROM Booking
JOIN Space ON Booking.SpaceID = Space.SpaceID
WHERE strftime('%Y-%m', Booking.StartDateTime) = '2024-04'
GROUP BY Space.SpaceID, Space.Name, Space.SpaceType
ORDER BY مجموع_ساعات DESC;

-- ۵ عضو با بیشترین هزینه در ۳ ماه گذشته
SELECT 
    Member.MemberID,
    Member.FirstName || ' ' || Member.LastName AS FullName,
    Member.Email AS Email,
    SUM(COALESCE(Invoice.TotalAmount, 0)) AS TotalCost,
    COUNT(Invoice.InvoiceID) AS InvoiceCount
FROM Member
LEFT JOIN Invoice 
    ON Member.MemberID = Invoice.MemberID
    AND Invoice.InvoiceMonth IN ('2024-04', '2024-05', '2024-06')  -- Last 3 months
GROUP BY Member.MemberID, Member.FirstName, Member.LastName, Member.Email
ORDER BY TotalCost DESC
LIMIT 5;


-- متوسط درآمد ماهانه هر پلن عضویت
SELECT 
    MembershipPlan.PlanName,
    AVG(Invoice.TotalAmount) AS AverageMonthlyIncome
FROM Invoice
JOIN Member ON Invoice.MemberID = Member.MemberID
JOIN MemberPlanHistory ON Member.MemberID = MemberPlanHistory.MemberID
JOIN MembershipPlan ON MemberPlanHistory.PlanID = MembershipPlan.PlanID
WHERE MemberPlanHistory.EndDate IS NULL
GROUP BY MembershipPlan.PlanName;

--تعداد و میانگین شرکت‌کننده رویدادها در سال جاری

SELECT 
    Event.EventType AS EventType,
    COUNT(DISTINCT Event.EventID) AS EventCount,
    ROUND(AVG(ParticipantStats.ParticipantCount), 1) AS AverageParticipants
FROM Event
LEFT JOIN (
    SELECT EventID, COUNT(MemberID) AS ParticipantCount
    FROM EventParticipant
    GROUP BY EventID
) AS ParticipantStats ON Event.EventID = ParticipantStats.EventID
WHERE strftime('%Y', Event.EventDate) = '2024'  -- Change to 2024
GROUP BY Event.EventType
ORDER BY EventCount DESC;

--ناسازگاری: رزرو دارد ولی پلن فعال ندارد

INSERT INTO Member VALUES (100, 'بدون', 'پلن', 'noplan@test.com', '0912000100', '2024-08-01', NULL);
INSERT INTO Booking VALUES (100, 100, 1, '2024-08-15 09:00', '2024-08-15 11:00', 0, NULL, NULL, NULL);
SELECT DISTINCT Member.MemberID,
       Member.FirstName,
       Member.LastName
FROM Booking
JOIN Member ON Booking.MemberID = Member.MemberID
LEFT JOIN MemberPlanHistory
  ON Member.MemberID = MemberPlanHistory.MemberID
 AND MemberPlanHistory.EndDate IS NULL  
WHERE MemberPlanHistory.MemberID IS NULL;
DELETE FROM Booking WHERE BookingID = 100;
DELETE FROM Member WHERE MemberID = 100;
--Overbooking
SELECT Event.Title,
       COUNT(EventParticipant.MemberID) AS ParticipantCount,
       Space.Capacity
FROM Event
JOIN Space
  ON Event.SpaceID = Space.SpaceID
JOIN EventParticipant
  ON Event.EventID = EventParticipant.EventID
GROUP BY Event.EventID
HAVING COUNT(EventParticipant.MemberID) > Space.Capacity;

--شرکت در ≥3 رویداد ولی بدون رز

INSERT INTO Member VALUES (101, 'only', 'event', 'eventonly@test.com', '0912000101', '2024-08-01', NULL);

INSERT INTO EventParticipant VALUES (1, 101);  
INSERT INTO EventParticipant VALUES (2, 101);   
INSERT INTO EventParticipant VALUES (3, 101);

SELECT Member.MemberID,
       Member.FirstName,
       Member.LastName
FROM Member
JOIN EventParticipant
  ON Member.MemberID = EventParticipant.MemberID
LEFT JOIN Booking
  ON Member.MemberID = Booking.MemberID
GROUP BY Member.MemberID
HAVING COUNT(DISTINCT EventParticipant.EventID) >= 3
   AND COUNT(Booking.BookingID) = 0;
   
DELETE FROM EventParticipant WHERE MemberID = 101;
DELETE FROM Member WHERE MemberID = 101;

--فضاهایی که ۶ ماه اخیر رزرو نشده‌اند
SELECT 
    Space.SpaceID,
    Space.Name,
    Space.SpaceType
FROM Space
LEFT JOIN Booking 
    ON Space.SpaceID = Booking.SpaceID
    AND Booking.StartDateTime >= '2024-01-01'  -- فرض کن از اول سال 2024
WHERE Booking.BookingID IS NULL
ORDER BY Space.SpaceID;


-- منتورهایی که حداقل ۵ جلسه منتورینگ داشته‌اند
SELECT 
    Staff.StaffID,
    Staff.Name AS MentorName,
    Staff.Email,
    COUNT(DISTINCT Event.EventID) AS SessionCount,
    COUNT(DISTINCT EventParticipant.MemberID) AS UniqueMembers
FROM Staff
JOIN Event ON Staff.StaffID = Event.OrganizerStaffID
JOIN EventParticipant ON Event.EventID = EventParticipant.EventID
WHERE Staff.Role = 'Mentor'
GROUP BY Staff.StaffID, Staff.Name, Staff.Email
HAVING COUNT(DISTINCT Event.EventID) >= 5;

-- منتورهایی با حداقل ۱۰ جلسه
SELECT 
    Staff.Name AS MentorName,
    COUNT(DISTINCT Event.EventID) AS SessionCount
FROM Staff
JOIN Event ON Staff.StaffID = Event.OrganizerStaffID
WHERE Staff.Role = 'Mentor'
GROUP BY Staff.StaffID, Staff.Name
HAVING COUNT(DISTINCT Event.EventID) >= 10;