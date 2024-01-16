import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/password_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  String _email = "";

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  /* 이메일 입력 validation */
  String? _validationEmail() {
    if (_email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) return 'Email not valid';
    return null;
  }

  /* 화면 클릭시 unfocus */
  void _scaffoldOnTap() {
    FocusScope.of(context).unfocus();
  }

  /* submit 이벤트 */
  void _onSubmit() {
    if (_email.isEmpty || _validationEmail() != null) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _scaffoldOnTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign up'),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size32,
            vertical: Sizes.size40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What is your email?',
                style: TextStyle(
                  fontSize: Sizes.size20 + Sizes.size2,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onEditingComplete: _onSubmit,
                decoration: InputDecoration(
                  hintText: 'email',
                  errorText: _validationEmail(),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v24,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                    disabled: _email.isEmpty || _validationEmail() != null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
