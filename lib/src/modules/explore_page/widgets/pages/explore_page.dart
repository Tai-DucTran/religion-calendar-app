import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/modules/explore_page/widgets/widgets.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({
    super.key,
  });

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _currentTabIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(() {});
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: MainAppBackgroundContainer(
          paddingHorizontal: 0,
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const ExplorePageHeader(),
                    Spacing.sp24,
                    SearchBarSection(
                      _currentTabIndex,
                    ),
                    Spacing.sp8,
                    TabsSection(
                      controller: _tabController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 200,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 120,
                        ),
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            LibraryTab(),
                            ReligionLocationTab(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
