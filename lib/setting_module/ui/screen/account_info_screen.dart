import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/account_state_manager.dart';

@injectable
class AccountInfoScreen extends StatefulWidget {
  final AccountCubit cubit;
  AccountInfoScreen(this.cubit);

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {


  @override

  void initState() {

    widget.cubit.getAccount();
  }
  @override
  Widget build(BuildContext context) {
    bool edit = false;
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        title: Text(
          "Account Info",
        ),

        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  edit = true;
                });
              },
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<AccountCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          })
    );
  }
}
