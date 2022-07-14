import 'package:brandsome/abstracts/model/menu_item.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_details_module/business_details_route.dart';
import 'package:brandsome/business_module/helper/enum_sort.dart';
import 'package:brandsome/business_module/helper/helper_sort_business.dart';
import 'package:brandsome/business_module/reponse/search_response.dart';
import 'package:brandsome/business_module/request/bussines_filter_request.dart';
import 'package:brandsome/business_module/state_manager/business_list_bloc.dart';
import 'package:brandsome/categories_module/categories_routes.dart';
import 'package:brandsome/categories_module/reponse/category_response.dart';
import 'package:brandsome/utils/components/custom_menu.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../request/business_follow_card_request.dart';

@injectable
class BusinessScreen extends StatefulWidget {
  final BusinessListCubit cubit;

  const BusinessScreen(this.cubit);

  @override
  State<BusinessScreen> createState() => BusinessScreenState();
}

class BusinessScreenState extends State<BusinessScreen> {
  late BusinessFilterRequest request;
  late List<ItemModel> menuItems;

  String? returnServiceName;
  String? query;

  @override

  followc(IsFollowCard request,String?id){
    widget.cubit.FollowCardState(request,id);
  }

  void initState() {
    super.initState();
//    initSearch();
//    initUpdate();
    request = BusinessFilterRequest(services: []);
    menuItems = [
      ItemModel(
          'A-Z',
          SvgPicture.asset(
            SvgImg.SORT_ALPGA_DOWN,
          ), () {
        request.sortBy =
            HelperBusinessSort.getBusinessSortString(BusinessSortEnum.A_Z);
        widget.cubit.getBusinessList(this, request);
      }),
      ItemModel(
          'Followers',
          SvgPicture.asset(
            SvgImg.SORT_ALPGA_DOWN,
          ), () {
        request.sortBy = HelperBusinessSort.getBusinessSortString(
            BusinessSortEnum.FOLLOWERS);
        widget.cubit.getBusinessList(this, request);
      }),
      ItemModel(
          'Reviwes',
          SvgPicture.asset(
            SvgImg.SORT_ALPGA_DOWN,
          ), () {
        request.sortBy =
            HelperBusinessSort.getBusinessSortString(BusinessSortEnum.REVIEWS);
        widget.cubit.getBusinessList(this, request);
      }),
      ItemModel(
          'Posts',
          SvgPicture.asset(
            SvgImg.SORT_ALPGA_DOWN,
          ), () {
        request.sortBy =
            HelperBusinessSort.getBusinessSortString(BusinessSortEnum.POSTS);
        widget.cubit.getBusinessList(this, request);
      }),
      ItemModel(
          'Views',
          SvgPicture.asset(
            SvgImg.SORT_ALPGA_DOWN,
          ), () {
        request.sortBy =
            HelperBusinessSort.getBusinessSortString(BusinessSortEnum.VIEWS);
        widget.cubit.getBusinessList(this, request);
      }),
    ];
    widget.cubit.getBusinessList(this, request);
    widget.cubit.initConnectFirstTime();
  }
  void refresh(){
    if(mounted){
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 5,
          title: Text("Brandsome",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              )),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                        context: context,
                        query: query,
                        delegate: CustomSearchDelegateIn(widget.cubit))
                    .then((value) {
                  if (value != null) {
                    value as List<Object>;
                    query = value[0] as String;
                    if (value[1] == null) {
//                      widget.cubit.getBusinessList(this, request);
                    } else {
                      ServiceModel vv = value[1] as ServiceModel;
                      request.services = [];
                      request.services.add(vv.id ?? -1);
                      returnServiceName = vv.name ?? '';
                      widget.cubit.getBusinessList(this, request);
                    }
                  }
                });
              },
              icon: Icon(
                Icons.search,
              ),
            ),
//            IconButton(
//              onPressed: () {
//                Navigator.pushNamed(
//                    context, CategoriesRoutes.CATEGORY_LIST_SCREEN);
//              },
//              icon: Icon(
//                FontAwesomeIcons.filter,
//                size: 18,
//              ),
//            ),
            CustomMenuDropDown(
              mainIcon: Icons.sort,
              menuItems: menuItems,
            ),
          ],
        ),
        body: BlocBuilder<BusinessListCubit, States>(
            bloc: widget.cubit,
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  returnServiceName != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '/${returnServiceName}',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container(),
                  Expanded(child: state.getUI(context)),
                ],
              );
            }));
  }
}

class CustomSearchDelegateIn extends SearchDelegate {
  BusinessListCubit searchBloc;

  CustomSearchDelegateIn(this.searchBloc);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      searchBloc.searchTerm(query);
      return StreamBuilder(
        stream: searchBloc.searchResults,
        builder: (context, AsyncSnapshot<SearchResponse> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Business',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                snapshot.data!.business.isEmpty
                    ? Center(
                        child: Text(
                          "No Results Found.",
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.business.length,
                        itemBuilder: (context, index) {
                          var result = snapshot.data!.business[index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context,
                                  BusinessDetailsRoutes.BUSINESS_DETAILS_SCREEN,
                                  arguments: {
                                    "id": result.id.toString(),
                                    "name": result.name.toString()
                                  });
                            },
                            child: ListTile(
                              title: Text(result.name ?? ''),
                              subtitle: Wrap(
                                children: result.service
                                    .map<Widget>(
                                      (e) => Card(
                                        color: Colors.grey.shade700,
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.only(
                                                  start: 3,
                                                  end: 3,
                                                  top: 3,
                                                  bottom: 3),
                                          child: Text(
                                            "${e.name}",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(result.image ?? '')),
                              trailing: Text(
                                result.type ?? '',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Theme.of(context).disabledColor),
                              ),
                            ),
                          );
                        },
                      ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Services',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                snapshot.data!.services.isEmpty
                    ? Center(
                        child: Text(
                          "No Results Found.",
                        ),
                      )
                    : GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: snapshot.data!.services.map((e) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                close(context, [query, e]);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: Colors.grey.shade800,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(e.name ?? ''),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    e.image != null
                                        ? Image.network(e.image ?? '')
                                        : Image.asset(
                                            ImageAsset.CAT,
                                          )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
              ],
            );
          }
        },
      );
    } else {
      return Container();
    }
    // This method is called everytime the search term changes.
  }
}