# gym-management-system

This project is a Gym Management System designed to handle and manage the operations of a gym efficiently. It includes functionality for managing memberships, plans, attendance, health status, payments, goals, staff, equipment, classes, and class enrollments. The system is built using a relational database to store and manage data, enabling gym administrators to track various activities.

## Features:
- Membership Management: Track memberships, pricing, and durations.
- Member Records: Store member details such as name, contact information, membership type, and dates.
- Plans & Subscriptions: Manage various fitness plans, including durations, pricing, and features. Each member can subscribe to a plan.
- Attendance Tracking: Record member attendance with check-in and check-out times.
- Health Monitoring: Maintain member health status such as height, weight, BMI, body fat percentage, and other remarks.
- Payments: Process payments for membership and plan subscriptions, with details like payment method and amount.
- Goals: Track member fitness goals and progress over time.
- Staff Management: Maintain staff records, including roles, salary, and contact details.
- Equipment Management: Keep track of gym equipment, maintenance schedules, and the staff responsible for maintenance.
- Classes: Manage fitness classes, instructors, equipment required, and schedules.
- Class Enrollments: Allow members to enroll in classes and track their participation.

## Database Schema:
The system utilizes the following database tables to store information:
Memberships, Members, Plan, Subscriptions, Attendance, Health_Status, Payments, Member_Goals, Staff, Equipment, Classes and 
Class_Enrollments
Each table is linked using foreign keys to maintain relationships between entities.

## Technologies used: 
MySQL (RDBMS), MongoDB (NoSQL)

## Future Enhancements:
- User Authentication & Roles: Implement user authentication with role-based access. This allows different levels of access to the system, such as admin, staff, and members.
- Mobile App Integration: Develop a mobile app that syncs with the gym management system for member registration, class booking, attendance, payments, and tracking fitness progress.
- Automated Payment Processing
Integrate with payment gateways (e.g., Stripe, PayPal) for seamless online payment processing.
- Advanced Reporting & Analytics: Generate detailed reports and analytics for gym administrators to analyze business performance.

## Getting Started:
1. Clone the repository: git clone https://github.com/PremkumarSherinRajkumari/gym-management-system.git
2. Navigate to the project directory: cd Gym Management System.sql
3. Create the database:
CREATE DATABASE gym_management;
4. Use the database:
USE gym_management;
5. Execute the provided SQL script to create the necessary tables
6. Interaction with the Database
After setting up the database, you can perform the following operations:

Query and manage member information.
Track class enrollments and attendance.
Process payments and subscription changes.
Monitor staff activities and equipment usage.
Analyze the progress of member goals.

## Additional Information:
Feel free to reach out to me at sherinrajkumariis@gmail.com for any inquiries or collaborations.
