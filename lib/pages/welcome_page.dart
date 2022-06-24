
import 'package:eaki/pages/first_question_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/start_button.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: screen.width * 0.1, vertical: screen.height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("ÉAKI", 
            style: textTheme.headline1,),
            Center(
              child: Text("Responda o questionário e vá para a fila correta",
              style: textTheme.headlineSmall),
            ),
             StartButton(
                        onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FirstQuestionPage()),
                  ),
              },
            ),

          ],
        ),
      ),
    );
  }
}
