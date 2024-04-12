import 'package:flutter/material.dart';
import 'package:uc_flutter_task/core/navigation/navigation.dart';
import 'package:uc_flutter_task/features/login/presentation/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      // final firstTime = await SharedPreferences.getBool('first_time');
      // if (firstTime != null && firstTime == false) {
      //   final model = context.modelRead;
      //   await model.checkLoginStatus();
      //   if (model.isLoggedIn) {
      //     model.updateUser(
      //       locator
      //               .get<HiveService<UserModel>>()
      //               .get(box: USER_BOX_KEY, collection: USER_BOX_KEY) ??
      //           dummyUser,
      //     );
      //     pushToAndClearStack(context, const DashboardView());
      //     return;
      //   }
      //   pushToAndClearStack(context, const LoginView());
      //   return;
      // } else {
      //   pushToAndClearStack(context, const OnboardingView());
      // }
      pushToAndClearStack(context, const LoginPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'UC Task',
          style: TextStyle(color: Colors.black, fontSize: 26),
        ),
      ),
    );
  }
}
