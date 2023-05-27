import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwise/provider/search_course_notifier.dart';
import 'package:qwise/utils/file_collection.dart';

class CourseSearchScreen extends StatefulWidget {
  const CourseSearchScreen({super.key});

  @override
  State<CourseSearchScreen> createState() => _CourseSearchScreenState();
}

class _CourseSearchScreenState extends State<CourseSearchScreen> {
  String? searchKey;
  Stream? streamQuery;
  final firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: HeaderWidget(
          text1: 'Search',
          leading1: Icons.arrow_back,
          isCenterTitle: true,
        ),
      ),
      body: Container(
        decoration: AppUtils.decoration1(),
        height: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child:
                Consumer<SearchCourseNotifier>(builder: (context, ref, child) {
              return StreamBuilder(
                stream: FirebaseFirestore.instance
                .collection('course')
                .doc('course_id')
                .snapshots(),
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 50.0),
                    child: SizedBox(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          onChanged: (value) async {
                            setState(() {
                              searchKey = value;
                              streamQuery = firestore
                                  .collection('course')
                                  .orderBy("course_id")
                                  .where('course_name',
                                      isGreaterThanOrEqualTo: searchKey)
                                  .where('course_name',
                                      isLessThanOrEqualTo: searchKey)
                                  .startAt([searchKey]).endAt(
                                      ['${searchKey ?? ''}\uf8ff']).snapshots();

                              log(streamQuery.toString(), name: 'streamQuery');
                            });
                          },
                          controller: ref.searchController,
                          focusNode: ref.searchFocusNode,
                          decoration: InputDecoration(
                              hintText: 'Search Course',
                              isDense: true,
                              prefixIcon: const Icon(
                                Icons.search,
                                size: 20,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  ref.searchController.text = "";
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 20,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.black)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.black))),
                        ),
                      ),
                    ),
                  );
                }
              );
            }),
          ),
        ),
      ),
    );
  }
}
