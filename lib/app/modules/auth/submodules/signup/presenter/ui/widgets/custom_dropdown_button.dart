// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/entities/country_entity.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<CountryEntity> countries;
  CountryEntity currentCountry;

  CustomDropdownButton({
    Key? key,
    required this.countries,
    required this.currentCountry,
  }) : super(key: key);

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DropdownButtonFormField<CountryEntity>(
      isExpanded: true,
      value: widget.currentCountry,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (newValue) {
        setState(() {
          widget.currentCountry = newValue!;
        });
      },
      items: widget.countries.map((value) {
        return DropdownMenuItem<CountryEntity>(
          value: value,
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.1,
                child: SvgPicture.network(value.countryImage, fit: BoxFit.cover),
              ),
              SizedBox(width: size.width * 0.05),
              Text(
                value.name.value,
                style: Theme.of(context).textTheme.headline5,
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
