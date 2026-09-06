# Custom PC Builder

A database-driven web application for creating, managing, and evaluating custom PC builds. The application allows users to select PC components, automatically calculate the total build price, verify CPU–motherboard compatibility, and save, view, update, or delete builds through a MariaDB database.

---

## Table of Contents

- [Overview](#overview)
- [Objectives](#objectives)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Project Structure](#project-structure)
- [Database Design](#database-design)
- [Application Workflow](#application-workflow)
- [Component Selection](#component-selection)
- [Compatibility Checking](#compatibility-checking)
- [Build Management](#build-management)

---

## Overview

**Custom PC Builder** is a web-based application developed as a Database Management System project.

The application provides a simple interface for selecting PC components and creating complete computer builds. Component information is retrieved from a MariaDB database, while saved builds are also stored and managed through the database.

The system connects a frontend interface with a PHP backend and a relational database, demonstrating fundamental database concepts such as:

- Relational data organization
- Primary keys
- Foreign keys
- Relationships between tables
- CRUD operations
- Data retrieval and insertion
- Data updating and deletion
- Referential integrity

The project was intentionally kept within a manageable scope while still demonstrating a complete database-driven application.

---

## Objectives

The main objectives of the project are to:

1. Provide an interface for creating custom PC builds.
2. Store PC component information in a relational database.
3. Retrieve component information dynamically from the database.
4. Allow users to select one component from each required category.
5. Calculate the total price of a selected build.
6. Check CPU and motherboard socket compatibility.
7. Store completed builds in the database.
8. Allow previously saved builds to be viewed and loaded.
9. Allow existing builds to be updated.
10. Allow saved builds to be deleted.
11. Demonstrate the integration of a web frontend with a relational database.

---

## Features

### Component Selection

The application provides dropdown menus for seven PC component categories:

- CPU
- Motherboard
- GPU
- RAM
- Storage
- PSU
- Case

Component information is retrieved from the database rather than being permanently hard-coded into the interface.

---

### Automatic Price Calculation

Whenever a component is selected, the application updates the build summary and calculates the total price automatically.

The total is calculated as:

$$
\text{Total Price} = \sum_{i=1}^{7}\text{Price of Selected Component}_i
$$

The total price is displayed in Bangladeshi Taka (`৳`).

---

### CPU–Motherboard Compatibility

The application checks the CPU socket against the motherboard socket.

A build is considered compatible when:

$$
\text{CPU Socket} = \text{Motherboard Socket}
$$

If the sockets do not match, the application indicates that the selected configuration is incompatible.

An incompatible build cannot be saved or updated.

---

### Build Saving

Users can provide a build name and save a completed configuration.

Before saving, the application verifies that:

- A build name has been entered.
- All seven required components have been selected.
- The CPU and motherboard are compatible.

The build is then sent to the PHP backend and stored in the database.

---

### Saved Builds

Previously saved builds are retrieved from the database and displayed in a table containing:

- Build Name
- Total Price
- View action

---

### View / Load Build

The **View** action loads a previously saved build back into the builder interface.

The application restores:

- Build name
- CPU
- Motherboard
- GPU
- RAM
- Storage
- PSU
- Case
- Total price

The selected build is also displayed in the **Selected Build** section.

---

### Update Build

After loading an existing build, users can modify its components or build name.

The **Update Build** operation updates the corresponding record in the database.

The same validation rules used when saving a build are applied during an update.

---

### Delete Build

Users can delete a previously saved build.

A confirmation prompt is displayed before deletion.

When a build is deleted, its associated build-component records are also handled appropriately so that database referential integrity is maintained.

---

### Clear Build

The **Clear Build** button resets the current builder interface without modifying saved database records.

It clears:

- Build name
- Selected components
- Build summary
- Total price
- Selected build status

---

## Technology Stack

### Frontend

- HTML5
- CSS3
- JavaScript

### Backend

- PHP

### Database

- MariaDB
- phpMyAdmin

### Development Environment

- XAMPP
- Apache
- MariaDB

### Version Control

- Git
- GitHub

---

## Project Structure

```text
Project/
│
├── backend/
│   ├── api.php
│   ├── save_build.php
│   ├── load_build.php
│   ├── update_build.php
│   └── delete_build.php
│
├── config/
│   └── db.php
│
├── index.html
├── style.css
└── java.js
