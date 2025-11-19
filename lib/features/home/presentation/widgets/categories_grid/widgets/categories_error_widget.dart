import 'package:flutter/material.dart';

class CategoriesErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const CategoriesErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(color: Colors.red, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Tekrar Dene'),
            ),
          ],
        ),
      ),
    );
  }
}