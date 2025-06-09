import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/data/model/subscription_plan_model.dart';
import 'package:edtech_app/features/plan/view/widget/bottom_section.dart';
import 'package:edtech_app/features/plan/view/widget/header_section.dart';
import 'package:edtech_app/features/plan/view/widget/plans_section.dart';
import 'package:edtech_app/features/plan/view/widget/subscription_dialog.dart';
import 'package:edtech_app/shared/widget/buttons/back_button_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SubscriptionPlansPage extends StatelessWidget {
  const SubscriptionPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SubscriptionPlansView();
  }
}

class SubscriptionPlansView extends StatefulWidget {
  const SubscriptionPlansView({super.key});

  @override
  SubscriptionPlansViewState createState() => SubscriptionPlansViewState();
}

class SubscriptionPlansViewState extends State<SubscriptionPlansView>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentIndex = 0; // Start with middle plan (Premium)

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  void _showSubscriptionDialog() {
    showDialog(
      context: context,
      builder: (context) => SubscriptionDialog(
        planName: studentsPlan[_currentIndex].name,
        planColor: studentsPlan[_currentIndex].color,
      ),
    );
  }

  // Hard-coded plan data
  final List<SubscriptionPlanModel> studentsPlan = [
    SubscriptionPlanModel(
      name: "Basic Plan - Discover",
      price1: "D2C Price ₹99",
      // period: "/month",
      color: Colors.blue,
      gradientColors: [Color(0xFF4FC3F7), Color(0xFF29B6F6)],
      features: [
        "1 career assessment",
        "1 Career Recommendation",
        "2 Intro Videos",
        "1 Suggested Course (no deep access)",
      ],
      isPopular: false,
    ),
    SubscriptionPlanModel(
      name: "Lite Plan - Explore",
      price1: "D2C ₹349",
      price2: "B2B (School): ₹199",
      period: "/student",
      color: Colors.purple,
      gradientColors: [Color(0xFF9C27B0), Color(0xFF673AB7)],
      features: [
        "Full Access to 1 Career Course",
        "8 Detailed Videos + PDFs, PPTs",
        "Mind Maps + Periodic Assessments",
        "Personalized Fit Score",
      ],
      isPopular: false,
    ),
    SubscriptionPlanModel(
      name: "Pro Plan - Excel",
      price1: "D2C ₹599",
      price2: "B2B (School): ₹499",
      period: "/student",
      color: Colors.orange,
      gradientColors: [Color(0xFFFF9800), Color(0xFFFF5722)],
      features: [
        "Access to All Courses",
        "All Lite Features",
        "1-on-1 Career Counselling",
        "Personalized Roadmap",
      ],
      isPopular: true,
    ),
  ];

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut));

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.elasticOut));

    // Start animations
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: BackButtonWidget(),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            HeaderSection(
              slideAnimation: _slideAnimation,
              onBackPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: PlansSection(
                pageController: _pageController,
                plans: studentsPlan,
                currentIndex: _currentIndex,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            BottomSection(
              slideController: _slideController,
              plans: studentsPlan,
              currentIndex: _currentIndex,
              onSubscribe: () => _showSubscriptionDialog(),
            ),
          ],
        ),
      ),
    );
  }
}
