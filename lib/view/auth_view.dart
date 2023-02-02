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
  int _page = 0;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final index = DefaultTabController.of(context).index;
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _page == 0 ? 'ĐĂNG NHẬP' : "ĐĂNG KÝ",
                  style: const TextStyle(
                    color: CustomColors.scaffoldBackgroundColor,
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
              onTap: (index) {
                updatePage(index);
                print(_page);
              },
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

  void _handleTabSelection() {
    setState(() {
      _page = _tabController.index;
    });
  }
}
