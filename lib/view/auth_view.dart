import 'package:flutter/material.dart';
import 'package:matador/theme/color.dart';
import 'package:matador/view/login_view.dart';
import 'package:matador/view/register_view.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _tabController = TabController(
        length: 2,
        vsync: this,
      );
      _tabController.addListener(_handleTabSelection);
    }
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
          preferredSize: const Size.fromHeight(60),
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
              // onTap: (index) {
              //   updatePage(index);
              // },
              unselectedLabelColor: Colors.black,
              labelColor: CustomColors.secondaryColor,
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
              indicatorColor: CustomColors.secondaryColor,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  LoginView(),
                  RegisterScreen(),
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
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }
}
