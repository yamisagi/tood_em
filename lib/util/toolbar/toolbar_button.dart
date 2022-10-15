import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tood_em/database/data.dart';
import 'package:tood_em/providers/provider.dart';

import '../../constant/product_colors.dart';

class ToolBarButton extends ConsumerWidget {
  final TaskFilter filterType;
  final String title;
  const ToolBarButton({
    required this.title,
    required this.filterType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final filter = ref.watch(todoListFilter);

    Color? textColorFor(TaskFilter value) {
      return filter == value ? ProductColors.white : ProductColors.grey;
    }

    return TextButton(
      onPressed: () => ref.read(todoListFilter.notifier).state = filterType,
      style: ButtonStyle(
        enableFeedback: false,
        visualDensity: VisualDensity.compact,
        foregroundColor: MaterialStateProperty.all(textColorFor(filterType)),
      ),
      child: Text(
        title,
      ),
    );
  }
}
