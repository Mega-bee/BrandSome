import 'dart:async';

import 'package:brandsome/abstracts/model/menu_item.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/di/di_config.dart';
import 'package:brandsome/home_page/state_manager/home_page_state_manager.dart';
import 'package:brandsome/module_auth/request/otp_request.dart';
import 'package:brandsome/module_auth/service/auth_service.dart';
import 'package:brandsome/posts_module/post_route.dart';
import 'package:brandsome/utils/global/global_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../request/is_like.dart';

@injectable
class HomePage extends StatefulWidget {
  final HomePageCubit cubit;
  final AuthService authService;

  const HomePage({required this.cubit, required this.authService});

  @override
  State<HomePage> createState() => HomePageScreenState();
}

class HomePageScreenState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late List<ItemModel> menuItems;
  StreamSubscription? _globalStateManager;

  goToLikes(String id) {
    widget.cubit.getToLikeList(this, id);
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  requestOtp(OtpRequest request) {
    widget.cubit.requestOtp(this, request);
  }

  verifyOtp(VerifyOtpRequest request, bool goToLikeList) {
    widget.cubit.verifyOtp(this, request);
  }

  Islike(LikeRequest request, String id) {
    widget.cubit.Islike(this, request, id);
  }

  bool isFlag = true;

  @override
  void initState() {
    super.initState();
    _globalStateManager =
        getIt<GlobalStateManager>().stateStream.listen((event) {
      if (mounted) {
        widget.cubit.getHome(this);
      }
    });
    menuItems = [
      ItemModel('Add Bussines', const Icon(Icons.card_travel), () {
//        Navigator.pushNamed(context, BusinessRoutes.ADD_BUSINESS);
      }),
      ItemModel('Add Post', const Icon(Icons.post_add), () {
        Navigator.pushNamed(context, PostRoutes.ADD_POST);
      }),
    ];
    widget.cubit.getHome(this);

    _scrollController = ScrollController();
  }

  ScrollController? _scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         title: Text(
//           "Brandsome",
//           style: TextStyle(
//             color: Theme.of(context).primaryColor,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) => SearchBarFilterScreen(),
//               //   ),
//               // );
//             },
//             icon: const Icon(
//               Icons.search,
//             ),
//           ),
//
// //            CustomMenuDropDown(
// //              mainIcon: Icons.add_circle_outline,
// //              menuItems: menuItems,
// //            ),
//           Padding(
//             padding: const EdgeInsets.only(right: 10.0),
//             child: IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.notifications_none),
//             ),
//           ),
//         ],
//       ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              // pinned: true,
              floating: true,
              // forceElevated: innerBoxIsScrolled,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                "Brandsome",
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
                  icon: const Icon(
                    Icons.search,
                  ),
                ),

//            CustomMenuDropDown(
//              mainIcon: Icons.add_circle_outline,
//              menuItems: menuItems,
//            ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none),
                  ),
                ),
              ],
            )
          ];
        },
        body: BlocConsumer<HomePageCubit, States>(
          bloc: widget.cubit,
          buildWhen: (previous, current) => !current.isListener,
          listenWhen: (previous, current) => current.isListener,
          builder: (context, state) {
            print(state);
            print('builderr');
            if (!state.isListener) {
              return state.getUI(context);
            }
            return Container();
          },
          listener: (context, state) {
            print(state);
            print('in Lisssennnerrr');
            if (state.isListener) {
              showDialog(
                  context: context,
                  builder: (context) => state.getAlert(context));
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController!.dispose();
    _globalStateManager?.cancel();
  }
}
