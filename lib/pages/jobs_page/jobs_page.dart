import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter_app/misc/bubble_indicator_painter.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/drawer_content.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/freelance_list.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/jobs_list.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

typedef PageChanged = Function(int index);

@RoutePage()
class JobsPage extends StatefulWidget {
  final int initialPage;

  const JobsPage({
    super.key,
    required this.initialPage,
  });

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  final PageController _pageController = PageController(initialPage: 0);
  bool isFreelance = false;
  final List<Widget> _pages = const [
    JobsList(),
    FreelanceList(),
  ];

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (widget.initialPage > 0 && widget.initialPage < _pages.length) {
          _pageController.jumpToPage(widget.initialPage);
        }
      },
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        endDrawer: const Drawer(
          child: DrawerContent(),
        ),
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () => context.router.pop(),
                icon: const FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  size: 24.0,
                ),
              ),
              expandedHeight: 100,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Offerte",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.primaryLight,
                      ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _SwitchButton(
                controller: _pageController,
                isFreelance: isFreelance,
              ),
            ),
          ],
          body: _PageViews(
            controller: _pageController,
            pages: _pages,
            onChangePage: (index) {
              setState(
                () {
                  if (index == 0) {
                    isFreelance = false;
                  } else if (index == 1) {
                    isFreelance = true;
                  }
                },
              );
            },
          ),
        ),
      );
}

class _SwitchButton extends StatelessWidget {
  final PageController controller;
  final bool isFreelance;

  const _SwitchButton({
    super.key,
    required this.controller,
    this.isFreelance = false,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryLight,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) => CustomPaint(
              painter: BubbleIndicatorPainter(
                pageController: controller,
                dxTarget: ((constraints.maxWidth / 2) - 21),
                dxEntry: 21,
                dy: ((constraints.minHeight) + 21),
                radius: 21,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          'Assunzioni',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: isFreelance
                                        ? AppColors.primaryLight
                                        : AppColors.white,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          'Freelance',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: isFreelance
                                        ? AppColors.white
                                        : AppColors.primaryLight,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _PageViews extends StatelessWidget {
  final PageController controller;
  final PageChanged onChangePage;
  final List<Widget> pages;

  const _PageViews({
    super.key,
    required this.controller,
    required this.onChangePage,
    required this.pages,
  });

  @override
  Widget build(BuildContext context) => PageView(
        onPageChanged: onChangePage,
        controller: controller,
        children: pages,
      );
}
