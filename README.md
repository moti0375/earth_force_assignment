# Earth Force Assignment

A Flutter application designed to track and map Points of Interest (POIs). The app captures the user's real-time location, allows for the creation of POIs, and visualizes them on an interactive map. It is built with a focus on a clean, scalable architecture using MobX for state management and Drift for local data persistence.

## ✨ Features

- **Real-time Location Tracking**: Continuously listens to the user's location updates using the device's GPS.
- **Map Integration**: Displays the user's current location and all saved Points of Interest on Google Maps.
- **POI Management**: Allows users to add new POIs with their current coordinates.
- **Local Data Persistence**: Saves POI data locally on the device using a **Drift** (formerly Moor) SQLite database, ensuring data is available even when offline.
- **Offline Support**: Stores POIs created offline. The architecture supports extending it to sync data with a remote server when a connection is available.
- **Scalable Architecture**: Built using a clean architecture that separates data, presentation, and domain logic for better maintainability.

## 🛠️ Tech Stack & Dependencies

- **State Management**: **[MobX](https://pub.dev/packages/mobx)** for reactive state management, keeping the UI in sync with the application state automatically.
- **Dependency Injection**: **[Injectable](https://pub.dev/packages/injectable)** with **[GetIt](https://pub.dev/packages/get_it)** for managing dependencies and decoupling components.
- **Local Database**: **[Drift](https://drift.simonbinder.eu/)** for a persistent and reactive local SQLite database.
- **Value Objects & Immutability**: **[Freezed](https://pub.dev/packages/freezed)** for creating immutable data models and helper methods (e.g., `fromJson`/`toJson`, `copyWith`).
- **Location Services**: **[Geolocator](https://pub.dev/packages/geolocator)** for fetching the device's GPS location.
- **Mapping**: **[Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)** for displaying the map interface.
- **Code Generation**: **[build_runner](https://pub.dev/packages/build_runner)** to auto-generate the necessary boilerplate code for `injectable`, `freezed`, `mobx`, and `drift`.

## ⚙️ Installation & Setup

Follow these steps to get the project up and running on your local machine.

### 1. Prerequisites

- You must have the [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
- An IDE like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).
- For Google Maps, you will need an API key. Follow the instructions to get an API key and configure it for [Android](https://pub.dev/packages/google_maps_flutter#android) and [iOS](https://pub.dev/packages/google_maps_flutter#ios).

### 2. Clone the Repository

