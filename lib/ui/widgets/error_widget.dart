
import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String errorMessage;
  final Function? onRetry;
  const ErrorWidget({super.key, required this.errorMessage, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(errorMessage),
          if (onRetry != null)
            ElevatedButton(
              onPressed: () {
                onRetry!(); //! if null not clla function
              },
              child: Text("Retry"),
            ),
        ],
      ),
    );
  }
}
