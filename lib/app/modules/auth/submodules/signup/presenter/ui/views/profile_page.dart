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
                          onChanged: (value) => signUpController.name = value,
                          validator: (value) => signUpController.nameInstance.hasError(),
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
