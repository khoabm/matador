import 'package:flutter/material.dart';
import 'package:matador/theme/color.dart';
import 'package:matador/view/login_view.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            centerTitle: true,
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: CustomColors.primaryColor,
              ),
            ),
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'ĐĂNG NHẬP',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: CustomColors.primaryColor,
              tabs: const [
                Tab(
                  text: 'ĐĂNG NHẬP',
                ),
                Tab(
                  text: 'ĐĂNG KÝ',
                )
              ],
              controller: _tabController,
              // indicatorSize: TabBarIndicatorSize.tab,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
              indicatorColor: CustomColors.primaryColor,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  LoginView(),
                  Text('Person'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
