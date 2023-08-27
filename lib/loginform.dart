import 'package:flutter/material.dart';
import 'package:raisyu/loginpage.dart';

class LoginForm extends StatefulWidget {

  final void Function()toggleForm;

  const LoginForm({Key? key, required this.toggleForm}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _employeeNumberController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _formInvalid = false;

  @override
  void dispose() {
    _employeeNumberController.dispose();
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    String employeeNumber = _employeeNumberController.text;
    String id = _idController.text;
    String password = _passwordController.text;

    if (employeeNumber.isEmpty || id.isEmpty || password.isEmpty) {
      setState(() {
        _formInvalid = true;
      });
      return;
    }
    // Perform login logic here
    // You can check the employeeNumber, id, and password against your database or authentication service

    print('Employee Number: $employeeNumber');
    print('ID: $id');
    print('Password: $password');

    // Reset the text fields
    _employeeNumberController.clear();
    _idController.clear();
    _passwordController.clear();

    setState(() {
      _formInvalid = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            controller: _employeeNumberController,
            maxLength: 7,
            decoration: InputDecoration(
              labelText: '授業員番号',
              labelStyle: const TextStyle(color: Color(0xFF595151)),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                  color: Color(0xFFFF60C0),
                  width: 3.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 3.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _idController,
            maxLength: 6,
            decoration: InputDecoration(
              labelText: 'ID',
              labelStyle: const TextStyle(color: Color(0xFF595151)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                  color: Color(0xFFFF60C0),
                  width: 3.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 3.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _passwordController,
            maxLength: 6,
            decoration: InputDecoration(
              labelText: 'パスワード',
              labelStyle: const TextStyle(color: Color(0xFF595151)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                  color: Color(0xFFFF60C0),
                  width: 3.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 3.0,
                ),
              ),
            ),
            obscureText: true,
          ),
          Visibility(
            visible: _formInvalid,
            child: Text(
              'すべてのフィールドに入力してください',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          // ElevatedButton(
          //   onPressed: _login,
          //   child: Text('Login'),
          // ),
          SizedBox(height: 16.0),
          Container(
            width: 249,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xFFD3D1D1),
            ),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF47D4F3),
                        fixedSize:Size(0,63),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),

                      ),
                      child: Text(
                        'ログイン',
                        style: TextStyle(
                          color: Color(0xFF595151),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Expanded(
                    child:
                    ElevatedButton(
                      onPressed:widget.toggleForm,
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFFD3D1D1),
                          fixedSize:Size(0,63),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )
                      ),
                      child: Text(
                        '新規登録',
                        style: TextStyle(
                          color: Color(0xFF595151),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}