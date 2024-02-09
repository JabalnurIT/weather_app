# Flutter Weather App with DDD, TDD, BLoC, Provider, and weatherapi.com

This Flutter application is a weather app designed using Domain-Driven Design (DDD) and Test-Driven Development (TDD) principles. It utilizes the BLoC and Provider patterns for state management and fetches weather data from the www.weatherapi.com API to provide accurate weather information.

## User Interface
The user interface of the app is intuitive and user-friendly, displaying essential weather information such as current temperature, weather condition, and location. Users can easily navigate through the app to access the weather details they need.

## Domain-Driven Design (DDD)
The app architecture follows Domain-Driven Design principles, separating the domain logic from the presentation layer. This ensures a clear separation of concerns and promotes maintainability and scalability.

## Test-Driven Development (TDD)
Test-Driven Development is employed to ensure the reliability and stability of the codebase. Unit tests are written before implementing the actual functionality, guiding the development process and validating the correctness of the code.

## BLoC and Provider
State management in the app is handled using both the BLoC (Business Logic Component) pattern and Provider. BLoC is used to manage complex business logic and data transformation, while Provider is utilized for dependency injection and managing app-wide state.

## www.weatherapi.com Integration
Weather data is fetched from the www.weatherapi.com API to provide users with accurate and up-to-date weather information. The app seamlessly integrates with the API, handling responses and errors gracefully to ensure a smooth user experience.

## Code Quality
- Clean and Modular Architecture: The codebase is structured following DDD principles, promoting modularity and maintainability.
- Test-Driven Development: Unit tests are written for critical functions to ensure code reliability and stability.
- State Management Best Practices: BLoC and Provider patterns are used for efficient state management, following best practices in Flutter development.

## How to Run
Ensure you have FVM and an emulator set up.

1. Run `flutter pub get` to install dependencies.
2. Execute `flutter test` to run unit TDD.
3. Locate the `main.dart` file.
4. Run the application by pressing the run button in the top right corner of your IDE.

## Conclusion
This Flutter Weather App combines the power of Domain-Driven Design, Test-Driven Development, BLoC, Provider, and the www.weatherapi.com API to deliver a robust and user-friendly weather application. With a focus on clean architecture, code quality, and reliability, the app offers accurate weather information while ensuring a seamless user experience.
