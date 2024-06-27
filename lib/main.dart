import 'package:credential_manager/credential_manager.dart';
import 'package:credential_manager_example/auth_screen.dart';
import 'package:flutter/material.dart';

CredentialManager credentialManager = CredentialManager();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (credentialManager.isSupportedPlatform) {
    await credentialManager.init(
        preferImmediatelyAvailableCredentials: true,
        googleClientId: "<GoogleClientId>");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(
        key: Key('auth_screen'),
      ),
    );
  }
}
