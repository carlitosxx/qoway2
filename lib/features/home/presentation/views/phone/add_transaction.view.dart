import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prinstom/config/router/list_routes.dart';
import 'package:prinstom/features/auth/domain/entities/transaction.entity.dart';
import 'package:prinstom/features/auth/presentation/providers/user_active.provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../utils/error_mapping.util.dart';
import '../../../../../utils/modals/custom_modal.widget.dart';
import '../../home.i18n.dart';
import '../../providers/injects_container.provider.dart';
import '../../providers/load_account_by_userid_accountid/account_selected.provider.dart';

class AddTransactionPhoneView extends ConsumerStatefulWidget {
  const AddTransactionPhoneView({super.key});

  @override
  AddTransactionPhoneViewState createState() => AddTransactionPhoneViewState();
}

int tipoTransaccion = 1;

class AddTransactionPhoneViewState
    extends ConsumerState<AddTransactionPhoneView> {
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDay =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  @override
  void dispose() {
    descriptionController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createTransactionState = ref.watch(createTransactionNotifierProvider);
    final user = ref.watch(userActiveProvider);
    final accountId = getCurrentAccountId();
    ref.listen(
      createTransactionNotifierProvider.select((value) => value),
      (previous, next) {
        next.whenOrNull(
          error: (message) {
            customModal(context, message, kClose.i18n);
          },
          data: (account) {
            ref
                .read(loadListAccountsByUserIdNotifierProvider.notifier)
                .loadListAccountsByUserId(user!.id!);

            // REFRESCAR LAS TRANSACCIONES
            ref
                .read(loadAccountByUserIdAndAccountIdNotifierProvider.notifier)
                .loadAccountByUserIdAndAccountId(user.id!, accountId!);
            ref.read(appRouterProvider).pop();
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
        appBar: AppBar(
          title: Text(kAddTransaction.i18n),
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    const VerticalSpacerMedium(),
                    // Tipo de transacción
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            tipoTransaccion = 1;
                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: (tipoTransaccion == 0)
                                  ? Theme.of(context).scaffoldBackgroundColor
                                  : Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.12),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                kIncomes.i18n,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            tipoTransaccion = 0;
                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: (tipoTransaccion == 0)
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.12)
                                  : Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                kExpenses.i18n,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const VerticalSpacerLarge(),
                    TextfieldName(
                      hint: kHintEnterYourDescription.i18n,
                      controller: descriptionController,
                      icon: Icons.text_fields_rounded,
                    ),
                    const VerticalSpacerMedium(),
                    TextfieldMoney(
                        hint: kHintEnterYourAmount.i18n,
                        controller: amountController),
                    const VerticalSpacerMedium(),
                    TableCalendar<DateTime>(
                      locale: Localizations.localeOf(context).languageCode,
                      focusedDay: _focusedDay,
                      firstDay: DateTime(2000),
                      lastDay: DateTime(2100),
                      calendarFormat: _calendarFormat,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      // QUITAR EL BOTON WEEK Y CENTRAR EL MES Y AÑO
                      headerStyle: const HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                      ),
                      currentDay: DateTime.now(),
                      calendarStyle: CalendarStyle(
                        selectedTextStyle: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .scrim
                              .withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                      ),
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _selectedDay = DateTime(
                            selectedDay.year,
                            selectedDay.month,
                            selectedDay.day,
                          );
                          _focusedDay = focusedDay;
                        });
                      },
                      onFormatChanged: (format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      },
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          width: double.infinity,
          child: createTransactionState.maybeWhen(
            orElse: () => ButtonV1(
              text: kAddTransaction.i18n,
              onPressed: () {
                if (descriptionController.text.trim().isEmpty ||
                    amountController.text.trim().isEmpty) {
                  customModal(
                      context,
                      ErrorMapping(
                        messageError: kfieldsRequired.i18n,
                        painter: WarningCP(),
                        titleError: kAlert.i18n,
                      ),
                      kClose.i18n);
                  return;
                }
                ref
                    .read(createTransactionNotifierProvider.notifier)
                    .createTransaction(
                        user!.id!,
                        accountId!,
                        Transaction(
                            amount: double.parse(amountController.text),
                            date: _selectedDay,
                            description: descriptionController.text),
                        tipoTransaccion == 1 ? true : false);
              },
            ),
            loading: () => const ButtonV1Loading(),
          ),
        ),
      ),
    );
  }
}
