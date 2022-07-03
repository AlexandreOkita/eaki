import 'package:eaki/components/eaki_scaffold.dart';
import 'package:eaki/components/start_button.dart';
import 'package:eaki/pages/error_screen.dart';
import 'package:eaki/pages/first_question_page.dart';
import 'package:eaki/pages/loading_screen.dart';
import 'package:eaki/providers/auth_provider.dart';
import 'package:eaki/providers/queue_number_provider.dart';
import 'package:eaki/viewmodels/auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final screen = MediaQuery.of(context).size;

    return ref.watch(authStateProvider).when(
          error: (e, st) => ErrorScreen(st, e),
          loading: () => const LoadingScreen(),
          data: (user) {
            if (user == null) {
              ref.read(authVM).anonymousLogin();
              return const LoadingScreen();
            } else {
              return ref.watch(currentQueueNumber).when(
                    error: (e, st) => ErrorScreen(st, e),
                    loading: () => const LoadingScreen(),
                    data: (queueNumber) {
                      return queueNumber == null
                          ? Scaffold(
                              body: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screen.width * 0.1, vertical: screen.height * 0.05),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Text(
                                        "ÉAKI",
                                        style: textTheme.headline1,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 3,
                                      child: Image.asset(
                                        'assets/logo.png',
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          "Responda o questionário e vá para a fila correta",
                                          style: textTheme.headlineSmall,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: StartButton(
                                        onPressed: () => {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const FirstQuestionPage()),
                                          ),
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : EakiScaffold(
                              title: "Sua senha",
                              body: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      queueNumber.number.toString(),
                                      style: textTheme.headline1,
                                    ),
                                  )
                                ],
                              ),
                            );
                    },
                  );
            }
          },
        );
  }
}
