-- CREATING DATABASE gym_management;
USE gym_management;
-- Creating the Memberships table
CREATE TABLE Memberships (
    membership_id INT PRIMARY KEY,
    membership_name VARCHAR(255),
    price DECIMAL(10, 2),
    duration_months INT
);

-- Creating the Members table
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    date_of_birth DATE,
    email VARCHAR(255),
    phone_number VARCHAR(20),
    membership_id INT,
    membership_type VARCHAR(255),
    membership_start DATE,
    membership_end DATE,
    FOREIGN KEY (membership_id) REFERENCES Memberships(membership_id)
);

-- Creating the Plan table
CREATE TABLE [Plan] (
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(255),
    plan_mode VARCHAR(255),
    duration_months INT,
    validity DATE,
    amount DECIMAL(10, 2),
    features TEXT
);

-- Creating the Subscriptions table
CREATE TABLE Subscriptions (
    subscription_id INT PRIMARY KEY,
    subscription_start DATE,
    subscription_end DATE,
    member_id INT,
    plan_id INT,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (plan_id) REFERENCES [Plan](plan_id)
);

-- Creating the Attendance table
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    check_in DATETIME, 
    check_out DATETIME,
    membership_id INT,
    FOREIGN KEY (membership_id) REFERENCES Memberships(membership_id)
);

-- Creating the Health Status table
CREATE TABLE Health_Status (
    health_status_id INT PRIMARY KEY,
    height DECIMAL(5, 2),
    weight DECIMAL(5, 2),
    body_fat_percentage DECIMAL(5, 2),
    BMI DECIMAL(5, 2),
    remark TEXT,
    recorded_date DATE,
    member_id INT,
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Creating the Payments table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    payment_date DATE,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    member_id INT,
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Creating the Member Goals table
CREATE TABLE Member_Goals (
    goal_id INT PRIMARY KEY,
    goal_type VARCHAR(255),
    start_date DATE,
    target_date DATE,
    start_value DECIMAL(10, 2),
    target_value DECIMAL(10, 2),
    member_id INT,
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Creating the Staff table
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    role VARCHAR(50),
    hire_date DATE,
    phone_number VARCHAR(20),
    email VARCHAR(255),
    salary DECIMAL(10, 2)
);

-- Creating the Equipment table
CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY,
    equipment_name VARCHAR(255),
    purchase_date DATE,
    condition_eq VARCHAR(50),
    location VARCHAR(255),
    last_maintenance_date DATE,
    maintained_by INT,
    FOREIGN KEY (maintained_by) REFERENCES Staff(staff_id)
);

-- Creating the Classes table
CREATE TABLE Classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(255),
    class_type VARCHAR(50),
    schedule VARCHAR(255),
    duration INT,
    required_equipment INT,
    instructor_id INT,
    FOREIGN KEY (required_equipment) REFERENCES Equipment(equipment_id),
    FOREIGN KEY (instructor_id) REFERENCES Staff(staff_id)
);

-- Creating the Class Enrollments table
CREATE TABLE Class_Enrollments (
    enrollment_id INT PRIMARY KEY,
    enrollment_date DATE,
    member_id INT,
    class_id INT,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Inserting data into Memberships
INSERT INTO Memberships (membership_id, membership_name, price, duration_months)
VALUES
(1, 'Basic', 50.00, 1),
(2, 'Standard', 120.00, 3),
(3, 'Premium', 400.00, 12);

-- Inserting data into Members
INSERT INTO Members (member_id, first_name, last_name, date_of_birth, email, phone_number, membership_id, membership_type, membership_start, membership_end)
VALUES
(1, 'Amit', 'Sharma', '1990-05-12', 'amit.sharma@example.com', '1234567890', 1, 'Basic', '2024-01-01', '2024-02-01'),
(2, 'Li', 'Wei', '1988-11-22', 'li.wei@example.com', '9876543210', 2, 'Standard', '2024-01-01', '2024-04-01'),
(3, 'John', 'Doe', '1992-07-15', 'john.doe@example.com', '1112223333', 3, 'Premium', '2024-01-01', '2025-01-01'),
(4, 'Priya', 'Kapoor', '1995-03-18', 'priya.kapoor@example.com', '4445556666', 1, 'Basic', '2024-01-01', '2024-02-01'),
(5, 'Chen', 'Lu', '1987-09-10', 'chen.lu@example.com', '7778889990', 2, 'Standard', '2024-01-01', '2024-04-01'),
(6, 'Sophia', 'Smith', '1991-12-05', 'sophia.smith@example.com', '1239874560', 3, 'Premium', '2024-01-01', '2025-01-01'),
(7, 'Raj', 'Mehta', '1993-04-22', 'raj.mehta@example.com', '7896541230', 1, 'Basic', '2024-01-01', '2024-02-01'),
(8, 'Ying', 'Wu', '1989-06-30', 'ying.wu@example.com', '4567891230', 2, 'Standard', '2024-01-01', '2024-04-01'),
(9, 'Michael', 'Brown', '1994-08-19', 'michael.brown@example.com', '7418529630', 3, 'Premium', '2024-01-01', '2025-01-01'),
(10, 'Sita', 'Nair', '1996-02-15', 'sita.nair@example.com', '8529637410', 1, 'Basic', '2024-01-01', '2024-02-01'),
(11, 'Hao', 'Zhang', '1986-10-11', 'hao.zhang@example.com', '9638527410', 2, 'Standard', '2024-01-01', '2024-04-01'),
(12, 'Emma', 'Williams', '1993-01-25', 'emma.williams@example.com', '7893216540', 3, 'Premium', '2024-01-01', '2025-01-01');

-- Inserting data into Attendance
INSERT INTO Attendance (attendance_id, check_in, check_out, membership_id)
VALUES
(1, '2024-01-02 08:00:00', '2024-01-02 10:00:00', 1),
(2, '2024-01-03 08:30:00', '2024-01-03 10:30:00', 2),
(3, '2024-01-04 07:45:00', '2024-01-04 09:45:00', 3),
(4, '2024-01-05 09:00:00', '2024-01-05 11:00:00', 4),
(5, '2024-01-06 08:15:00', '2024-01-06 10:15:00', 5),
(6, '2024-01-07 07:30:00', '2024-01-07 09:30:00', 6),
(7, '2024-01-08 08:00:00', '2024-01-08 10:00:00', 7),
(8, '2024-01-09 09:15:00', '2024-01-09 11:15:00', 8),
(9, '2024-01-10 07:45:00', '2024-01-10 09:45:00', 9),
(10, '2024-01-11 08:30:00', '2024-01-11 10:30:00', 10);



-- Inserting data into Health_Status
INSERT INTO Health_Status (health_status_id, height, weight, body_fat_percentage, BMI, remark, recorded_date, member_id)
VALUES
(1, 170.5, 70.2, 15.5, 24.1, 'Normal', '2024-01-02', 1),
(2, 160.0, 55.0, 20.3, 21.5, 'Normal', '2024-01-03', 2),
(3, 180.0, 80.5, 18.7, 24.8, 'Normal', '2024-01-04', 3),
(4, 165.2, 62.0, 22.0, 22.8, 'Slightly Overweight', '2024-01-05', 4),
(5, 172.4, 58.5, 14.0, 19.7, 'Healthy', '2024-01-06', 5),
(6, 155.0, 47.5, 21.5, 19.8, 'Normal', '2024-01-07', 6),
(7, 175.3, 73.2, 19.2, 23.8, 'Normal', '2024-01-08', 7),
(8, 180.2, 81.0, 18.0, 25.0, 'Normal', '2024-01-09', 8),
(9, 158.0, 52.0, 22.3, 20.9, 'Normal', '2024-01-10', 9),
(10, 162.0, 60.0, 25.5, 22.8, 'Overweight', '2024-01-11', 10),
(11, 165.0, 67.0, 28.0, 24.5, 'Overweight', '2024-01-12', 11),
(12, 169.5, 65.0, 23.5, 22.6, 'Normal', '2024-01-13', 12);

-- Inserting data into Payments
INSERT INTO Payments (payment_id, payment_date, amount, payment_method, member_id)
VALUES
(1, '2024-01-01', 50.00, 'Credit Card', 1),
(2, '2024-01-01', 120.00, 'Cash', 2),
(3, '2024-01-01', 400.00, 'Bank Transfer', 3),
(4, '2024-01-01', 50.00, 'Credit Card', 4),
(5, '2024-01-01', 120.00, 'Cash', 5),
(6, '2024-01-01', 400.00, 'Bank Transfer', 6),
(7, '2024-01-01', 50.00, 'Cash', 7),
(8, '2024-01-01', 120.00, 'Bank Transfer', 8),
(9, '2024-01-01', 400.00, 'Credit Card', 9),
(10, '2024-01-01', 50.00, 'Credit Card', 10),
(11, '2024-01-01', 120.00, 'Bank Transfer', 11),
(12, '2024-01-01', 400.00, 'Cash', 12);

-- Inserting data into Member_Goals
INSERT INTO Member_Goals (goal_id, goal_type, start_date, target_date, start_value, target_value, member_id)
VALUES
(1, 'Weight Loss', '2024-01-01', '2024-06-01', 70.2, 65.0, 1),
(2, 'Muscle Gain', '2024-01-01', '2024-12-01', 55.0, 60.0, 2),
(3, 'Endurance Improvement', '2024-01-01', '2024-12-31', 0, 10, 3),
(4, 'Weight Loss', '2024-01-01', '2024-06-01', 62.0, 58.0, 4),
(5, 'Muscle Gain', '2024-01-01', '2024-12-01', 58.5, 62.0, 5),
(6, 'Endurance Improvement', '2024-01-01', '2024-12-31', 0, 12, 6),
(7, 'Weight Loss', '2024-01-01', '2024-06-01', 73.2, 70.0, 7),
(8, 'Muscle Gain', '2024-01-01', '2024-12-01', 81.0, 85.0, 8),
(9, 'Endurance Improvement', '2024-01-01', '2024-12-31', 0, 8, 9),
(10, 'Weight Loss', '2024-01-01', '2024-06-01', 60.0, 55.0, 10),
(11, 'Muscle Gain', '2024-01-01', '2024-12-01', 67.0, 70.0, 11),
(12, 'Weight Maintenance', '2024-01-01', '2024-12-31', 65.0, 65.0, 12);
-- Inserting data into Plan
INSERT INTO [Plan] (plan_id, plan_name, plan_mode, duration_months, validity, amount, features)
VALUES
(1, 'Yoga Plan', 'Individual', 3, '2024-06-01', 150.00, 'Access to yoga classes, flexibility improvement'),
(2, 'Strength Training', 'Group', 6, '2024-12-01', 300.00, 'Access to weightlifting equipment and personal training'),
(3, 'Cardio Blast', 'Individual', 1, '2024-03-01', 50.00, 'Access to treadmills and elliptical trainers'),
(4, 'Pilates Plan', 'Group', 3, '2024-06-01', 120.00, 'Mat Pilates and Reformer Pilates classes'),
(5, 'Full Body Fitness', 'Individual', 12, '2025-01-01', 500.00, 'Access to all classes and gym facilities'),
(6, 'HIIT Training', 'Group', 6, '2024-12-01', 250.00, 'Access to high-intensity interval training sessions'),
(7, 'Weight Management', 'Individual', 3, '2024-06-01', 200.00, 'Personalized diet and workout plan'),
(8, 'Zumba Fun', 'Group', 1, '2024-03-01', 60.00, 'Dance and aerobic exercise sessions'),
(9, 'CrossFit Program', 'Individual', 12, '2025-01-01', 600.00, 'Access to functional fitness classes'),
(10, 'Endurance Booster', 'Group', 6, '2024-12-01', 300.00, 'Advanced running and cycling training'),
(11, 'Swimming Plan', 'Individual', 3, '2024-06-01', 180.00, 'Access to pool and swimming coaching'),
(12, 'Martial Arts', 'Group', 6, '2024-12-01', 350.00, 'Karate, Judo, and Taekwondo training'),
(13, 'Senior Wellness', 'Individual', 12, '2025-01-01', 400.00, 'Customized fitness for seniors'),
(14, 'Family Plan', 'Group', 12, '2025-01-01', 800.00, 'Fitness for up to 4 family members');

-- Inserting data into Subscriptions
INSERT INTO Subscriptions (subscription_id, subscription_start, subscription_end, member_id, plan_id)
VALUES
(1, '2024-01-01', '2024-03-31', 1, 1),
(2, '2024-01-01', '2024-06-30', 2, 2),
(3, '2024-01-01', '2024-01-31', 3, 3),
(4, '2024-01-01', '2024-03-31', 4, 4),
(5, '2024-01-01', '2024-12-31', 5, 5),
(6, '2024-01-01', '2024-06-30', 6, 6),
(7, '2024-01-01', '2024-03-31', 7, 7),
(8, '2024-01-01', '2024-01-31', 8, 8),
(9, '2024-01-01', '2024-12-31', 9, 9),
(10, '2024-01-01', '2024-06-30', 10, 10),
(11, '2024-01-01', '2024-03-31', 11, 11),
(12, '2024-01-01', '2024-06-30', 12, 12),
(13, '2024-01-01', '2024-12-31', 5, 13),
(14, '2024-01-01', '2024-12-31', 9, 14);

-- Inserting data into Staff
INSERT INTO Staff (staff_id, first_name, last_name, role, hire_date, phone_number, email, salary)
VALUES
(1, 'Karan', 'Patel', 'Trainer', '2022-01-15', '9995554440', 'karan.patel@example.com', 3500.00),
(2, 'Mei', 'Ling', 'Yoga Instructor', '2023-06-10', '9985554441', 'mei.ling@example.com', 3000.00),
(3, 'John', 'Doe', 'Manager', '2021-03-20', '9975554442', 'john.doe@example.com', 5000.00),
(4, 'Maria', 'Garcia', 'Nutritionist', '2022-10-05', '9965554443', 'maria.garcia@example.com', 4000.00),
(5, 'Ali', 'Khan', 'Swimming Coach', '2023-04-25', '9955554444', 'ali.khan@example.com', 3200.00),
(6, 'Sophia', 'Jones', 'Fitness Trainer', '2023-01-11', '9945554445', 'sophia.jones@example.com', 3500.00),
(7, 'Raj', 'Kumar', 'Maintenance', '2020-12-15', '9935554446', 'raj.kumar@example.com', 2500.00),
(8, 'Elena', 'Rodriguez', 'Zumba Instructor', '2022-08-01', '9925554447', 'elena.rodriguez@example.com', 2800.00),
(9, 'Tom', 'Brown', 'CrossFit Coach', '2021-11-19', '9915554448', 'tom.brown@example.com', 3600.00),
(10, 'Sita', 'Raman', 'Pilates Instructor', '2022-05-30', '9905554449', 'sita.raman@example.com', 3100.00),
(11, 'Chris', 'White', 'Martial Arts Trainer', '2023-02-18', '9895554450', 'chris.white@example.com', 4000.00),
(12, 'Emma', 'Smith', 'Senior Wellness Coach', '2021-07-25', '9885554451', 'emma.smith@example.com', 3300.00);

-- Inserting data into Equipment
INSERT INTO Equipment (equipment_id, equipment_name, purchase_date, condition_eq, location, last_maintenance_date, maintained_by)
VALUES
(1, 'Treadmill', '2020-01-01', 'Good', 'Cardio Section', '2023-12-01', 7),
(2, 'Dumbbells', '2021-05-15', 'Excellent', 'Weightlifting Area', '2023-11-15', 7),
(3, 'Bench Press', '2022-03-10', 'Good', 'Weightlifting Area', '2023-12-01', 7),
(4, 'Yoga Mats', '2023-01-20', 'New', 'Yoga Room', '2024-01-01', 7),
(5, 'Swimming Pool', '2019-06-30', 'Excellent', 'Swimming Area', '2023-10-01', 5),
(6, 'Rowing Machine', '2020-09-25', 'Good', 'Cardio Section', '2023-11-01', 7),
(7, 'Resistance Bands', '2022-11-05', 'New', 'Fitness Studio', '2024-01-01', 7),
(8, 'Punching Bags', '2021-08-15', 'Good', 'Martial Arts Room', '2023-12-10', 7),
(9, 'Elliptical Trainer', '2021-01-10', 'Good', 'Cardio Section', '2023-11-20', 7),
(10, 'Cycling Machine', '2020-02-20', 'Good', 'Cardio Section', '2023-12-01', 7),
(11, 'Pilates Reformers', '2022-06-15', 'New', 'Pilates Studio', '2024-01-01', 7),
(12, 'Kettlebells', '2021-09-10', 'Good', 'Weightlifting Area', '2023-11-15', 7);

-- Inserting data into Classes
INSERT INTO Classes (class_id, class_name, class_type, schedule, duration, required_equipment, instructor_id)
VALUES
(1, 'Morning Yoga', 'Group', 'Monday, Wednesday, Friday 7-8 AM', 60, 4, 2),
(2, 'Strength Training Basics', 'Individual', 'Daily 9-10 AM', 60, 2, 6),
(3, 'Zumba Dance', 'Group', 'Tuesday, Thursday 6-7 PM', 60, 8, 8),
(4, 'Advanced CrossFit', 'Group', 'Monday, Wednesday, Friday 6-7 PM', 60, 8, 9),
(5, 'Swimming Classes', 'Individual', 'Monday-Friday 3-4 PM', 60, 5, 5),
(6, 'Pilates Core', 'Group', 'Tuesday, Thursday 8-9 AM', 60, 11, 10),
(7, 'Cardio HIIT', 'Group', 'Monday, Wednesday 5-6 PM', 60, 9, 9),
(8, 'Martial Arts Training', 'Group', 'Saturday 4-6 PM', 120, 8, 11),
(9, 'Senior Wellness Yoga', 'Individual', 'Monday, Wednesday, Friday 10-11 AM', 60, 4, 12),
(10, 'Endurance Running', 'Group', 'Sunday 7-9 AM', 120, 10, 9),
(11, 'Kids Karate', 'Group', 'Saturday 10-11 AM', 60, 8, 11),
(12, 'Family Fitness Class', 'Group', 'Sunday 4-5 PM', 60, 4, 8);

-- Inserting data into Class Enrollments
INSERT INTO Class_Enrollments (enrollment_id, enrollment_date, member_id, class_id)
VALUES
(1, '2024-01-01', 1, 1),  -- Member 1 enrolled in Morning Yoga
(2, '2024-01-02', 2, 2),  -- Member 2 enrolled in Strength Training Basics
(3, '2024-01-03', 3, 3),  -- Member 3 enrolled in Zumba Dance
(4, '2024-01-04', 4, 4),  -- Member 4 enrolled in Advanced CrossFit
(5, '2024-01-05', 5, 5),  -- Member 5 enrolled in Swimming Classes
(6, '2024-01-06', 6, 6),  -- Member 6 enrolled in Pilates Core
(7, '2024-01-07', 7, 7),  -- Member 7 enrolled in Cardio HIIT
(8, '2024-01-08', 8, 8),  -- Member 8 enrolled in Martial Arts Training
(9, '2024-01-09', 9, 9),  -- Member 9 enrolled in Senior Wellness Yoga
(10, '2024-01-10', 10, 10), -- Member 10 enrolled in Endurance Running
(11, '2024-01-11', 11, 11); -- Member 11 enrolled in Kids Karate

-- View 1
Go
CREATE VIEW MembershipPaymentsReport AS
SELECT 
    m.member_id,  
    CONCAT(m.first_name, ' ', m.last_name) AS member_name,  
    m.membership_type,  
    mp.membership_name,  
    mp.price AS membership_price,  
    p.amount AS total_payment, 
    p.payment_date  
FROM Members m
JOIN Memberships mp ON m.membership_id = mp.membership_id
JOIN Payments p ON m.member_id = p.member_id; 

-- View 2
Go
CREATE VIEW ClassEnrollmentsReport AS
SELECT 
    c.class_name,  
    c.schedule,  
    c.duration AS class_duration_minutes,  
    COUNT(ce.enrollment_id) AS total_enrollments,  
    s.first_name AS instructor_first_name,
    s.last_name AS instructor_last_name  
FROM Classes c
LEFT JOIN Class_Enrollments ce ON c.class_id = ce.class_id  
LEFT JOIN Staff s ON c.instructor_id = s.staff_id  
GROUP BY c.class_name, c.schedule, c.duration, s.first_name, s.last_name; 

-- View 3
Go
CREATE VIEW HealthStatusOverview AS
SELECT 
    m.member_id,  
    CONCAT(m.first_name, ' ', m.last_name) AS member_name,  
    hs.recorded_date,  
    hs.height,  
    hs.weight, 
    hs.BMI, 
    hs.body_fat_percentage,  
    hs.remark 
FROM Members m
JOIN Health_Status hs ON m.member_id = hs.member_id; 

-- View 4
Go
CREATE VIEW RevenueByPlan AS
SELECT 
    p.plan_name,  
    p.amount AS plan_price, 
    COUNT(s.subscription_id) AS total_subscriptions,  
    SUM(p.amount) AS total_revenue 
FROM [Plan] p
JOIN Subscriptions s ON p.plan_id = s.plan_id 
GROUP BY p.plan_name, p.amount; 

-- Adding CHECK constraints to the Health_Status table
ALTER TABLE Health_Status
ADD CONSTRAINT chk_BMI_range CHECK (BMI BETWEEN 10 AND 50);

ALTER TABLE Health_Status
ADD CONSTRAINT chk_body_fat_percentage CHECK (body_fat_percentage BETWEEN 0 AND 100);

-- Adding CHECK constraint to the Payments table
ALTER TABLE Payments
ADD CONSTRAINT chk_payment_amount_positive CHECK (amount > 0);

-- Adding computed column for full_name in Members table
ALTER TABLE Members
ADD full_name AS (CONCAT(first_name, ' ', last_name));

-- Adding computed column for BMI_status in Health_Status table
ALTER TABLE Health_Status
ADD BMI_status AS (
    CASE
        WHEN BMI < 18.5 THEN 'Underweight'
        WHEN BMI BETWEEN 18.5 AND 24.9 THEN 'Normal'
        WHEN BMI BETWEEN 25 AND 29.9 THEN 'Overweight'
        ELSE 'Obese'
    END
);
