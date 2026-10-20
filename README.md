# Flutter GetX Architecture 🚀

A reusable and scalable Flutter project architecture built with **GetX** for state management and dependency injection, **Dio** for API integration, **WebSockets** for real-time communication, **SharedPreferences** for local key-value storage, and **Connectivity Plus** for network connectivity monitoring.

This project aims to provide a clean starting point for building maintainable and production-ready Flutter applications.

## ✨ Features

- **GetX** — State management, dependency injection, and navigation.
- **Dio** — REST API integration, request/response handling, interceptors, and error handling.
- **WebSockets** — Real-time, bidirectional communication.
- **SharedPreferences** — Local storage for simple key-value data, such as app preferences and user settings.
- **Connectivity Plus** — Network connection status monitoring.
- **Reusable Architecture** — A foundation for organizing code into maintainable modules.
- **Scalable Structure** — Designed to support future features and application growth.

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| Flutter | Cross-platform UI development |
| GetX | State management, navigation, dependency injection |
| Dio | REST API requests |
| WebSockets | Real-time data communication |
| SharedPreferences | Local key-value storage |
| Connectivity Plus | Network connectivity monitoring |

## 📦 Dependencies

Add the following packages to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter

  get: ^4.7.2
  dio: ^5.8.0+1
  web_socket_channel: ^3.0.3
  shared_preferences: ^2.5.3
  connectivity_plus: ^6.1.4
```

These are example version constraints. Check pub.dev for compatible versions before using them in your project.

Install the dependencies:

```bash
flutter pub get
```

## 📁 Suggested Project Structure

```text
lib/
├── app/
│   ├── bindings/
│   ├── controllers/
│   ├── data/
│   │   ├── models/
│   │   ├── providers/
│   │   └── repositories/
│   ├── routes/
│   └── modules/
├── core/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   │   ├── dio_client.dart
│   │   └── connectivity_service.dart
│   ├── storage/
│   │   └── local_storage.dart
│   └── websocket/
│       └── socket_service.dart
├── shared/
│   ├── widgets/
│   └── utils/
└── main.dart
```

*Note: This is a suggested structure. Adapt it to match the actual files and folders in your repository.*

## ⚙️ Getting Started

### 1. Clone the repository

```bash
git clone <your-repository-url>
```

### 2. Open the project

```bash
cd <your-project-folder>
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the application

```bash
flutter run
```

## 🧩 Architecture Overview

### GetX
Use controllers to manage reactive state and business logic. Use bindings to register dependencies and GetX routes to navigate between screens.

### Dio
Centralize HTTP requests in a reusable API client. Configure base URLs, headers, timeouts, interceptors, and error handling in one place.

### WebSockets
Create a reusable socket service for real-time events. Handle connection lifecycle, reconnection strategies, stream subscriptions, and proper resource disposal.

### SharedPreferences
Store lightweight key-value data, such as user preferences and onboarding flags. Avoid storing sensitive information or large datasets in plain preferences.

### Connectivity Plus
Monitor network interface changes and update the application UI accordingly. Remember that connectivity status does not guarantee actual internet access; handle API failures separately.

## 🎯 Goals

- Keep business logic separate from UI code.
- Reuse common services across application modules.
- Simplify API integration and error handling.
- Support real-time communication.
- Improve maintainability and scalability.
- Provide a reusable foundation for future Flutter projects.

## 🚀 Future Improvements

- Centralized API error handling.
- Authentication and token refresh management.
- Automatic network retry strategies.
- Socket reconnection and lifecycle management.
- Unit and widget testing.
- CI/CD integration with GitHub Actions.
- Environment-based configuration for development and production.

## 🤝 Contributing

Contributions, suggestions, and improvements are welcome.

1. Fork the repository.
2. Create a feature branch.
3. Commit your changes.
4. Open a pull request.

## 📄 License

Choose a license for your repository, such as the MIT License, before distributing or reusing the project.

---

