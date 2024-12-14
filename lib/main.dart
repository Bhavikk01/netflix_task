import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_task/app/controller/bottom_nav_controller.dart';
import 'package:netflix_task/app/routes/app_pages.dart';
import 'package:netflix_task/app/services/api_client.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<ApiClient>(ApiClient());
  Get.put(BottomNavBarController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Netflix UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black,
      ),
      getPages: AppPages.routes,
      initialRoute: Routes.splash,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000), (){
      Get.toNamed(Routes.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/icons/netflix_splash.gif',
        ),
      ),
    );
  }
}
