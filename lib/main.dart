import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:refferalapp/UI/Screens/SignIn/sign_in.dart';
import 'package:refferalapp/UI/Screens/SubmitNewRefferals/submitnew_refferal.dart';
import 'UI/Screens/MyProfileScreens/EditProfile.dart';
import 'UI/Screens/ReferralDetail/EditRefferal.dart';
import 'UI/Screens/ReferralPartnerScreens/NewRefferalPartner.dart';
import 'UI/Screens/SignUp/sign_up.dart';
import 'UI/Screens/SplashScreen/splash_screen.dart';

double height = Get.height;
double width = Get.width;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

///this is test
///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUp()),
        ChangeNotifierProvider(create: (_) => SignIn()),
        ChangeNotifierProvider(create: (_) => EditProfile()),
        ChangeNotifierProvider(create: (_) => SubmitRefferal()),
        ChangeNotifierProvider(create: (_) => EditRefferral()),
        ChangeNotifierProvider(create: (_) => NewRefferalPartner()),
      ],
      child: ScreenUtilInit(
        // designSize: Size(Get.width, Get.height),
        builder: (context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),
          // home: Testing(),

          //
          // home: LoginScreen(),
          // home: SignUpScreen(),
          // home: PlayerProfileScreen(),
          // home: const BottomBarScreen(),
          // home: DashBoardScreen(),
          // home: const RatingScreen(),
          // home: const NotificationsScreen(),
          // home: const MessageScreen(),
          // home: const ConversationScreen(),

          // home: Not5RatingStarScreen(),
        ),
      ),
    );
  }
}
