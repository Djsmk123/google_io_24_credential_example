# One Tap Auth Example

This Flutter application demonstrates how to implement one-tap authentication using various methods including password, passkey, and Google Sign-In. The application leverages the `credential_manager` package for handling credentials and authentication.

## Features

- Register with password
- Register with passkey
- Sign in with Google
- Login with password/passkey/Google credentials

## Getting Started

To get started with this application, follow these steps:

### Prerequisites

- Flutter SDK
- Dart SDK
- A code editor (e.g., Visual Studio Code, Android Studio)
- A Firebase project (for Google Sign-In)

### Setup

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-repo/credential_manager_example.git
   cd credential_manager_example
   ```

2. **Install Dependencies**

   ```bash
   flutter pub get
   ```



4. **Run the Application**

   ```bash
   flutter run
   ```

## Project Structure

The project is structured as follows:

```
lib/
├── auth_screen.dart         // Main authentication screen
├── home_screen.dart         // Home screen after successful login
├── main.dart                // Main entry point of the application

```

## AuthScreen

The `AuthScreen` widget is the main screen for user authentication. It provides options to register with password, register with passkey, sign in with Google, and login with any of the available methods.

### Key Functions

- **signInWithGoogle**: Handles Google Sign-In logic.
- **login**: Handles login logic using available credentials.
- **registerWithPassword**: Handles registration with password.
- **registerWithPassKey**: Handles registration with passkey.

### Example Usage

```dart
ElevatedButton.icon(
  onPressed: googleSignIn ? null : signInWithGoogle,
  icon: googleSignIn
      ? const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 2,
          ),
        )
      : Image.network(
          "https://cdn4.iconfinder.com/data/icons/logos-brands-7/512/google_logo-google_icongoogle-512.png",
          height: 30,
        ),
  label: googleSignIn ? const SizedBox.shrink() : const Text('Sign in with Google'),
  style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.deepPurple,
    padding: const EdgeInsets.symmetric(
        vertical: 12.0, horizontal: 24.0),
    textStyle: const TextStyle(fontSize: 16.0),
  ),
),
```

## HomeScreen

The `HomeScreen` widget is displayed after a successful login. It simply greets the user.

### Example Usage

```dart
class HomeScreen extends StatelessWidget {
  final String user;

  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $user'),
      ),
      body: Center(
        child: Text('Hello, $user!'),
      ),
    );
  }
}
```



## Credential Manager

The `credential_manager` package is used to handle credential storage and retrieval.

### Example Usage

```dart
final credResponse = await credentialManager.getPasswordCredentials(
  passKeyOption: CredentialLoginOptions(
    challenge: EncryptData.getEncodedChallenge(),
    rpId: rpId,
    userVerification: 'required',
  ),
);
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

Feel free to customize and expand upon this example to fit your specific use case and requirements.