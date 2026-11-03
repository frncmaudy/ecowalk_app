import 'package:flutter/material.dart';
import 'package:project1/splash_page.dart';
import 'package:project1/login_page.dart';

import 'register_page.dart';
import 'verify_email.dart';
import 'verify_phone.dart';
import 'forgotpass_email.dart';
import 'forgotpass_phone.dart';
import 'new_password.dart';
import 'verify_pass_email.dart';
import 'verify_pass_phone.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'edit_profile_page.dart';
import 'camera_profile_page.dart';
import 'editprofile_preview.dart';
import 'settings_page.dart';
import 'change_phonenumber.dart';
import 'change_email.dart';
import 'change_password.dart';
import 'terms_page.dart';
import 'privacy_policy.dart';
import 'about_us.dart';
import 'detaildufan_page.dart';
import 'reviewdufan_page.dart';
import 'review_page.dart';
import 'category_page.dart';
import 'weather_page.dart';
import 'notification_page.dart';
import 'triprecap_page.dart';
import 'recentlyviewed_page.dart';
import 'review_detail_page.dart';
import 'recommendation_page.dart';
import 'route_recommendation_page.dart';
import 'public_transport_page.dart';
import 'private_transport_page.dart';
import 'transjakarta_page.dart';
import 'departure_page.dart';
import 'mrt_page.dart';
import 'lrt_page.dart';
import 'krl_page.dart';
import 'mikrotrans_page.dart';
import 'motor_page.dart';
import 'mobil_page.dart';
import 'ojek_online_page.dart';
import 'taxi_page.dart';
import 'traffic_conditions_page.dart';
import 'parking_motor_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ecowalk",
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashPage(),
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),

        "/verify-email": (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;

          final args = arguments is Map ? arguments : null;

          return VerifyEmailPage(
            email: args?["email"] as String?,
            nextRoute: args?["nextRoute"] as String? ?? "/login",
            returnToExistingRoute:
                args?["returnToExistingRoute"] as bool? ?? false,
          );
        },

        "/verify-phone": (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;

          final args = arguments is Map ? arguments : null;

          return VerifyPhonePage(
            phoneNumber: args?["phoneNumber"] as String?,
            nextRoute: args?["nextRoute"] as String? ?? "/login",
            returnToExistingRoute:
                args?["returnToExistingRoute"] as bool? ?? false,
          );
        },

        "/forgotpass-email": (context) => const ForgotPassEmailPage(),
        "/forgotpass-phone": (context) => const ForgotPassPhonePage(),
        "/new-password": (context) => const NewPasswordPage(),
        "/verify-pass-email": (context) => const VerifyPassEmailPage(),
        "/verify-pass-phone": (context) => const VerifyPassPhonePage(),
        "/home": (context) => const HomePage(),
        "/profile": (context) => const ProfilePage(),
        "/edit-profile": (context) => const EditProfilePage(),
        "/camera-profile": (context) => const CameraProfilePage(),
        "/editprofile-preview": (context) => const EditProfilePreviewPage(),
        "/settings": (context) => const SettingsPage(),
        "/change-phonenumber": (context) => const ChangePhoneNumberPage(),
        "/change-email": (context) => const ChangeEmailPage(),
        "/change-password": (context) => const ChangePasswordPage(),
        "/terms": (context) => const TermsPage(),
        "/privacy-policy": (context) => const PrivacyPolicy(),
        "/about-us": (context) => const AboutUs(),
        "/detail-dufan": (context) => const DetailDufanPage(),
        "/detaildufan": (context) => const DetailDufanPage(),
        "/ulasan-dufan": (context) => const ReviewDufanPage(),
        "/reviewdufan": (context) => const ReviewDufanPage(),
        "/nilai-ulasan": (context) => const ReviewPage(),
        "/review": (context) => const ReviewPage(),
        "/kategori": (context) => const CategoryPage(),
        "/category": (context) => const CategoryPage(),
        "/cuaca": (context) => const WeatherPage(),
        "/weather": (context) => const WeatherPage(),
        "/notification": (context) => const NotificationPage(),
        "/triprecap": (context) => const TripRecapPage(),
        "/rekap-perjalanan": (context) => const TripRecapPage(),
        "/recentlyviewed": (context) => const RecentlyViewedPage(),
        "/recently-viewed": (context) => const RecentlyViewedPage(),
        "/terakhir-dilihat": (context) => const RecentlyViewedPage(),
        "/review-detail": (context) => const ReviewDetailPage(),
        "/detail-ulasan": (context) => const ReviewDetailPage(),
        "/rekomendasi": (context) => const RecommendationPage(),
        "/recommendation": (context) => const RecommendationPage(),
        "/route-recommendation": (context) => const RouteRecommendationPage(),
        "/rekomendasi-rute": (context) => const RouteRecommendationPage(),
        "/public-transport": (context) => const PublicTransportPage(),
        "/transportasi-umum": (context) => const PublicTransportPage(),
        "/private-transport": (context) => const PrivateTransportPage(),
        "/transportasi-pribadi": (context) => const PrivateTransportPage(),
        "/motor": (context) => const MotorPage(),
        "/motor-pribadi": (context) => const MotorPage(),
        "/mobil": (context) => const MobilPage(),
        "/mobil-pribadi": (context) => const MobilPage(),
        "/ojek-online": (context) => const OjekOnlinePage(),
        "/ojol": (context) => const OjekOnlinePage(),
        "/taxi": (context) => const TaxiPage(),
        "/taksi": (context) => const TaxiPage(),
        "/transjakarta": (context) => const TransjakartaPage(),
        "/mrt": (context) => const MrtPage(),
        "/lrt": (context) => const LrtPage(),
        "/lrt-jabodetabek": (context) => const LrtPage(),
        "/krl": (context) => const KrlPage(),
        "/mikrotrans": (context) => const MikrotransPage(),
        "/departure": (context) => const DeparturePage(),
        "/departure-mrt": (context) =>
            const DeparturePage(mode: TransitDepartureType.mrt),
        "/departure-lrt": (context) =>
            const DeparturePage(mode: TransitDepartureType.lrt),
        "/departure-krl": (context) =>
            const DeparturePage(mode: TransitDepartureType.krl),
        "/departure-mikrotrans": (context) =>
            const DeparturePage(mode: TransitDepartureType.mikrotrans),
        "/departure-ojol": (context) =>
            const DeparturePage(mode: TransitDepartureType.ojekOnline),
        "/departure-ojek-online": (context) =>
            const DeparturePage(mode: TransitDepartureType.ojekOnline),
        "/departure-taxi": (context) =>
            const DeparturePage(mode: TransitDepartureType.taxi),
        "/departure-taksi": (context) =>
            const DeparturePage(mode: TransitDepartureType.taxi),
        "/keberangkatan": (context) => const DeparturePage(),
        "/traffic-mobil": (context) => const TrafficConditionsPage(),
        "/kondisi-lalu-lintas": (context) => const TrafficConditionsPage(),
        "/parking-motor": (context) => const ParkingMotorPage(),
        "/parkir-motor": (context) => const ParkingMotorPage(),
        "/informasi-parkir-motor": (context) => const ParkingMotorPage(),
        "/filter": (context) => const Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(child: FilterKategoriSheet()),
            ),
      },
    );
  }
}
