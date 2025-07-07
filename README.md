# 📦 Ecommerce Delivery App

This app is designed for delivery staff to manage and track customer orders efficiently in the ecommerce system.

## 🚀 Features

- 🔐 Login screen
- 📬 View pending orders
- ✅ View approved orders
- 🗃️ View archived orders
- 🔄 Approve orders and update delivery status
- 📍 Track order locations and update their delivery progress

## 🧱 Architecture

This project follows the MVC (Model-View-Controller) architectural pattern:

- Model → Defined inside the `lib/data/` directory. Responsible for data handling and structures.
- View → Built inside the `lib/view/` directory. Includes all UI screens and components.
- Controller → Managed in the `lib/controller/` directory. Handles the business logic and app state using GetX.

This clean separation of concerns makes the app more maintainable, scalable, and testable.


## 🔐 Sensitive Configuration Handling

- ✅ Sensitive Firebase configuration keys (`apiKey`, `appId`, `messagingSenderId`, `projectId`) are defined manually inside:
  lib/core/services/services.dart


- ✅ These values are excluded from version control using `.gitignore`.

- ✅ Google Maps API key is stored securely in the `local.properties` file and injected into the build process using **Gradle placeholders**.

## 🌐 `linkapi.dart`

This file contains all the API endpoints linking the app to the project's MySQL backend database.  
It manages the server address and various backend service access points.

> 🔄 Note: 
> Update the API URLs in this file whenever the server configuration or environment changes.

---

## 📁 Project Structure

Ecommerce_delivery_app/
├── lib/
│   ├── bindings/              # Dependency injection bindings
│   ├── controller/            # GetX controllers
│   ├── core/
│   │   ├── services/          # Firebase and SharedPreferences setup
│   │   │   └── services.dart
│   │   ├── class/             # Helper classes
│   │   ├── constant/          # App constants and styles
│   │   ├── functions/         # Utility functions
│   │   ├── localization/      # App localization support
│   │   ├── middleware/        # Route guards/middleware
│   │   └── shared/            # Shared widgets/components
│   ├── data/                  # Models and data layer
│   ├── view/                  # UI screens and widgets
│   ├── linkapi.dart           # API endpoint configurations
│   ├── main.dart              # App entry point
│   └── routes.dart            # Route definitions
├── android/
│   └── app/
│       └── google-services.json (excluded)
├── ios/
├── pubspec.yaml
└── README.md

## 🧰 Technical Stack

| Tool/Library      | Purpose                                       |
|-------------------|-----------------------------------------------|
| Flutter           | Cross-platform mobile app development         |
| Firebase          | Notifications and core service initialization |
| GetX              | State management & dependency injection       |
| SharedPreferences | Local storage for persistent data             |
| MySQL             | Backend database for eCommerce data           |
| PHP APIs          | Server-side business logic and data handling  |
| Google Maps API   | Map services for delivery and location logic  |


## ⚙️ Notes

- The app is part of a full ecommerce system that includes:
    - `client_app`: for customers
    - `delivery_app`: for delivery drivers
    - `admin_app`: for store management

## 🚀 Getting Started

```bash
flutter pub get
flutter run