import 'package:flutter/material.dart';
import 'package:plantapp_case/features/home/domain/entities/question_entity.dart';

class QuestionCardWidget extends StatelessWidget {
  final QuestionEntity question;

  const QuestionCardWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Question tapped: ${question.title}');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: 240,
          height: 164,
          child: Stack(
            children: [
              Image.network(
                question.imageUri,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: const Color(0x26000000),
                    child: const Center(child: Icon(Icons.quiz_outlined, size: 40, color: Colors.grey)),
                  );
                },
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${question.subtitle}: ',
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 20 / 15,
                            letterSpacing: 0,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: question.title,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            height: 20 / 15,
                            letterSpacing: 0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
