import 'package:flutter/material.dart';

import '../../constants/strings.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(70),
        border: Border(
          top: BorderSide(color: Colors.grey.withAlpha(60), width: 1),
        ),
      ),
      child: const Center(
        child: Text(
          '${AppString.appName} ${AppString.appVersion}',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),
    );
  }
}
