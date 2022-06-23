import 'package:brandsome/business_module/model/business_card.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Views/connactionError.dart';
import '../../../hive/hive.dart';
import '../../../home_page/ui/widgets/notification_screen.dart';
import '../../../home_page/ui/widgets/searbarfilter_screen.dart';
import '../../../network/DataLoaderBloc.dart';
import '../../../network/WebUrl.dart';
import '../../../utils/style/colors.dart';
import '../widget/SearchBar.dart';
import '../widget/business-card.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
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

  List<BusinessResponse> business = [];

  late DataLoaderBloc dataLoaderBloc;

  @override
  void initState() {
    dataLoaderBloc = DataLoaderBloc(Default());
    dataLoaderBloc
        .add(FetchData(Urls.GET_BUSINESS, requestType: RequestType.get));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DataLoaderBloc(Default())
        ..add(FetchData(Urls.GET_BUSINESS, requestType: RequestType.get)),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Padding(
              padding: const EdgeInsetsDirectional.only(start: 10.0),

              child: Text("BrandSome", style: TextStyle(color: primaryColor)),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchBarScreen()),
                  );
                },
                icon: Icon(
                  Icons.search,
                  color: ThemeHelper().getisDark() ? whiteColor : blackColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchBarFilterScreen()),
                  );
                },
                icon: SvgPicture.asset(
                  SvgImg.FILTER,
                  color: ThemeHelper().getisDark() ? whiteColor : blackColor,
                ),
              ),
              PopupMenuButton(
                  icon: SvgPicture.asset(
                    SvgImg.SORT_BY,
                    color: ThemeHelper().getisDark() ? whiteColor : blackColor,
                  ),
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
                                  ImageIcon(AssetImage(ImageAsset.SORT_ICON),
                                      color: Theme.of(context).primaryColor),
                                  SizedBox(
                                    width: 5,
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
                                  ImageIcon(
                                    AssetImage(
                                      ImageAsset.PERSON_ICON,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
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
                                  ImageIcon(
                                    AssetImage(
                                      ImageAsset.VIEWS_ICON,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
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
                                  SvgPicture.asset(SvgImg.PAPER),
                                  SizedBox(
                                    width: 5,
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
                                  ImageIcon(
                                    AssetImage(
                                      ImageAsset.FAV_ICON,
                                    ),
                                    color: ThemeHelper().getisDark()
                                        ? whiteColor
                                        : primaryColor,
                                  ),
                                  SizedBox(
                                    width: 5,
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
          body: BlocBuilder<DataLoaderBloc, GlobalState>(
              bloc: dataLoaderBloc,
              builder: (context, state) {
                if (state is Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ConnectionError) {
                  return ConnectionErrorScreen(
                      errorMessage: 'connectionError',
                      retry: () {
                        BlocProvider.of<DataLoaderBloc>(context)
                          ..add(FetchData(Urls.GET_BUSINESS,
                              requestType: RequestType.get));
                      });
                } else if (state is Error) {
                  return ConnectionErrorScreen(
                      errorMessage: state.errorMessage,
                      retry: () {
                        BlocProvider.of<DataLoaderBloc>(context)
                          ..add(FetchData(Urls.GET_BUSINESS,
                              requestType: RequestType.get));
                      });
                } else if (state is Successfully) {
                  business.clear();
                  for (var item in state.data) {
                    business.add(BusinessResponse.fromJson(item));
                  }

                  return business != null
                      ? ListView.builder(
                          physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: business.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(height: 10,),
                                BusinessCard(
                                  business[index],
                                ),
                              ],
                            );
                          })
                      : Center(
                          child: Text(
                            "No business to show",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                }
                return Container();
              })),
    );
  }
}
