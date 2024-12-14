import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
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
  final TextEditingController _searchKeywordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        body: MainAppBackgroundContainer(
          paddingHorizontal: 0,
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const ExplorePageHeader(),
                    Spacing.sp24,
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenConfig.defaultHorizontalScreenPadding,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormFieldContainer(
                              titleStyle: AriesTextStyles.textBodyNormal,
                              textFieldColors: Colors.white,
                              controller: _searchKeywordController,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacing.sp8,
                    TabBar(
                      controller: _tabController,
                      labelColor: AriesColor.yellowP950,
                      unselectedLabelColor: AriesColor.neutral90,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(
                          text: LocalizedKeys.libraryButtonText,
                        ),
                        Tab(
                          text: LocalizedKeys.churchesButtonText,
                        ),
                      ],
                    ),
                    Spacing.sp24,
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 200,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 120,
                        ),
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Container(
                              color: AriesColor.yellowP50,
                              padding: EdgeInsets.only(
                                right: 16,
                                left: 16,
                              ),
                              child: Center(
                                child: Text(
                                  'Tab 2 Content',
                                ),
                              ),
                            ),
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
