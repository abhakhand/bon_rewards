# Bon Rewards

Bon Rewards is a Flutter application that allows users to view and redeem rewards from various brands.

## Features

- Browse a list of available rewards (e.g., Amazon, Zomato, Myntra, Flipkart, Uber, etc.)
- View reward details and redeem them
- Attractive UI with brand logos
- Cross-platform support (Android, iOS, Web, Desktop)

## Project Structure

``` bash
lib/
  models/        # Data models (e.g., Reward)
  pages/         # App pages (e.g., RewardsPage)
  widgets/       # Reusable UI components
assets/
  logos/         # Brand logos in SVG format
test/            # Unit and widget tests
android/         # Android-specific files
ios/             # iOS-specific files
web/             # Web support
macos/           # macOS support
linux/           # Linux support
windows/         # Windows support
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart SDK (comes with Flutter)
- Android Studio or VS Code (recommended)

### Installation

1. Clone the repository:

   ```sh
   git clone <repo-url>
   cd bon_rewards
   ```

2. Install dependencies:

   ```sh
   flutter pub get
   ```

3. Run the app:

   ```sh
   flutter run
   ```

## Assets

Brand logos are located in the [`assets/logos/`](assets/logos/) directory and are referenced in the app.
