import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../../core/constants/strings.dart';
import '../../../../login/presenter/ui/widgets/custom_container.dart';
import '../../../../login/presenter/ui/widgets/custom_textfield_and_label.dart';
import '../../controllers/profile_controller.dart';
import '../../controllers/signup_controller.dart';
import '../widgets/custom_title_subtitle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final signUpController = Modular.get<SignUpController>();
  final profileController = Modular.get<ProfileController>();

  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = signUpController.name;
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
                          label: Strings.nameField,
                          iconData: IconlyLight.profile,
                          controller: nameController,
                          onChanged: (value) => signUpController.name = value,
                          validator: (value) => signUpController.nameInstance.hasError(),
                        ),
                        // DropdownButton<CountryEntity>(
                        //   hint: Text(Strings.profileCountryTitle),
                        //   value: countries,
                        //   onChanged: (country) {},
                        //   items: countries
                        //       .map(
                        //         (country) => DropdownMenuItem(
                        //           value: country,
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //             children: [
                        //               SizedBox(
                        //                 width: 100,
                        //                 height: 100,
                        //                 child: SvgPicture.network(country.countryImage),
                        //               ),
                        //               Text(country.name),
                        //             ],
                        //           ),
                        //         ),
                        //       )
                        //       .toList(),
                        //   isDense: true,
                        // );
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
