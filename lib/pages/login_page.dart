import 'package:flutter/material.dart';
import '../services/dio_service.dart';
import '../storage/shared_prefference.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _tokenController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _tokenController,
            decoration: const InputDecoration(
              labelText: 'User Token',
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final user = await DioService().getUserByToken(_tokenController.text);
              if (user != null) {
                await LoginState.saveUserToken(user.token);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invalid token, please try again'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
