import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/login_form_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();
  final initialDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(_setInitialDate(initialDate));
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  /* 다음 버튼 클릭 */
  void onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginFormScreen(),
      ),
    );
  }

  /* 날짜 controller 데이터 세팅 */
  void _setTextFieldDate(DateTime date) {
    final birthday = date.toString().split(" ")[0];
    _birthdayController.value = TextEditingValue(text: birthday);
  }

  /* 12년 전 날짜 세팅 */
  DateTime _setInitialDate(DateTime date) {
    return DateTime(date.year - 12, date.month, date.day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "When's your birthday?",
              style: TextStyle(
                fontSize: Sizes.size20 + Sizes.size2,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v10,
            const Text(
              "Your birthday won't be shown publicly.",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              enabled: false,
              controller: _birthdayController,
              decoration: InputDecoration(
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
              onTap: onNextTap,
              child: const FormButton(disabled: false),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 300,
          child: CupertinoDatePicker(
            onDateTimeChanged: _setTextFieldDate,
            mode: CupertinoDatePickerMode.date,
            dateOrder: DatePickerDateOrder.ymd,
            initialDateTime: _setInitialDate(initialDate),
            maximumDate: _setInitialDate(initialDate),
          ),
        ),
      ),
    );
  }
}
