import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prinstom/features/auth/presentation/providers/injects_container.provider.dart';

import '../../../../../config/router/list_routes.dart';
import '../../../../../utils/error_mapping.util.dart';
import '../../../../../utils/modals/custom_modal.widget.dart';
import '../../auth.i18n.dart';

class SignInPhoneView extends ConsumerStatefulWidget {
  const SignInPhoneView({super.key});

  @override
  LoginPhoneViewState createState() => LoginPhoneViewState();
}

class LoginPhoneViewState extends ConsumerState<SignInPhoneView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stateButtonSignin = ref.watch(signinEmailPasswordNotifierProvider);
    print(stateButtonSignin);
    ref.listen(
      signinEmailPasswordNotifierProvider.select((value) => value),
      (previous, next) {
        next.whenOrNull(
          error: (message) {
            customModal(context, message, kClose.i18n);
          },
          data: (user) {
            // ref.read(appRouterProvider).pushNamed('');
            print(user!.name);
          },
        );
      },
    );

    return PopScope(
      canPop: false,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          primaryFocus?.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: kToolbarHeight,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: Column(
                    children: [
                      const VerticalSpacerSmall(),
                      // Logo
                      SlideAnimation(
                        duration: 900,
                        offsetStart: const Offset(0, -200),
                        child: Container(
                          padding: const EdgeInsets.only(
                            bottom: kToolbarHeight / 2,
                          ),
                          child: CustomPaint(
                            size: const Size(160, 160),
                            painter: LogoCP(
                              hasBackground: true,
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                          ),
                        ),
                      ),

                      // Titulo
                      TextH1(text: kTitle.i18n),
                      const VerticalSpacerSmall(),
                      // Mensaje
                      TextB1(text: kSignInMessage.i18n),
                      const VerticalSpacerSmall(),
                      // Textfield correo
                      TextfieldEmail(
                        hint: kEnterYourEmail.i18n,
                        controller: emailController,
                      ),
                      const VerticalSpacerMedium(),
                      // Textfield clave
                      TextfieldPassword(
                          hint: kEnterYourPassword.i18n,
                          controller: passwordController),
                      const VerticalSpacerMedium(),
                      // Olvidaste tu contraseña?
                      GestureDetector(
                        onTap: () {
                          ref
                              .read(appRouterProvider)
                              .pushNamed('forgot_password');
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextB1(
                            text: kForgotPassword.i18n,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                width: double.infinity,
                child: stateButtonSignin.maybeWhen(
                  loading: () => const ButtonV1Loading(),
                  orElse: () => ButtonV1(
                      text: kLogin.i18n,
                      onPressed: () {
                        if (emailController.text.trim().isEmpty ||
                            passwordController.text.trim().isEmpty) {
                          customModal(
                              context,
                              ErrorMapping(
                                messageError: kMessageEmptyFields.i18n,
                                painter: WarningCP(),
                                titleError: kAlert.i18n,
                              ),
                              kClose.i18n);
                          return;
                        }
                        ref
                            .read(signinEmailPasswordNotifierProvider.notifier)
                            .signin(
                                emailController.text, passwordController.text);
                      }),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                width: double.infinity,
                child: ButtonV1B(
                  onPressed: () {
                    ref.read(appRouterProvider).pushNamed('register');
                  },
                  text: kNotHaveAccount.i18n,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
