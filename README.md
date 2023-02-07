# Relational Rails

### **Abstract**
---
In this application, the user is able to:
-Get information about a school
-Get information about a school's teachers
-Get information about teachers
-Create a new school
-Create a new teacher
-Update an existing school
-Update a new teacher
-Delete a school
-Delete a teacher
-Sort a school's teachers alphabetically
-Filter teachers to see only bilingual teachers
-Filter a school's teachers based on the number of years they have been at the school
-Search for a specific teacher or school by name (partial or exact match)

### **Schema**
---
[Database Schema](https://dbdesigner.page.link/VJdxXvUV9Mu6BGGN6)

As seen in the above linked database schema, school and teachers share a one-to-many relationship in which the teachers belong to a school (parent), and a school can have many teachers (children).

### **Developer**
---
[Jasmine Hamou](https://github.com/hamouj)

### **Wins & Challenges**
---
Completing the user stories and creating an application that I can see and interact with on the web has definitely been a highlight of this project. One of the challenges of this project was the interconnectedness of everything; in order to render a view, I had to create tests, create the route, the accompanying action in the controller, and the html within the view page. The back and forth became a bit hard to track at times. Additionally, user story 21 in which it asked for the button to include an interpolation of the number inputted by the user was difficult.