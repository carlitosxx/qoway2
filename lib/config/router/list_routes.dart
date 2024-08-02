import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:i18n_extension/i18n_extension.dart';
import '../../features/auth/presentation/auth.page.dart';
import '../../features/auth/presentation/views/phone/list_currency.view.dart';
import '../../features/auth/presentation/views/phone/signup.view.dart';
import '../../features/home/home.page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'root',
        builder: (context, state) => I18n(child: const AuthPage()),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        pageBuilder: (context, state) => CustomTransitionPage(
          reverseTransitionDuration: const Duration(milliseconds: 400),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1, 0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          child: I18n(
            child: const SignUpPhoneView(),
          ),
        ),
      ),
      GoRoute(
        path: '/list_currency',
        name: 'list_currency',
        pageBuilder: (context, state) => CustomTransitionPage(
          reverseTransitionDuration: const Duration(milliseconds: 400),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0, 1);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          child: I18n(
            child: const ListCurrencyPhoneView(),
          ),
        ),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        pageBuilder: (context, state) => CustomTransitionPage(
          reverseTransitionDuration: const Duration(milliseconds: 400),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1, 0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          child: I18n(
            child: const HomePage(),
          ),
        ),
      ),
      // GoRoute(
      //   path: '/create_account_tablet',
      //   name: 'create_account_tablet',
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     reverseTransitionDuration: const Duration(milliseconds: 400),
      //     transitionDuration: const Duration(milliseconds: 400),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // const begin = Offset(1, 0);
      // const end = Offset.zero;
      // const curve = Curves.easeInOut;
      // final tween =
      //     Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      //       return SlideTransition(
      //         position: animation.drive(tween),
      //         child: child,
      //       );
      //     },
      //     child: I18n(
      //       child: const CreateAccountTabletView(),
      //     ),
      //   ),
      // ),
      // GoRoute(
      //   path: '/validate_otp_phone',
      //   name: 'validate_otp_phone',
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     reverseTransitionDuration: const Duration(milliseconds: 400),
      //     transitionDuration: const Duration(milliseconds: 400),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       const begin = Offset(1, 0);
      //       const end = Offset.zero;
      //       const curve = Curves.easeInOut;
      //       final tween =
      //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      //       return SlideTransition(
      //         position: animation.drive(tween),
      //         child: child,
      //       );
      //     },
      //     child: I18n(
      //       child: ValidateOtpPhoneView(phoneNumber: state.extra! as String),
      //     ),
      //   ),
      // ),
      // GoRoute(
      //   path: '/register_information_phone',
      //   name: 'register_information_phone',
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     reverseTransitionDuration: const Duration(milliseconds: 400),
      //     transitionDuration: const Duration(milliseconds: 400),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       const begin = Offset(1, 0);
      //       const end = Offset.zero;
      //       const curve = Curves.easeInOut;
      //       final tween =
      //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      //       return SlideTransition(
      //         position: animation.drive(tween),
      //         child: child,
      //       );
      //     },
      //     child: I18n(
      //       child: const RegisterInformationPhoneView(),
      //     ),
      //   ),
      // ),

      // GoRoute(
      //   path: '/my_profile',
      //   name: 'my_profile',
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     reverseTransitionDuration: const Duration(milliseconds: 400),
      //     transitionDuration: const Duration(milliseconds: 400),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       const begin = Offset(1, 0);
      //       const end = Offset.zero;
      //       const curve = Curves.easeInOut;
      //       final tween =
      //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      //       return SlideTransition(
      //         position: animation.drive(tween),
      //         child: child,
      //       );
      //     },
      //     child: I18n(
      //       child: const MyProfilePage(),
      //     ),
      //   ),
      // ),
    ],
  );
});
