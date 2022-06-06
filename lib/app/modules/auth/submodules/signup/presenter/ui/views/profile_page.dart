// ignore_for_file: avoid_types_on_closure_parameters

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../../core/constants/strings.dart';
import '../../../../login/presenter/ui/widgets/custom_container.dart';
import '../../../../login/presenter/ui/widgets/custom_textfield_and_label.dart';
import '../../../domain/entities/country_entity.dart';
import '../../controllers/profile_controller.dart';
import '../../controllers/signup_controller.dart';
import '../../stores/country_store.dart';
import '../widgets/custom_dropdown_button.dart';
import '../widgets/custom_title_subtitle.dart';

class ProfilePage extends StatefulWidget {
  final CountryStore countryStore;
  final ProfileController profileController;
  final String previewName;

  const ProfilePage({
    Key? key,
    required this.countryStore,
    required this.profileController,
    required this.previewName,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final signUpController = Modular.get<SignUpController>();

  @override
  void initState() {
    super.initState();
    widget.countryStore.getCountries();
    widget.profileController.nameController.text = signUpController.nameInstance.value;
  }

  @override
  Widget build(BuildContext context) {
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
            CustomTitleSubtitile(
              title: Strings.profileTitle,
              subtitle: Strings.profileSubtitle,
            ),
            CustomContainer(
              child: Stack(
                children: [
                  Form(
                    child: Column(
                      children: [
                        CustomTextFieldAndLabel(
                          label: Strings.profileNameField,
                          iconData: IconlyLight.profile,
                          controller: widget.profileController.nameController,
                          onChanged: (value) => signUpController.name = value,
                          validator: (_) => signUpController.nameInstance.hasError(),
                        ),
                        ScopedBuilder(
                          store: widget.countryStore,
                          onLoading: (_) => const Center(child: CircularProgressIndicator()),
                          onError: (_, state) => Center(child: Text(Strings.defaultErrorMessage)),
                          onState: (_, List<CountryEntity> state) => Center(
                            child: CustomDropdownButton(
                              countries: state,
                              currentCountry: widget.countryStore.currentCountry!,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
