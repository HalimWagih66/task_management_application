import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view_model/sign_up_view_model.dart';
import '../../../../../../core/utils/widget/TextFormField/custom_form_field.dart';

class FormSignUpNameUser extends StatelessWidget {
  const FormSignUpNameUser({super.key, required this.formKey});
   final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    SignUpViewModel signUpViewModel = Provider.of<SignUpViewModel>(context,listen: false);
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomFormField(
                hintText: "ex: Smith",
                textLabel: AppLocalizations.of(context)!.first_name,
                functionValidate: (text) {
                  if (text == null || text.trim().isEmpty == true) {
                    return AppLocalizations.of(context)!.please_enter_your_name;
                  }
                  if(text.contains(" ") == true){
                    return AppLocalizations.of(context)!.please_enter_your_first_name_only;
                  }
                  signUpViewModel.userInformationModel.fullName = text;
                  return null;
                },
                borderField: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue, style: BorderStyle.solid, width: 2)),
              ),
              const SizedBox(height: 50),
              CustomFormField(
                hintText: "ex: john",
                textLabel: AppLocalizations.of(context)!.last_name,
                functionValidate: (text) {
                  if (text == null || text.trim().isEmpty == true) {
                    return AppLocalizations.of(context)!.please_enter_your_last_name_only;
                  }
                  if(text.contains(" ") == true){
                    return AppLocalizations.of(context)!.please_enter_your_first_name_only;
                  }
                  signUpViewModel.userInformationModel.fullName = "${signUpViewModel.userInformationModel.fullName} $text";
                  return null;
                },
                borderField: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue, style: BorderStyle.solid, width: 2)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
