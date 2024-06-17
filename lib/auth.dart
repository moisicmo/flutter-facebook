import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Map<String, dynamic>? _userData;
  bool _checking = false;

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    } else {
      log('${result.status}');
      log('${result.message}');
    }
    setState(() => _checking = false);
  }

  _logout() async {
    await FacebookAuth.instance.logOut();
    _userData = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _checking
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _userData != null ? Text('name: ${_userData!['name']}') : Container(),
                  _userData != null ? Text('email: ${_userData!['email']}') : Container(),
                  _userData != null ? Image.network(_userData!['picture']['data']['url']) : Container(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3b5998),
                      ),
                      onPressed: _userData != null ? _logout : _login,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.facebook_rounded, color: Colors.white),
                          const SizedBox(width: 5),
                          Text(
                            _userData != null ? 'SALIR SESIÓN' : 'INICIAR SESIÓN',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
