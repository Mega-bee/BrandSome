import 'dart:async';

import 'package:brandsome/abstracts/model/menu_item.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_details_module/business_details_route.dart';
import 'package:brandsome/business_module/helper/enum_sort.dart';
import 'package:brandsome/business_module/helper/helper_sort_business.dart';
import 'package:brandsome/business_module/reponse/search_response.dart';
import 'package:brandsome/business_module/request/bussines_filter_request.dart';
import 'package:brandsome/business_module/state_manager/business_list_bloc.dart';
import 'package:brandsome/categories_module/reponse/category_response.dart';
import 'package:brandsome/di/di_config.dart';
import 'package:brandsome/utils/components/custom_menu.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../generated/l10n.dart';
import '../../../module_auth/request/otp_request.dart';
import '../../../module_auth/ui/state/request_otp_alert_state.dart';
import '../../../utils/global/global_state_manager.dart';

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
  StreamSubscription? _globalStateManager;

  String? returnServiceName;
  String? query;

  void getBusiness() {
    widget.cubit.getBusinessList(this, request);
  }

  @override
  followc(IsFollowCard request, String? id) {
    widget.cubit.FollowCardState(request, id);
  }

  @override
  void initState() {
    super.initState();
    request = BusinessFilterRequest(services: []);
    _globalStateManager =
        getIt<GlobalStateManager>().stateStream.listen((event) {
      if (mounted) {
        widget.cubit.getBusinessList(this, request);
      }
    });
    menuItems = [
      ItemModel(
          'A-Z',
          const Icon(Icons.sort_by_alpha,size: 20,), () {
        request.sortBy =
            HelperBusinessSort.getBusinessSortString(BusinessSortEnum.A_Z);
        widget.cubit.getBusinessList(this, request);
      }),
      ItemModel(
          'Followers',
    const Icon(Icons.follow_the_signs,size: 20,), () {
        request.sortBy = HelperBusinessSort.getBusinessSortString(
            BusinessSortEnum.FOLLOWERS);
        widget.cubit.getBusinessList(this, request);
      }),
      ItemModel(
          'Reviwes',
          const Icon(Icons.reviews_outlined,size: 20,), () {
        request.sortBy =
            HelperBusinessSort.getBusinessSortString(BusinessSortEnum.REVIEWS);
        widget.cubit.getBusinessList(this, request);
      }),
      ItemModel(
          'Posts',
          const Icon(Icons.post_add,size: 20,),() {
        request.sortBy =
            HelperBusinessSort.getBusinessSortString(BusinessSortEnum.POSTS);
        widget.cubit.getBusinessList(this, request);
      }),
      ItemModel(
          'Views',
          const Icon( FontAwesomeIcons.eye,
            size: 18,), () {
        request.sortBy =
            HelperBusinessSort.getBusinessSortString(BusinessSortEnum.VIEWS);
        widget.cubit.getBusinessList(this, request);
      }),
    ];
    widget.cubit.getBusinessList(this, request);
    widget.cubit.initConnectFirstTime();
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  requestOtp(OtpRequest request) {
    widget.cubit.requestOtp(this, request);
  }

  verifyOtp(VerifyOtpRequest request) {
    widget.cubit.verifyOtp(this, request);
  }

  bool checkIfLogin() {
    return widget.cubit.checkIfLogged();
  }
  loginFirst() {
    widget.cubit.emit(RequestOtpState(this));
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
                      returnServiceName =
                          vv.category.toString() + '/' + vv.name.toString();
                      widget.cubit.getBusinessList(this, request);
                    }
                  }
                });
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
            CustomMenuDropDown(
              mainIcon: Icons.sort,
              menuItems: menuItems,
            ),
          ],
        ),
        body: BlocConsumer<BusinessListCubit, States>(
            bloc: widget.cubit,
            buildWhen: (previous, current) => !current.isListener,
            listenWhen: (previous, current) => current.isListener,
            listener: (context, state) {
              print(state);
              print('in Lisssennnerrr');
              if (state.isListener) {
                showDialog(
                    context: context,
                    builder: (context) => state.getAlert(context));
              }

            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  returnServiceName != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$returnServiceName',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 15),
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
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
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
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView(
              children: [
                 Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    S.of(context).Business,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                snapshot.data!.business.isEmpty
                    ?  Center(
                        child: Text(
                            S.of(context).noResultsFound,
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
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.only(
                                                  start: 3,
                                                  end: 3,
                                                  top: 3,
                                                  bottom: 3),
                                          child: Text(
                                            "${e.name}",
                                            style: const TextStyle(fontSize: 10),
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
                  padding: EdgeInsets.all(10.0),
                  child: Text(
          S.of(context).Services,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                snapshot.data!.services.isEmpty
                    ?  Center(
                        child: Text(
                          S.of(context).noResultsFound,
                        ),
                      )
                    : GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(e.name ?? ''),
                                    const SizedBox(
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
