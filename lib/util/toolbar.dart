import 'package:flutter/material.dart';
import 'package:tood_em/constant/const.dart';
import 'package:tood_em/constant/product_colors.dart';
import 'package:tood_em/database/data.dart';
import 'package:tood_em/util/toolbar_button.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1 / 2,
      margin: Constant.toolBarMargin,
      decoration: BoxDecoration(
        borderRadius: Constant.toolBarRadius,
        color: ProductColors.checkColor.withOpacity(0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          ToolBarButton(
            title: 'All',
            filterType: TaskFilter.all,
          ),
          ToolBarButton(
            title: 'Active',
            filterType: TaskFilter.active,
          ),
          ToolBarButton(
            title: 'Completed',
            filterType: TaskFilter.completed,
          ),
        ],
      ),
    );
  }
}
