import '../../utils/file_collection.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(46),
          child: HeaderWidget(
            text1: 'Notification',
            isCenterTitle: true,
            leading1: Icons.arrow_back,
          )),
      body: Container(
        decoration: AppUtils.decoration1(),
        height: double.infinity,
        width: double.infinity,
        child: const SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(children: [
                TextWidget(
                  text1: 'No Notification',
                  size1: 18.0,
                  fontWeight1: FontWeight.w400,
                )
              ]),
            ),
          ),
        )),
      ),
    );
  }
}
