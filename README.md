# ossos_technical_test

This is a simple Flutter project that leverages the Model-View-Controller (MVC) architecture. The project uses the Dio HTTP client, the BLoC pattern for state management, GoRouter for Navigation 2, GetIt for dependency injection, Flutter ScreenUtil for responsive UI, and Infinite Scroll Pagination for data fetching.

## Table of Contents

- Getting Started
- Test Logic App
- Integration Test
- Libraries
- Running the App
- Contributing
### Getting Started

To get started with this project, follow these steps:

Clone the repository:

Copy
git clone https://github.com/username/my_flutter_project.git
cd my_flutter_project

```
Install the dependencies:

Copy:    flutter pub get
```

Run the app on your preferred device or emulator.
### Test Logic App
```
Run Test:

Copy:    flutter test
```
### Integration Test
```
Run Integration Test:

Copy:    flutter run integration_test/app_test.dar
```

### Architecture

This project uses the Model-View-Controller (MVC) architecture, which is suitable for simple projects. The project is divided into the following layers:

Model: Represents the data and business logic of the application.
View: Displays the data and interacts with the user.
Controller: Handles user input, manipulates the model, and updates the view accordingly.

### Libraries

The following third-party libraries are used in this project:

[Dio](https://pub.dev/packages/dio): A powerful HTTP client for Dart.

[flutter_bloc](https://pub.dev/packages/flutter_bloc): A library for implementing the BLoC pattern in Flutter.

[go_router](https://pub.dev/packages/go_router): A declarative router for Navigation 2 in Flutter.

[get_it](https://pub.dev/packages/get_it): A service locator for dependency injection in Dart and Flutter.

[flutter_screenutil](https://pub.dev/packages/flutter_screenutil): A library for adapting screen sizes and font sizes in Flutter.

[infinite_scroll_pagination](https://pub.dev/packages/infinite_scroll_pagination): A library for implementing pagination with infinite scrolling in Flutter.

### Running the App

To run the app on your preferred device or emulator, use the following command:


```
Copy:   flutter run
```
### Contributing

Contributions are welcome!


