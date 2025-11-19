import 'package:flutter/material.dart';

class CategoriesEmptyWidget extends StatelessWidget {
  const CategoriesEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category_outlined, size: 48, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Kategori bulunamadı',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}