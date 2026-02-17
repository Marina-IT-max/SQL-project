--1. Organization
CREATE TABLE Organization (
    OrganizationID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Type TEXT CHECK (Type IN ('Startup','Company','Freelancer','Team')),
    ContactEmail TEXT
);


 --2. Member
CREATE TABLE Member (
    MemberID INTEGER PRIMARY KEY,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    Email TEXT UNIQUE NOT NULL,
    Phone TEXT,
    JoinDate DATE NOT NULL,
    OrganizationID INTEGER,
    FOREIGN KEY (OrganizationID) REFERENCES Organization(OrganizationID)
);

--3. MembershipPlan
CREATE TABLE MembershipPlan (
    PlanID INTEGER PRIMARY KEY,
    PlanName TEXT UNIQUE NOT NULL,
    MonthlyPrice REAL NOT NULL CHECK (MonthlyPrice >= 0),
    BookingLimit INTEGER CHECK (BookingLimit >= 0),
    DiscountRate REAL CHECK (DiscountRate BETWEEN 0 AND 1)
);

 --4. MemberPlanHistory
CREATE TABLE MemberPlanHistory (
    MemberID INTEGER NOT NULL,
    PlanID INTEGER NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    PRIMARY KEY (MemberID, StartDate),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (PlanID) REFERENCES MembershipPlan(PlanID),
    CHECK (EndDate IS NULL OR EndDate > StartDate)
);

5. --Space
CREATE TABLE Space (
    SpaceID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    SpaceType TEXT NOT NULL CHECK (SpaceType IN ('MeetingRoom','Hall','PrivateOffice','DedicatedDesk','SharedDesk')),
    Capacity INTEGER NOT NULL CHECK (Capacity > 0),
    AvailableFrom TIME,
    AvailableTo TIME
);

 --6. Staff
CREATE TABLE Staff (
    StaffID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Role TEXT NOT NULL CHECK (Role IN ('Admin','Reception','Mentor')),
    Email TEXT UNIQUE
);

 --7. Booking
CREATE TABLE Booking (
    BookingID INTEGER PRIMARY KEY,
    MemberID INTEGER NOT NULL,
    SpaceID INTEGER NOT NULL,
    StartDateTime DATETIME NOT NULL,
    EndDateTime DATETIME NOT NULL,
    IsRecurring INTEGER NOT NULL CHECK (IsRecurring IN (0,1)),
    CheckInTime DATETIME,
    CheckOutTime DATETIME,
    CheckedInByStaffID INTEGER,
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (SpaceID) REFERENCES Space(SpaceID),
    FOREIGN KEY (CheckedInByStaffID) REFERENCES Staff(StaffID),
    CHECK (EndDateTime > StartDateTime)
);

 --8. Event
CREATE TABLE Event (
    EventID INTEGER PRIMARY KEY,
    Title TEXT NOT NULL,
    EventType TEXT CHECK (EventType IN ('Workshop','Meetup','Hackathon')),
    EventDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    Capacity INTEGER CHECK (Capacity > 0),
    SpaceID INTEGER NOT NULL,
    OrganizerStaffID INTEGER NOT NULL,
    FOREIGN KEY (SpaceID) REFERENCES Space(SpaceID),
    FOREIGN KEY (OrganizerStaffID) REFERENCES Staff(StaffID),
    CHECK (EndTime > StartTime)
);


 --9. EventParticipant
CREATE TABLE EventParticipant (
    EventID INTEGER NOT NULL,
    MemberID INTEGER NOT NULL,
    PRIMARY KEY (EventID, MemberID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

-- 10. Service
CREATE TABLE Service (
    ServiceID INTEGER PRIMARY KEY,
    Name TEXT UNIQUE NOT NULL,
    PricePerUnit REAL NOT NULL CHECK (PricePerUnit >= 0)
);

-- 11. ServiceUsage
CREATE TABLE ServiceUsage (
    UsageID INTEGER PRIMARY KEY,
    MemberID INTEGER NOT NULL,
    ServiceID INTEGER NOT NULL,
    UsageDate DATE NOT NULL,
    Quantity INTEGER NOT NULL CHECK (Quantity > 0),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID)
);

-- 12. Invoice
CREATE TABLE Invoice (
    InvoiceID INTEGER PRIMARY KEY,
    MemberID INTEGER NOT NULL,
    InvoiceMonth TEXT NOT NULL,
    TotalAmount REAL NOT NULL CHECK (TotalAmount >= 0),
    CreatedDate DATE NOT NULL,
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

-- 13. Payment
CREATE TABLE Payment (
    PaymentID INTEGER PRIMARY KEY,
    InvoiceID INTEGER NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount REAL NOT NULL CHECK (Amount > 0),
    PaymentMethod TEXT CHECK (PaymentMethod IN ('Cash','Card','Online')),
    FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID)
);
