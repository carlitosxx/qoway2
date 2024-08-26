import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/router/list_routes.dart';
import '../../../auth/presentation/providers/user_active.provider.dart';
import '../home.i18n.dart';
import '../providers/injects_container.provider.dart';

class MyDrawer extends ConsumerStatefulWidget {
  /// Menu lateral
  const MyDrawer({
    super.key,
  });

  @override
  MyDrawerState createState() => MyDrawerState();
}

/// Estado del widget lateral
class MyDrawerState extends ConsumerState<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userActiveProvider);
    return Drawer(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            curve: Curves.bounceInOut,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Column(
              children: [
                CircleAvatar(
                    radius: 48,
                    child: SvgPicture.asset('assets/icons/logotipo.svg')),
                const VerticalSpacerSmall(),
                const TextH4(text: 'Pringstom'),
              ],
            ),
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.person_2_rounded,
                ),
              ),
            ),
            title: Text(kAccounts.i18n),
            onTap: () {
              // ref.read(getProfileNotifierProvider.notifier).getProfile();
              ref
                  .read(loadListAccountsByUserIdNotifierProvider.notifier)
                  .loadListAccountsByUserId(user!.id!);
              ref.read(appRouterProvider).pushNamed('create_account');
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
            ),
          ),
          // ListTile(
          //   leading: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(8),
          //       color: Theme.of(context).colorScheme.primaryContainer,
          //     ),
          //     child: const Padding(
          //       padding: EdgeInsets.all(5),
          //       child: Icon(
          //         Icons.credit_score_rounded,
          //       ),
          //     ),
          //   ),
          //   title: Text('kMyTickets.i18n'),
          //   onTap: () {},
          //   trailing: const Icon(
          //     Icons.arrow_forward_ios_rounded,
          //     size: 16,
          //   ),
          // ),
          // ListTile(
          //   leading: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(8),
          //       color: Theme.of(context).colorScheme.primaryContainer,
          //     ),
          //     child: const Padding(
          //       padding: EdgeInsets.all(5),
          //       child: Icon(
          //         Icons.history,
          //       ),
          //     ),
          //   ),
          //   title: Text('kHistory.i18n'),
          //   onTap: () {},
          //   trailing: const Icon(
          //     Icons.arrow_forward_ios_rounded,
          //     size: 16,
          //   ),
          // ),
          // ListTile(
          //   leading: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(8),
          //       color: Theme.of(context).colorScheme.primaryContainer,
          //     ),
          //     child: const Padding(
          //       padding: EdgeInsets.all(5),
          //       child: Icon(
          //         Icons.airplane_ticket,
          //       ),
          //     ),
          //   ),
          //   title: Text('kCoupon.i18n'),
          //   onTap: () {},
          //   trailing: const Icon(
          //     Icons.arrow_forward_ios_rounded,
          //     size: 16,
          //   ),
          // ),
          // ListTile(
          //   leading: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(8),
          //       color: Theme.of(context).colorScheme.primaryContainer,
          //     ),
          //     child: const Padding(
          //       padding: EdgeInsets.all(5),
          //       child: Icon(
          //         Icons.question_answer_rounded,
          //       ),
          //     ),
          //   ),
          //   title: Text('kQA.i18n'),
          //   onTap: () {},
          //   trailing: const Icon(
          //     Icons.arrow_forward_ios_rounded,
          //     size: 16,
          //   ),
          // ),
          // ListTile(
          //   leading: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(8),
          //       color: Theme.of(context).colorScheme.primaryContainer,
          //     ),
          //     child: const Padding(
          //       padding: EdgeInsets.all(5),
          //       child: Icon(
          //         Icons.menu_book_rounded,
          //       ),
          //     ),
          //   ),
          //   title: Text('kComplaintsBook.i18n'),
          //   onTap: () {},
          //   trailing: const Icon(
          //     Icons.arrow_forward_ios_rounded,
          //     size: 16,
          //   ),
          // ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.menu_book_rounded,
                ),
              ),
            ),
            title: Text(kLogout.i18n),
            onTap: () {
              // ref.read(logoutNotifierProvider.notifier).logout();
              // clearAndNavigate(ref);
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
