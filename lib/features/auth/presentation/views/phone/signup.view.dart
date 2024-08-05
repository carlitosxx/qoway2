import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prinstom/features/auth/domain/entities/user.entity.dart';

import '../../../../../config/router/list_routes.dart';
import '../../../../../utils/error_mapping.util.dart';
import '../../../../../utils/modals/custom_modal.widget.dart';
import '../../../../home/presentation/providers/injects_container.provider.dart';
import '../../auth.i18n.dart';
import '../../providers/currency_selected.provider.dart';
import '../../providers/injects_container.provider.dart';
import '../../providers/user_active.provider.dart';
import '../../widgets/dropdown.widget.dart';

class SignUpPhoneView extends ConsumerStatefulWidget {
  const SignUpPhoneView({super.key});

  @override
  SignUpPhoneViewState createState() => SignUpPhoneViewState();
}

class SignUpPhoneViewState extends ConsumerState<SignUpPhoneView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    currencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currencySelected = ref.watch(currencySelectedProvider);
    final signupButtonState = ref.watch(signupEmailPasswordNotifierProvider);
    ref.listen(
      signupEmailPasswordNotifierProvider.select((value) => value),
      (previous, next) {
        next.whenOrNull(
          error: (message) {
            customModal(context, message, kClose.i18n);
          },
          data: (user) {
            ref.read(userActiveProvider.notifier).state = user;
            ref
                .read(loadFirstAccountByUserIdNotifierProvider.notifier)
                .loadFirstAccountByUserId(user.id!);
            ref.read(appRouterProvider).pushNamed('home');
          },
        );
      },
    );
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 0) {
          Navigator.of(context).pop();
        }
      },
      behavior: HitTestBehavior.translucent,
      onTap: () {
        primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Column(
                  children: [
                    const VerticalSpacerSmall(),

                    /// Logo
                    CircleAvatar(
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.8),
                      radius: MediaQuery.of(context).size.width / 4.5,
                      child: CustomPaint(
                        size: const Size(80, 100),
                        painter: PadlockCP(),
                      ),
                    ),
                    const VerticalSpacerSmall(),

                    /// Titulo
                    TextH1(text: kTitleSignup.i18n),
                    const VerticalSpacerSmall(),

                    /// Mensaje
                    TextB1(
                      text: kMessageSignUp.i18n,
                      textAlign: TextAlign.center,
                    ),
                    const VerticalSpacerSmall(),

                    /// Nombre
                    TextfieldName(
                        hint: kHintFullName.i18n, controller: nameController),
                    const VerticalSpacerMedium(),

                    /// Correo
                    TextfieldEmail(
                      hint: kEnterYourEmail.i18n,
                      controller: emailController,
                    ),
                    const VerticalSpacerMedium(),

                    /// Clave
                    TextfieldPassword(
                        hint: kEnterYourPassword.i18n,
                        controller: passwordController),
                    const VerticalSpacerMedium(),

                    /// Moneda
                    DropDown(
                      hint: kHintDropDownCurrency.i18n,
                      text: currencySelected?.description,
                      onTap: () {
                        ref.read(appRouterProvider).pushNamed('list_currency');
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          width: double.infinity,
          child: signupButtonState.maybeWhen(
            loading: () => const ButtonV1Loading(),
            orElse: () => SlideAnimation(
              duration: 900,
              offsetStart: const Offset(0, 100),
              child: ButtonV1(
                  text: kRegister.i18n,
                  onPressed: () {
                    if (emailController.text.trim().isEmpty ||
                        passwordController.text.trim().isEmpty ||
                        nameController.text.trim().isEmpty ||
                        currencySelected == null) {
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
                        .read(signupEmailPasswordNotifierProvider.notifier)
                        .signup(
                          User(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              descriptionCurrency: currencySelected.description,
                              shortDescriptionCurrency:
                                  currencySelected.shortDescription,
                              isSimbolLeft: currencySelected.isSimbolLeft,
                              simbolCurrency: currencySelected.simbol,
                              accounts: []),
                        );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
