import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart' as intl;

final eventProvider = StateProvider<bool>((ref) {
  return false;
});
final anniversaryProvider = StateProvider<bool>((ref) {
  return false;
});
final birthdayProvider = StateProvider<bool>((ref) {
  return false;
});
final deathProvider = StateProvider<bool>((ref) {
  return false;
});
final dateOfBirthProvider = StateProvider<bool>((ref) {
  return false;
});
final googleProvider = StateProvider<bool>((ref) {
  return false;
});
final wikiProvider = StateProvider<bool>((ref) {
  return false;
});
final myDateTimeProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

class whats_today extends ConsumerWidget  {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    initializeDateFormatting('ja');
    String now = intl.DateFormat.yMMMMEEEEd('ja').format(DateTime.now());
    String calcDaysOfNow(){
        final now = DateTime.now();
        DateTime later = DateTime(now.year+1);
        return later.difference(now).inDays.toString();
    }
    String percentageofsubDays(int sub){
      final now = DateTime.now();
      DateTime past = DateTime(now.year);
      DateTime later = DateTime(now.year+1);
      int percentage=(sub/later.difference(past).inDays*100).toInt();
      return percentage.toString();
    }
    final subDaysOfNow=calcDaysOfNow();
    final percentage=percentageofsubDays(int.parse(subDaysOfNow));
    final length = 351.4-(291.4*(1-int.parse(percentage)/100));
    final pickerdate = intl.DateFormat.yMMMd('ja').format(ref.watch(myDateTimeProvider.state).state);
    return Scaffold(
      appBar:AppBar(
        title: const Text("この日何の日??"),
      ),
      body: Center(
        child: ListView(children:[
          Container(
            color: Colors.lightBlue[200],
            height: 201,
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("$now\n今年はあと$subDaysOfNow日です",style: const TextStyle(fontSize:25,color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    const Divider(
                      height: 50,
                      thickness: 30,
                      indent: 60,
                      endIndent: 60,
                      color: Colors.blue,
                    ),
                    Divider(
                      height: 50,
                      thickness: 30,
                      indent: 60,
                      endIndent: length,
                      color: Colors.blue.shade900,
                    ),
                    Text("残り$percentage%",style: const TextStyle(fontSize:17,color: Colors.white,fontWeight: FontWeight.bold,height:1.0)),
                  ]
                ),
              ]
            )
          ),
        Container(
            color: Colors.purple[100],
            height: 201,
            padding: const EdgeInsets.only(left: 10,top: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("この日は何の日？？",style: TextStyle(fontSize:25,color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                TextButton.icon(
                  icon: const Icon(FontAwesomeIcons.calendarDays,
                      color: Colors.blue, size: 30.0),
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1900, 1, 1),
                        maxTime: DateTime(2049, 12, 31),
                        onConfirm: (date) {
                          ref.watch(myDateTimeProvider.state).state = date;
                        },
                        currentTime: ref.watch(myDateTimeProvider.state).state, locale: LocaleType.jp
                    );
                  },
                  label: Text(pickerdate,style: const TextStyle(fontSize:25)),
                ),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                            style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),primary: Colors.purple[800]),
                            onPressed: () {},
                            child: const Text('何の日か見る'),
                          )
                ),
              ]),
        ),
        Container(
            color: Colors.green[200],
            height: 201,
            padding: const EdgeInsets.only(left: 10,top: 10),
        )
        ]),
      ),
      endDrawer: Drawer(
          child: Center(
            child:
              ListView(children:[
                Container(
                  color: Colors.blue,
                  height: 100,
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: const Text("アイコン情報",style: TextStyle(fontSize:25,color: Colors.white)),
                ),
                SwitchListTile(
                    title: const Text("記念日",style:TextStyle(fontSize:15)),
                    value: ref.watch(anniversaryProvider.state).state,
                    onChanged: (bool e){
                      ref.watch(anniversaryProvider.state).state=e;
                    },
                    secondary: const Icon(FontAwesomeIcons.gift, color: Colors.teal)
               ),
                SwitchListTile(
                    title: const Text("イベント",style:TextStyle(fontSize:15)),
                    value: ref.watch(eventProvider.state).state,
                    onChanged: (bool e){
                      ref.watch(eventProvider.state).state=e;
                    },
                    secondary: const Icon(FontAwesomeIcons.circleInfo, color: Colors.blue)
                ),
                SwitchListTile(
                    title: const Text("誕生日",style:TextStyle(fontSize:15)),
                    value: ref.watch(birthdayProvider.state).state,
                    onChanged: (bool e){
                      ref.watch(birthdayProvider.state).state=e;
                    },
                    secondary: const Icon(FontAwesomeIcons.cakeCandles, color: Colors.pinkAccent)
                ),
                SwitchListTile(
                    title: const Text("忌日",style:TextStyle(fontSize:15)),
                    value: ref.watch(deathProvider.state).state,
                    onChanged: (bool e){
                      ref.watch(deathProvider.state).state=e;
                    },
                    secondary: const Icon(FontAwesomeIcons.bookBible, color: Colors.brown)
                ),
                SwitchListTile(
                    title: const Text("あなたの生まれた日",style:TextStyle(fontSize:15)),
                    value: ref.watch(dateOfBirthProvider.state).state,
                    onChanged: (bool e){
                      ref.watch(dateOfBirthProvider.state).state=e;
                    },
                    secondary: const Icon(FontAwesomeIcons.solidStar, color: Colors.orangeAccent)
                ),
                const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.grey,
                ),
                SwitchListTile(
                    title: const Text("Google検索",style:TextStyle(fontSize:15)),
                    value: ref.watch(googleProvider.state).state,
                    onChanged: (bool e){
                      ref.watch(googleProvider.state).state=e;
                    },
                    secondary: const Icon(FontAwesomeIcons.earthAsia, color: Colors.greenAccent)
                ),
                SwitchListTile(
                    title: const Text("Wikipedia検索",style:TextStyle(fontSize:15)),
                    value: ref.watch(wikiProvider.state).state,
                    onChanged: (bool e){
                      ref.watch(wikiProvider.state).state=e;
                    },
                    secondary: const Icon(FontAwesomeIcons.wikipediaW, color: Colors.yellow)
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ref.watch(eventProvider.state).state=false;
                      ref.watch(anniversaryProvider.state).state=false;
                      ref.watch(birthdayProvider.state).state=false;
                      ref.watch(deathProvider.state).state=false;
                      ref.watch(dateOfBirthProvider.state).state=false;
                      ref.watch(googleProvider.state).state=false;
                      ref.watch(wikiProvider.state).state=false;
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      elevation: 16,
                    ),
                    icon: const Icon(FontAwesomeIcons.arrowsRotate, color: Colors.white),
                    label: const Text('設定更新',style:TextStyle(color:Colors.white,fontSize:17)),

                  )
                )
              ])
          ))
    );
  }
}

