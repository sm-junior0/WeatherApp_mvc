# Weather Management System

This is a Java-based web application for managing weather data. It allows users to log in, view weather records, add new weather data, edit existing records, and delete records. The application uses Java Servlets, JSP, and a MySQL database for data storage.

---

## Features

1. **User Authentication**:
    - Users can log in with a username and password.
    - Session management ensures only logged-in users can access the weather data.

2. **Weather Data Management**:
    - View a list of weather records.
    - Add new weather records (city, temperature, description).
    - Edit existing weather records.
    - Delete weather records.

3. **Internationalization (i18n)**:
    - Supports multiple languages (e.g., English, French).

4. **Logout Functionality**:
    - Users can log out, which invalidates their session and redirects them to the login page.

---

## Technologies Used

- **Backend**: Java Servlets
- **Frontend**: JSP (JavaServer Pages), HTML, CSS
- **Database**: MySQL
- **Build Tool**: Maven
- **Server**: Apache Tomcat

---

## Prerequisites

Before running the project, ensure you have the following installed:

1. **Java Development Kit (JDK)**: Version 11 or higher.
2. **Apache Tomcat**: Version 10 or higher.
3. **MySQL**: Version 8 or higher.
4. **Maven**: For building the project.

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/weather-management-system.git
cd weather-management-system
```

### 2. Set Up the Database

1. Create a MySQL database named `weather_db`.
2. Run the following SQL script to create the required tables:

```sql
CREATE DATABASE weather_db;

USE weather_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL
);

CREATE TABLE weather (
    id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    temperature VARCHAR(50) NOT NULL,
    description VARCHAR(255) NOT NULL,
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

3. Insert sample data into the `users` table:

```sql
INSERT INTO users (username, password) VALUES ('admin', 'admin123');
```

### 3. Configure Database Connection

Update the database connection details in the `DBConnection` class (or equivalent) located in the `utility` package:

```java
public class DBConnection {
    public static Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/weather_db";
        String username = "root"; // Replace with your MySQL username
        String password = "password"; // Replace with your MySQL password
        return DriverManager.getConnection(url, username, password);
    }
}
```

### 4. Build the Project

Run the following Maven command to build the project:

```bash
mvn clean install
```

### 5. Deploy to Tomcat

1. Copy the generated `.war` file from the `target` directory to the `webapps` directory of your Tomcat server.
2. Start the Tomcat server.

---

## Running the Application

1. Open your browser and navigate to:
   ```
   http://localhost:8080/weather-management-system/login.jsp
   ```
2. Log in using the credentials:
    - Username: `admin`
    - Password: `admin123`
3. Use the application to manage weather data.

---

## Project Structure

```
src/
├── main/
│   ├── java/
│   │   ├── controllers/          # Servlet controllers
│   │   ├── dao/                  # Data Access Object interfaces
│   │   ├── daoImpl/              # DAO implementations
│   │   ├── models/               # Model classes (e.g., User, Weather)
│   │   └── utility/              # Utility classes (e.g., DBConnection)
│   ├── resources/                # Resource files (e.g., messages_en.properties)
│   └── webapp/                   # JSP files, CSS, and static assets
│       ├── assets/               # CSS and other static files
│       ├── login.jsp             # Login page
│       ├── weather.jsp           # Weather data management page
│       └── WEB-INF/              # Configuration files (e.g., web.xml)
└── test/                         # Unit tests (if any)
```

---

## Contributing

Contributions are welcome! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Commit your changes and push to the branch.
4. Submit a pull request.

---

## Contact

For any questions or feedback, please contact:

- **Email**: juniormanene@gmail.com
- **GitHub**: [sm-junior0](https://github.com/sm-junior0)

---

Enjoy using the Weather Management System! 🌦️