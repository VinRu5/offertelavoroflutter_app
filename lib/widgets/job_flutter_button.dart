import 'package:flutter/cupertino.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

class JobFlutterButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;

  const JobFlutterButton({
    super.key,
    required this.child,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) => CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            border: Border.all(
              color: AppColors.primaryLight,
            ),
            borderRadius: BorderRadius.circular(42),
          ),
          child: Center(child: child),
        ),
      );
}
