import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/entities/country_entity.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/presenter/blocs/country_api/country_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';

import '../../../../login/presenter/ui/widgets/custom_container.dart';
import '../../../../login/presenter/ui/widgets/custom_textfield_and_label.dart';
import '../../controllers/signup_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profileKey = GlobalKey<FormState>();

  final signUpController = Modular.get<SignUpController>();
  final countryBloc = Modular.get<CountryBloc>();

  @override
  void initState() {
    super.initState();
    countryBloc.add(FetchCountriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.04),
                  Text(
                    '😎 Setting up your\nprofile',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    children: [
                      Text(
                        'Add your profile photo',
                        style: TextStyle(color: Theme.of(context).dialogBackgroundColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomContainer(
              child: Stack(
                children: [
                  Form(
                    child: Column(
                      children: [
                        CustomTextFieldAndLabel(
                          label: 'Full Name',
                          iconData: IconlyLight.profile,
                          controller: signUpController.nameController,
                          validator: (name) {
                            if (name == null || name.isEmpty) {
                              return 'Please, fill this field';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  // TODO - Fazer com que possa selecionar o país no dropdown button, implementando um ProfileController
                  BlocBuilder<CountryBloc, CountryState>(
                    bloc: countryBloc,
                    builder: (_, state) {
                      if (state is CountryLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is CountryLoadedState) {
                        final countries = state.countries;

                        return DropdownButton<CountryEntity>(
                          hint: const Text("Selecione seu país"),
                          value: countries[0],
                          onChanged: (country) {},
                          items: countries
                              .map(
                                (country) => DropdownMenuItem(
                                  value: country,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: SvgPicture.network(country.countryImage),
                                      ),
                                      Text(country.name),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                          isDense: true,
                        );
                      } else {
                        return const Center(child: Text('ERROR'));
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
