import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:notes_two_app/logic/note_cubit.dart';
import 'package:notes_two_app/models/category_model.dart';
import 'package:notes_two_app/models/note_model.dart';
import 'package:notes_two_app/utils/app_style.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
   @override
  initState() {
   context.read<NoteCubit>().filterCategories(null);
  }

  
  int selectedTab = 0;
  int selectedCategory = 0;

  List<DateTime> dates = List.generate(10, (index) {
    return DateTime.now().add(Duration(days: index));
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
         if (state is FilterCategoriesFalier) {
       Center(child: Text(state.massageError));
      }else if (state is FilterCategoriesLoading) {
      Center(child:CircularProgressIndicator());
      } else   if (state is FilterCategoriesSuccess) {
        List<NoteModel>listNote=state.notes;
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 91,
          child: ListView.builder(
            itemCount: dates.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  selectedTab = index;
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 91,
                    width: 51,
                    decoration: BoxDecoration(
                        color: index == selectedTab
                            ? Colors.black
                            : Colors.white,
                        border: Border.all(
                            color: const Color(0xffE6E6E6), width: 1),
                        borderRadius: BorderRadius.circular(18)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${DateFormat('E').format(dates[index])}",
                            style: AppStyle.regular12.copyWith(
                                color: index == selectedTab
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          Text(
                            "${DateFormat('d').format(dates[index])}",
                            style: AppStyle.bold24.copyWith(
                                color: index == selectedTab
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          Text(
                            "${DateFormat('MMM').format(dates[index])}",
                            style: AppStyle.regular12.copyWith(
                                color: index == selectedTab
                                    ? Colors.white
                                    : Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      const SizedBox(
        height: 24,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SizedBox(
          height: 27,
          child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 27,
                    decoration: BoxDecoration(
                        color: index == selectedCategory
                            ? Colors.black
                            : Colors.white,
                        border:
                            Border.all(color: const Color(0xffE2E2E2)),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        )),
                    child: GestureDetector(
                        onTap: () {
                          selectedCategory = index;
                         
                          if (categories[index].name=='All') {
                             context.read<NoteCubit>().filterCategories('All');
                          }else{
                             context.read<NoteCubit>().filterCategories(categories[index].name);
                          }
                          setState(() {});
                        },
                        child: Center(
                          child: Text(
                            "${categories[index].name}",
                            style: index == selectedCategory
                                ? AppStyle.bold14.copyWith(
                                    color: Colors.white, fontSize: 12)
                                : AppStyle.regular12.copyWith(
                                    color: const Color(0xff7C7C7C),
                                    fontSize: 12),
                          ),
                        )),
                  ),
                );
              }),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 24, left: 14, right: 14),
        child: MasonryGridView.builder(
            itemCount: listNote.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 6, bottom: 20, left: 6),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colors[index % colors.length],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xffE6E6E6),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "${listNote[index].noteType}",
                        style:
                            AppStyle.bold14.copyWith(color: Colors.black),
                      ),
                    const  SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${listNote[index].content}",
                        style: AppStyle.regular12
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              );
            }),
      )
    ],
  );
}     return Text("oops was an error");
      
   } );

  }
}

List<String> notes = [
  'Review of Previous Action Items\nProduct Development Update\nUser Feedback and Customer Insights\nCompetitive Analysis\nRoadmap Discussion ',
  'Reply to emails\nPrepare presentation slides for the marketing meeting\nConduct research on competitor products\nSchedule and plan customer interviews\nTake a break and recharge ',
  'Rice\nPasta\nCereal',
  'Share insights and findings from recent competitive analysis.',
  'Brainstorm new feature ideas for the mobile app\nDiscuss potential partnerships with industry leaders\nAnalyze recent customer survey results\nUpdate the product backlog\nPlan for next sprint ',
  'Workout session\nRead a chapter of a book\nPractice mindfulness for 10 minutes\nPlan meals for the week\nOrganize workspace ',
  'Buy groceries for the week\nPick up dry cleaning\nSchedule dentist appointment\nCall parents and check in\nWater the plants ',
];
List<Color> colors = const [
  Color(0xffD9E8FC),
  Color(0xffFFD8F4),
  Color(0xffFDE99D),
  Color(0xffB0E9CA),
  Color(0xffFFEADD),
];
