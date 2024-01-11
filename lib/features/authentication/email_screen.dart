import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      backgroundColor: Colors.white,
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.size32,
          vertical: Sizes.size40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create username',
              style: TextStyle(
                fontSize: Sizes.size20 + Sizes.size2,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v10,
            Text(
              'You can always change this later.',
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
