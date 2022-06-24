import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Views/connactionError.dart';
import '../../../business_module/model/business_card_model.dart';
import '../../../hive/hive.dart';
import '../../../network/DataLoaderBloc.dart';
import '../../../network/WebUrl.dart';
import '../../model/business_info_model.dart';
import 'business info.dart';
import 'business posts.dart';
import 'reviews.dart';

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
    dataLoaderBloc = DataLoaderBloc(Default());
    dataLoaderBloc.add(
        FetchData(Urls.GET_BUSINESS_DETAILS + widget.id.toString(), requestType: RequestType.get));
  }

  late DataLoaderBloc dataLoaderBloc;
  @override
  Widget build(BuildContext context) {
    late TabController tabController = TabController(length: 3, vsync: this);
    return BlocProvider(
      create: (BuildContext context) => DataLoaderBloc(Default())
        ..add(
            FetchData(Urls.GET_BUSINESS_DETAILS + widget.id.toString(), requestType: RequestType.get)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Padding(
            padding: const EdgeInsetsDirectional.only(start: 10.0),
            child: Text(
              "${widget.title}",
            ),
          ),
        ),
        body: BlocBuilder<DataLoaderBloc, GlobalState>(
            bloc: dataLoaderBloc,
            builder: (context, state) {
              if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              } else if (state is ConnectionError) {
                return ConnectionErrorScreen(
                    errorMessage: 'connectionError',
                    retry: () {
                      BlocProvider.of<DataLoaderBloc>(context)
                        ..add(FetchData(Urls.GET_BUSINESS_DETAILS,
                            requestType: RequestType.get));
                    });
              } else if (state is Error) {
                return ConnectionErrorScreen(
                    errorMessage: state.errorMessage,
                    retry: () {
                      BlocProvider.of<DataLoaderBloc>(context)
                        ..add(FetchData(Urls.GET_BUSINESS_DETAILS,
                            requestType: RequestType.get));
                    });
              } else if (state is Successfully) {
                BusinessInfoModel businessInfoModel =
                BusinessInfoModel.fromJson(state.data);
                print("Dateee:  ${businessInfoModel.reviews!.map((e) => Text(e.createdDate.toString())).toList()}");

                return Column(
                  children: [
                    Container(
                      color: Theme.of(context).cardColor,
                      child: TabBar(
                        unselectedLabelColor: Color(0xffDFDFDF),
                        labelColor: primaryColor,
                        controller: tabController,
                        indicatorColor: Theme.of(context).primaryColor,
                        tabs: [
                          Tab(
                            text: "Info",
                          ),
                          Tab(
                            text: "Posts",
                          ),
                          Tab(
                            text: "Review",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            BusinessInfo(businessInfoModel: businessInfoModel),
                            BusinessPosts(businessInfoModel: businessInfoModel.posts!,),
                            ReviewScreen(review: businessInfoModel.reviews!,),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }
              return Container();
            }),
      ),
    );
  }
}
