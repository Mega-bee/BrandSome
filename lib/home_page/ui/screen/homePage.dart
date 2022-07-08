import 'package:brandsome/abstracts/model/menu_item.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/home_page/state_manager/home_page_state_manager.dart';
import 'package:brandsome/home_page/ui/state/homepage_success.dart';
import 'package:brandsome/module_auth/request/otp_request.dart';
import 'package:brandsome/posts_module/post_route.dart';
import 'package:brandsome/utils/components/custom_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../response/home_page.dart';

@injectable
class HomePage extends StatefulWidget {
  final HomePageCubit cubit;
  const HomePage({ required this.cubit});

  @override
  State<HomePage> createState() => HomePageScreenState();
}

class HomePageScreenState extends State<HomePage>
    with SingleTickerProviderStateMixin {

 late List<ItemModel> menuItems;


 goToLikes(){
   widget.cubit.getToLikeList(this);
 }
 requestOtp(OtpRequest request){
   widget.cubit.requestOtp(this ,request);
 }
 verifyOtp(VerifyOtpRequest request){
   widget.cubit.verifyOtp(this ,request);
 }
  @override
  void initState() {
    super.initState();
    menuItems = [
      ItemModel('Add Bussines', Icon(Icons.card_travel),(){
//        Navigator.pushNamed(context, BusinessRoutes.ADD_BUSINESS);
      }),
      ItemModel('Add Post', Icon(Icons.post_add),(){
        Navigator.pushNamed(context, PostRoutes.ADD_POST);
      }),
    ];
    widget.cubit.getHome(this);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
         elevation: 5,
        title: Text(
          "BrandSome",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => SearchBarFilterScreen(),
              //   ),
              // );
            },
            icon: Icon(
              Icons.search,
             ),
          ),
          CustomMenuDropDown(mainIcon: Icons.add_circle_outline,menuItems: menuItems,),

          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {

              },
              icon: Icon(
                Icons.notifications_none
              ),
            ),
          ),
        ],
      ),
        body: BlocConsumer<HomePageCubit, States>(
          bloc: widget.cubit,
          buildWhen: (previous, current) => !current.lis,
          listenWhen: (previous, current) => current.lis,
          builder: (context, state) {
            print(state);
            print('builderr');
            if (!state.lis) {
              return state.getUI(context);
            }
            return Container();
          },
          listener: (context, state) {
            print(state);
            print('in Lisssennnerrr');
            if (state.lis) {
              showDialog(
                  context: context,
                  builder: (context) => state.getAlert(context));
            }
          },
        )
    );
  }
}
