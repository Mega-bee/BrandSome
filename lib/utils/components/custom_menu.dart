import 'package:brandsome/abstracts/model/menu_item.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';

class CustomMenuDropDown extends StatelessWidget {
  final List<ItemModel> menuItems;
  final IconData mainIcon;

  CustomMenuDropDown({required this.menuItems, required this.mainIcon});

  CustomPopupMenuController _controller = CustomPopupMenuController();

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8, end: 15),
        child: Icon(mainIcon),
      ),
      menuBuilder: () => Padding(
        padding: const EdgeInsetsDirectional.only(start: 8,end: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: menuItems
                    .map(
                      (item) => GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: _controller.hideMenu,
                        child: InkWell(
                          onTap: (){
                            item.onTap();
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(children: [
                                  Icon(
                                    item.icon,
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    item.title,
                                  ),
                                ],),
                              ),
                              Divider(height: 3,thickness: 2,)
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
      pressType: PressType.singleClick,
      verticalMargin: -18,
      controller: _controller,
      barrierColor: Colors.black54,
      horizontalMargin: 0.0,
      arrowColor: Theme.of(context).primaryColor,
      showArrow: true,
      arrowSize: 20,
    );
  }
}
