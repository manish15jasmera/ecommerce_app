# E-commerce Application

A feature-rich e-commerce application built with **Ruby on Rails**. This project provides a user-friendly interface for customers and comprehensive admin controls.

## Features

- **Ruby**: 3.2.2  
- **Rails**: 7.1.5.1  
- **Bootstrap**: For responsive design  
- **ESBuild**: For asset bundling  
- **Devise**: For user authentication  
- **Devise Bootstrap Views**: Styled authentication pages  
- **Active Storage**: For handling image uploads  
- **Image Processing**: For resizing and transformations  
- **MailCatcher**: For email testing  

## Prerequisites

Ensure you have the following installed on your system:

- **Ruby**: 3.2.2  
- **Rails**: 7.1.5.1  
- **Node.js** (for ESBuild)  
- **Yarn** (optional, if needed for dependencies)  
- **PostgreSQL**  

## Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/ecommerce_app.git
   cd ecommerce_app
2. **Setup the Database:**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
  
4. **Pre-compile Assets:**
   ```bash
   rails assets:precompile

6. **Start the application:**
   ```bash
   bin/dev
8. **Optional) To test emails, start MailCatcher:**
   ```bash
   mailcatcher

Open MailCatcher in your browser at http://localhost:1080.

**Running the Application**

Navigate to http://localhost:3000 in your browser.

**Development Tools**

MailCatcher: For intercepting and testing emails during development.

Active Storage: Ensure you have the necessary storage service configured for image uploads.
