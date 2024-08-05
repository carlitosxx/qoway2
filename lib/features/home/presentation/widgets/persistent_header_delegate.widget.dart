import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

/// Sliver simil al appbar pero customizable
class PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  /// Sliver simil al appbar pero customizable
  PersistentHeaderDelegate({
    required this.amountGold,
    required this.amountGem,
    required this.amountRacha,
    required this.course,
  });

  /// cantidad de oro
  final int amountGold;

  /// cantidad de gema
  final int amountGem;

  /// cantidad de racha
  final int amountRacha;

  /// texto del curso
  final String course;

  /// painter logo
  // final CustomPainter painter;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                const HorizontalSpacerMedium(),
                Flexible(
                  fit: FlexFit.tight,
                  child: Row(
                    children: [
                      // Oro
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer
                                .withOpacity(0.5),
                          ),
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              const HorizontalSpacerSmall(),
                              TextH4(
                                text: amountGold.toString(),
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const HorizontalSpacerSmall(),
                      // Gemas
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer
                                .withOpacity(0.5),
                          ),
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.diamond,
                                color: Colors.amberAccent,
                              ),
                              const HorizontalSpacerSmall(),
                              TextH4(
                                text: amountGem.toString(),
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const HorizontalSpacerSmall(),
                      // Racha
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer
                                .withOpacity(0.5),
                          ),
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.local_fire_department,
                                color: Colors.orange,
                              ),
                              const HorizontalSpacerSmall(),
                              TextH4(
                                text: amountGem.toString(),
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const HorizontalSpacerMedium(),
              ],
            ),
          ),
          Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withOpacity(0.5),
            ),
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 6),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Stack(
              children: [
                const Positioned(
                  child: Icon(
                    Icons.format_list_bulleted,
                    size: 28,
                  ),
                ),
                Center(
                  child: TextH4(
                    text: course,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => kToolbarHeight * 2;

  @override
  double get minExtent => kToolbarHeight * 2;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
