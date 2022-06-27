import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/business_routes.dart';
import 'package:brandsome/business_module/request/bussines_filter_request.dart';
import 'package:brandsome/business_module/state_manager/business_list_bloc.dart';
import 'searbarfilter_business_screen.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:injectable/injectable.dart';

@injectable
class BusinessScreen extends StatefulWidget {
  final BusinessListCubit _cubit;
  const BusinessScreen(this._cubit);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
 late BusinessFilterRequest request ;
  void onSelected(BuildContext context, item) {
    switch (item) {
      case 0:
        print("Clicking add business");
        break;
      case 1:
        print("Clicking add post");
        break;
    }
  }

  @override
  void initState() {
   request = BusinessFilterRequest();
    widget._cubit.getBusinessList(request);
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
              onPressed: () {

              },
              icon: Icon(
                Icons.search,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                   BusinessRoutes.SEARCH_BUSINESS,
                );
              },
              icon: Icon(FontAwesomeIcons.filter,size: 18,),
            ),
            PopupMenuButton(
                icon: Icon(Icons.sort),
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        padding: EdgeInsets.all(10),
                        value: 0,
                        child: Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  SvgImg.SORT_ALPGA_DOWN,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  "A-Z",
                                ),
                                Divider(
                                  thickness: 2,
                                  height: 2,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              thickness: 1,
                              height: 2,
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        padding: EdgeInsets.all(10),
                        value: 1,
                        child: Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  SvgImg.PERSON,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  "Followers",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              thickness: 1,
                              height: 2,
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        padding: EdgeInsets.all(10),
                        value: 2,
                        child: Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  SvgImg.VIEWS,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  "Views",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              thickness: 1,
                              height: 2,
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        padding: EdgeInsets.all(10),
                        value: 3,
                        child: Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  SvgImg.PAPER,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  "Posts",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              thickness: 1,
                              height: 2,
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        padding: EdgeInsets.all(10),
                        value: 4,
                        child: Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  SvgImg.REVIEWS,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  "Reviews",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              thickness: 1,
                              height: 2,
                            ),
                          ],
                        ),
                      ),
                    ]),
          ],
        ),
        body: BlocBuilder<BusinessListCubit, States>(
            bloc: widget._cubit,
            builder: (context, state) {
              return state.getUI(context);
            }));
  }
}
