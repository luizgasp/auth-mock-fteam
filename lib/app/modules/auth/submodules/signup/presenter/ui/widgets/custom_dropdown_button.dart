// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/entities/country_entity.dart';

class CustomDropdownButton extends StatefulWidget {
  final String label;
  final List<CountryEntity> countries;
  CountryEntity currentCountry;

  CustomDropdownButton({
    Key? key,
    required this.label,
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        SizedBox(height: size.height * 0.015),
        DropdownButtonFormField<CountryEntity>(
          isExpanded: true,
          value: widget.currentCountry,
          elevation: 16,
          onChanged: (newValue) {
            setState(() => widget.currentCountry = newValue!);
          },
          items: widget.countries.map((value) {
            return DropdownMenuItem<CountryEntity>(
              value: value,
              child: Row(
                children: [
                  // TODO - Arrumar tamanho da bandeira do país
                  SizedBox(
                    width: size.width * 0.12,
                    child: SvgPicture.network(value.countryImage),
                  ),
                  SizedBox(width: size.width * 0.03),
                  Text(
                    value.name.value,
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
            );
          }).toList(),
        ),
        SizedBox(height: size.height * 0.015),
      ],
    );
  }
}
