import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uc_flutter_task/core/navigation/navigation.dart';
import 'package:uc_flutter_task/core/utils/colors.dart';
import 'package:uc_flutter_task/core/utils/extensions.dart';
import 'package:uc_flutter_task/features/channels/presentation/pages/channels_listing_page.dart';
import 'package:uc_flutter_task/features/login/presentation/providers/login_provider.dart';
import 'package:uc_flutter_task/features/login/presentation/providers/login_state.dart';
import 'package:flutter_hooks/flutter_hooks.dart' as fh;
import 'package:uc_flutter_task/widgets/custom_alerts.dart';
import 'package:uc_flutter_task/widgets/custom_buttons.dart';
import 'package:uc_flutter_task/widgets/custom_input_fields.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController =
        fh.useTextEditingController(text: 'flutter_test');
    final passwordController = fh.useTextEditingController(text: '1111');
    final formKey = fh.useState(GlobalKey<FormState>());
    final isLoading = fh.useState<bool>(false);
    final isObscure = fh.useState<bool>(false);
    ref.listen(
      loginProvider,
      (prev, next) {
        if (next is LoginLoading) {
          isLoading.value = true;
        }
        if (next is LoginError) {
          isLoading.value = false;
          Snackbars.show(next.error, isError: true, context);
        }
        if (next is LoginSuccess) {
          isLoading.value = false;
          pushToAndClearStack(context, const ChannelListingPage());
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: formKey.value,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              InputFields(
                label: 'Username',
                hint: 'Enter your Username',
                onLabelSuffixTap: () {},
                controller: usernameController,
                filled: true,
                enabled: !isLoading.value,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: context.height * 0.02),
              InputFields(
                label: 'Password',
                hint: 'Enter your Password',
                onLabelSuffixTap: () {},
                controller: passwordController,
                enabled: !isLoading.value,
                filled: true,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.done,
                isPassword: isObscure.value,
                suffixIcon: GestureDetector(
                  onTap: () {
                    isObscure.value = !isObscure.value;
                  },
                  child: isObscure.value
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: PrimaryButton(
          onTap: () {
            if (usernameController.text.isEmpty) {
              Snackbars.show(
                  'Please enter your email address', isError: true, context);
            } else if (passwordController.text.isEmpty) {
              Snackbars.show(
                  'Please enter your password', isError: true, context);
            } else {
              final data = {
                "login_type": "Credentials",
                "username": usernameController.text.replaceAll(' ', ''),
                "password": passwordController.text.replaceAll(' ', ''),
                "device": "flutter_test_device_herodion_momoh"
              };
              final notifier = ref.read(loginProvider.notifier);
              notifier.login(data);
            }
          },
          text: 'Sign in my Account',
          height: context.height * 0.058,
          buttonColor: AppColors.primaryColor,
          isLoading: isLoading.value,
        ),
      ),
    );
  }
}
