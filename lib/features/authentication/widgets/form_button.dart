import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
    this.text,
  });

  final bool disabled;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
        decoration: BoxDecoration(
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(Sizes.size5),
        ),
        duration: const Duration(milliseconds: 500),
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: disabled ? Colors.grey.shade400 : Colors.white,
          ),
          duration: const Duration(milliseconds: 500),
          child: Text(
            disabled ? 'Sign up' : text ?? 'Next',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
