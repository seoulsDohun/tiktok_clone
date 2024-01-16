import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = "";
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  /* 이메일 입력 validation */
  bool _validationPassword() {
    return _password.isNotEmpty &&
        _password.length >= 8 &&
        _password.length <= 20;
  }

  /* 화면 클릭시 unfocus */
  void _scaffoldOnTap() {
    FocusScope.of(context).unfocus();
  }

  /* submit 이벤트 */
  void _onSubmit() {
    if (!_validationPassword()) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  /* 비밀번호 전체 지우기 버튼 이벤트 */
  void _passwordClear() {
    _passwordController.clear();
  }

  /* 비밀번호 show & hide 이벤트 */
  void _toggleObSecureText() {
    setState(() {
      obscureText = !obscureText;
    });
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
                'Create password',
                style: TextStyle(
                  fontSize: Sizes.size20 + Sizes.size2,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _passwordController,
                autocorrect: false,
                obscureText: obscureText,
                onEditingComplete: _onSubmit,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _passwordClear,
                        child: const FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h16,
                      GestureDetector(
                        onTap: _toggleObSecureText,
                        child: FaIcon(
                          obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                  hintText: 'password',
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
                child: FormButton(disabled: !_validationPassword()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
