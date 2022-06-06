// ignore_for_file: avoid_types_on_closure_parameters

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../../core/constants/strings.dart';
import '../../../../login/presenter/ui/widgets/login_widgets.dart';
import '../../../domain/entities/country_entity.dart';
import '../../controllers/profile_controller.dart';
import '../../controllers/signup_controller.dart';
import '../../stores/country_store.dart';
import '../utils/cpf_input_formatter.dart';
import '../utils/phone_input_formatter.dart';
import '../utils/rg_input_formatter.dart';
import '../widgets/signup_widgets.dart';

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
    final size = MediaQuery.of(context).size;
    final formKey = widget.profileController.formKey;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
      ),
      body: Stack(
        children: [
          CustomTitleSubtitile(
            title: Strings.profileTitle,
            subtitle: Strings.profileSubtitle,
          ),
          CustomContainer(
            paddingTop: size.height * 0.2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomProfilePhoto(),
                  Form(
                    key: formKey,
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
                              label: Strings.countryField,
                              countries: state,
                              currentCountry: widget.countryStore.currentCountry!,
                            ),
                          ),
                        ),
                        CustomTextFieldAndLabel(
                          label: Strings.cpfField,
                          iconData: IconlyLight.activity,
                          onChanged: (value) => widget.profileController.cpf = value,
                          validator: (_) => widget.profileController.cpfInstance.hasError(),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter(),
                            LengthLimitingTextInputFormatter(14)
                          ],
                        ),
                        CustomTextFieldAndLabel(
                          label: Strings.rgField,
                          iconData: IconlyLight.activity,
                          onChanged: (value) => widget.profileController.rg = value,
                          validator: (_) => widget.profileController.rgInstance.hasError(),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            RgInputFormatter(),
                            LengthLimitingTextInputFormatter(12),
                          ],
                        ),
                        CustomTextFieldAndLabel(
                          label: Strings.phoneField,
                          iconData: IconlyLight.activity,
                          onChanged: (value) => widget.profileController.phone = value,
                          validator: (_) => widget.profileController.phoneInstance.hasError(),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            PhoneInputFormatter(),
                            LengthLimitingTextInputFormatter(16),
                          ],
                        ),
                        SizedBox(height: size.height * 0.06),
                        CustomElevatedButton(
                          textButton: Strings.confirmButtonLabel,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              signUpController.handleSignUpWithEmail();
                            }
                          },
                        ),
                        SizedBox(height: size.height * 0.04),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
