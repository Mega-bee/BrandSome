import 'package:brandsome/abstracts/model/menu_item.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/business_routes.dart';
import 'package:brandsome/business_module/helper/enum_sort.dart';
import 'package:brandsome/business_module/helper/helper_sort_business.dart';
import 'package:brandsome/business_module/request/bussines_filter_request.dart';
import 'package:brandsome/business_module/state_manager/business_list_bloc.dart';
import 'package:brandsome/categories_module/categories_routes.dart';
import 'package:brandsome/utils/components/custom_menu.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:injectable/injectable.dart';

@injectable
class BusinessScreen extends StatefulWidget {
  final BusinessListCubit cubit;

  const BusinessScreen(this.cubit);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  late BusinessFilterRequest request;
  late List<ItemModel> menuItems;

  @override
  void initState() {
    request = BusinessFilterRequest();
    menuItems = [
      ItemModel('A-Z', SvgPicture.asset(
        SvgImg.SORT_ALPGA_DOWN,
      ),(){
        request.sortBy = HelperBusinessSort.getBusinessSortString(BusinessSortEnum.A_Z);
        widget.cubit.getBusinessList(request);
      }),

      ItemModel('Followers', SvgPicture.asset(
        SvgImg.SORT_ALPGA_DOWN,
      ),(){
        request.sortBy = HelperBusinessSort.getBusinessSortString(BusinessSortEnum.FOLLOWERS);
        widget.cubit.getBusinessList(request);
      }),
      ItemModel('Reviwes', SvgPicture.asset(
        SvgImg.SORT_ALPGA_DOWN,
      ),(){
        request.sortBy = HelperBusinessSort.getBusinessSortString(BusinessSortEnum.REVIEWS);
        widget.cubit.getBusinessList(request);
      }),
      ItemModel('Posts', SvgPicture.asset(
        SvgImg.SORT_ALPGA_DOWN,
      ),(){
        request.sortBy = HelperBusinessSort.getBusinessSortString(BusinessSortEnum.POSTS);
        widget.cubit.getBusinessList(request);
      }),
      ItemModel('Views', SvgPicture.asset(
        SvgImg.SORT_ALPGA_DOWN,
      ),(){
        request.sortBy = HelperBusinessSort.getBusinessSortString(BusinessSortEnum.VIEWS);
        widget.cubit.getBusinessList(request);
      }),

    ];
    widget.cubit.getBusinessList(request);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 5,
          title: Text("BrandSome",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              )),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                    CategoriesRoutes.CATEGORY_LIST_SCREEN
                );
              },
              icon: Icon(
                FontAwesomeIcons.filter,
                size: 18,
              ),
            ),
            CustomMenuDropDown(mainIcon:Icons.sort,menuItems: menuItems,),

//            PopupMenuButton(
//                icon: Icon(Icons.sort),
//                onSelected: (item) => onSelected(context, item),
//                itemBuilder: (context) => [
//                      PopupMenuItem(
//                        padding: EdgeInsets.all(10),
//                        value: 0,
//                        child: Column(
//                          children: [
//                            Row(
//                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: [
//
//                                SizedBox(
//                                  width: 7,
//                                ),
//                                Text(
//                                  "",
//                                ),
//                                Divider(
//                                  thickness: 2,
//                                  height: 2,
//                                ),
//                              ],
//                            ),
//                            SizedBox(
//                              height: 20,
//                            ),
//                            Divider(
//                              thickness: 1,
//                              height: 2,
//                            ),
//                          ],
//                        ),
//
//                      ),
//                      PopupMenuItem(
//                        padding: EdgeInsets.all(10),
//                        value: 1,
//                        child: Column(
//                          children: [
//                            Row(
//                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: [
//                                SvgPicture.asset(
//                                  SvgImg.PERSON,
//                                ),
//                                SizedBox(
//                                  width: 7,
//                                ),
//                                Text(
//                                  "Followers",
//                                ),
//                              ],
//                            ),
//                            SizedBox(
//                              height: 20,
//                            ),
//                            Divider(
//                              thickness: 1,
//                              height: 2,
//                            ),
//
//                          ],
//                        ),
//
//                      ),
//                      PopupMenuItem(
//                        padding: EdgeInsets.all(10),
//                        value: 2,
//                        child: Column(
//                          children: [
//                            Row(
//                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: [
//                                SvgPicture.asset(
//                                  SvgImg.VIEWS,
//                                ),
//                                SizedBox(
//                                  width: 7,
//                                ),
//                                Text(
//                                  "Views",
//                                ),
//                              ],
//                            ),
//                            SizedBox(
//                              height: 20,
//                            ),
//                            Divider(
//                              thickness: 1,
//                              height: 2,
//                            ),
//                          ],
//                        ),
//                      ),
//                      PopupMenuItem(
//                        padding: EdgeInsets.all(10),
//                        value: 3,
//                        child: Column(
//                          children: [
//                            Row(
//                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: [
//                                SvgPicture.asset(
//                                  SvgImg.PAPER,
//                                ),
//                                SizedBox(
//                                  width: 7,
//                                ),
//                                Text(
//                                  "Posts",
//                                ),
//                              ],
//                            ),
//                            SizedBox(
//                              height: 20,
//                            ),
//                            Divider(
//                              thickness: 1,
//                              height: 2,
//                            ),
//                          ],
//                        ),
//                      ),
//                      PopupMenuItem(
//                        padding: EdgeInsets.all(10),
//                        value: 4,
//                        child: Column(
//                          children: [
//                            Row(
//                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: [
//                                SvgPicture.asset(
//                                  SvgImg.REVIEWS,
//                                ),
//                                SizedBox(
//                                  width: 7,
//                                ),
//                                Text(
//                                  "Reviews",
//                                ),
//                              ],
//                            ),
//                            SizedBox(
//                              height: 20,
//                            ),
//                            Divider(
//                              thickness: 1,
//                              height: 2,
//                            ),
//                          ],
//                        ),
//                      ),
//                    ]),
          ],
        ),
        body: BlocBuilder<BusinessListCubit, States>(
            bloc: widget.cubit,
            builder: (context, state) {
              return state.getUI(context);
            }));
  }
}
