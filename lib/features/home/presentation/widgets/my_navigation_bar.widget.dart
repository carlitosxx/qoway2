import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home.i18n.dart';
import '../providers/selected_button.provider.dart';

class MyNavigationBar extends ConsumerWidget {
  const MyNavigationBar({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIncomeSelected = ref.watch(isIncomeSelectedProvider);
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyButtonNavigation(
            text: kIncomes.i18n,
            onTap: () {
              ref.read(isIncomeSelectedProvider.notifier).update(
                    (state) => true,
                  );
            },
            icon: Icons.attach_money,
            isSelected: isIncomeSelected,
          ),
          MyButtonNavigation(
            text: kExpenses.i18n,
            onTap: () {
              ref.read(isIncomeSelectedProvider.notifier).update(
                    (state) => false,
                  );
            },
            icon: Icons.money_off,
            isSelected: !isIncomeSelected,
          ),
        ],
      ),
    );
  }
}

class MyButtonNavigation extends ConsumerWidget {
  const MyButtonNavigation({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon,
    required this.isSelected,
  });
  final String text;
  final void Function() onTap;
  final IconData icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                icon,
                color: isSelected
                    ? Theme.of(context).colorScheme.onPrimaryContainer
                    : Theme.of(context)
                        .colorScheme
                        .onSecondaryContainer
                        .withOpacity(0.3),
              ),
              TextH4(
                text: text,
                color: isSelected
                    ? Theme.of(context).colorScheme.onPrimaryContainer
                    : Theme.of(context)
                        .colorScheme
                        .onSecondaryContainer
                        .withOpacity(0.3),
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
