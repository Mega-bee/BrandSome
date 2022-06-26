import 'package:flutter/material.dart';

class BusinessCardInfoScreen extends StatefulWidget {
  final title;
  final id;
  BusinessCardInfoScreen({this.title,this.id});
  @override
  State<BusinessCardInfoScreen> createState() => _BusinessCardInfoScreenState();
}

class _BusinessCardInfoScreenState extends State<BusinessCardInfoScreen>
    with TickerProviderStateMixin {


  @override
  void initState() {
//    dataLoaderBloc = DataLoaderBloc(Default());
//    dataLoaderBloc.add(
//        FetchData(Urls.GET_BUSINESS_DETAILS + widget.id.toString(), requestType: RequestType.get));
  }

//  late DataLoaderBloc dataLoaderBloc;
  @override
  Widget build(BuildContext context) {
    return Container();
//    late TabController tabController = TabController(length: 3, vsync: this);
//    return BlocProvider(
//      create: (BuildContext context) => DataLoaderBloc(Default())
//        ..add(
//            FetchData(Urls.GET_BUSINESS_DETAILS + widget.id.toString(), requestType: RequestType.get)),
//      child: Scaffold(
//        appBar: AppBar(
//          centerTitle: true,
//          elevation: 0,
//          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//          title: Padding(
//            padding: const EdgeInsetsDirectional.only(start: 10.0),
//            child: Text(
//              "${widget.title}",
//            ),
//          ),
//        ),
//        body:
//        BlocBuilder<DataLoaderBloc, GlobalState>(
//            bloc: dataLoaderBloc,
//            builder: (context, state) {
//              if (state is Loading) {
//                return Center(
//                  child: CircularProgressIndicator(
//                    color: primaryColor,
//                  ),
//                );
//              } else if (state is Successfully) {
//                BusinessInfoModel businessInfoModel =
//                BusinessInfoModel.fromJson(state.data);
//                print("Dateee:  ${businessInfoModel.reviews!.map((e) => Text(e.createdDate.toString())).toList()}");
//
//                return Column(
//                  children: [
//                    Container(
//                      color: Theme.of(context).cardColor,
//                      child: TabBar(
//                        unselectedLabelColor: Color(0xffDFDFDF),
//                        labelColor: primaryColor,
//                        controller: tabController,
//                        indicatorColor: Theme.of(context).primaryColor,
//                        tabs: [
//                          Tab(
//                            text: "Info",
//                          ),
//                          Tab(
//                            text: "Posts",
//                          ),
//                          Tab(
//                            text: "Review",
//                          ),
//                        ],
//                      ),
//                    ),
//                    Container(
//                      child: Expanded(
//                        child: TabBarView(
//                          controller: tabController,
//                          children: [
//                            BusinessInfo(businessInfoModel: businessInfoModel),
//                            BusinessPosts(businessInfoModel: businessInfoModel.posts!,),
//                            ReviewScreen(review: businessInfoModel.reviews!,),
//                          ],
//                        ),
//                      ),
//                    )
//                  ],
//                );
//              }
//              return Container();
//            }),
//      ),
//    );
  }
}
