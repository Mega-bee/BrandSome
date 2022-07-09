import '../../../categories_module/reponse/add_location_response.dart';
import 'package:flutter/material.dart';

class CityCard extends StatefulWidget {
  final AddLocationResponse city;
  final Function onCheckClicked;

  CityCard({required this.city,required this.onCheckClicked});

  @override
  State<CityCard> createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 15.0),
          child: Row(
            children: [
              Checkbox(
                activeColor: Theme.of(context).primaryColor,
                value: widget.city.value,
                onChanged: (value) {
                  widget.city.value = !widget.city.value;
                  setState(() {

                  });
//                  onCheckClicked();
                },
              ),
              Text(
                "${widget.city.name}",
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 15.0, end: 15),
          child: Divider(
            thickness: 3,
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
