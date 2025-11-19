import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_bloc.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_state.dart';
import 'package:plantapp_case/features/home/presentation/widgets/questions_horizontal/question_card_widget.dart';

class QuestionsHorizontalWidget extends StatelessWidget {
  const QuestionsHorizontalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.questions.isEmpty) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: state.questions.length,

            itemBuilder: (context, index) {
              final question = state.questions[index];
              return Padding(
                padding: EdgeInsets.only(right: index < state.questions.length - 1 ? 16 : 0),
                child: QuestionCardWidget(question: question),
              );
            },
          ),
        );
      },
    );
  }
}
