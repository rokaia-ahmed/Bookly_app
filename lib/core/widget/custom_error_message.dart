
import 'package:flutter/widgets.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.errorMessage}) : super(key: key);
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
      ),
      ),
    );
  }
}
