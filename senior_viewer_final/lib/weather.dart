import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:io';

class weather extends StatefulWidget {
  @override
  State createState() => _weatherStatefulWidget();
}

class _weatherStatefulWidget extends State<weather> {
  @override
  List weather = [];
  Future<String> getUrl() async{
    int hour = DateTime.now().hour;
    int minute = DateTime.now().second;
    int nowYearnum = new DateTime.now().year;
    int nowMonthnum = new DateTime.now().month;
    int nowDatenum = new DateTime.now().day;
                      // 1  2  3  4  5  6  7  8  9  10 11 12
    List<int> Month = [0,31,28,31,30,31,30,31,30,31,31,30,31];
    int k = 0;
    if(hour>=2&&hour<5){
      if(minute<=10) {
        nowDatenum--;
        if(nowDatenum==0){
          nowDatenum = Month[nowMonthnum--];
          if(nowMonthnum==0){
            nowYearnum--;
            nowMonthnum = 12;
            nowDatenum = 31;
          }
        }
        k = 7;
      }
      else k = 0;
    }
    else if(hour>=5&&hour<8){
      if(minute<=10) k = 0;
      else k = 1;
    }
    else if(hour>=8&&hour<11){
      if(minute<=10) k = 1;
      else k = 2;
    }
    else if(hour>=11&&hour<14){
      if(minute<=10) k = 2;
      else k = 3;
    }
    else if(hour>=14&&hour<17){
      if(minute<=10) k = 3;
      else k = 4;
    }
    else if(hour>=17&&hour<20){
      if(minute<=10) k = 4;
      else k = 5;
    }
    else if(hour>=20&&hour<23){
      if(minute<=10) k = 5;
      else k = 6;
    }
    else{
      if(minute<=10) k = 6;
      else k = 7;
    }
    String nowYear = nowYearnum.toString();
    String nowMonth = "";
    if(nowMonthnum<10) nowMonth+="0";
    nowMonth += nowMonthnum.toString();
    String nowDate = "";
    if(nowDatenum<10) nowDate += "0";
    nowDate += nowDatenum.toString();

    String now =  nowYear + nowMonth + nowDate;
    List<String> timelist = ['0200', '0500', '0800', '1100', '1400', '1700', '2000', '2300' ];
    String _serviceKey = 'mD9ZAU5KEnetwXC/rQ/B45VYMCn4nGCDe9ODAgYTncnrECrgjvE9zXsdfP1SbHy5ALCyQt6RN1FrStvAG27ixQ==';
    String time = timelist[k];
    String url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?'
        'serviceKey='
        +_serviceKey+
        '&pageNo=1&numOfRows=15&dataType=JSON&base_date='
        +now+
        '&base_time='+time+
        '&nx=98'
            '&ny=73';

    print(url);

    return url;

  }
  Future<List> getWeather(List data) async{
    List weatherlist = [];

    if(data.length==1){
      weatherlist.add({
        "title":Text ("오류",
            style: TextStyle(fontFamily: 'Gothic',fontSize: 20.0,color:Color.fromRGBO(84,55,41,1),fontWeight: FontWeight.bold)),
        "status":"다시 시도해 주세요",
        "iconname": Icon(Icons.error),
      });
    }
    else {
      var ptycategory = [' 비안옴', ' 비', ' 진눈깨비', ' 눈', ' 소나기'];

      for (int i = 0; i < 10; ++i) {
        var category = {
          "title": Text(""),
          "status": "",
          "iconname": Image.asset('images/sunny.png'),
        };
        if (data[i]["category"] == "POP") {
          category["title"] =  Text("비올 확률",
            style: TextStyle(fontFamily: 'Gothic', fontSize: 20.0,color: Color.fromRGBO(84,55,41,1), fontWeight: FontWeight.bold),);
          category["status"] = data[i]["fcstValue"].toString() + "%";
          category["iconname"] = Image.asset('images/rain2.png');
        }
        else if (data[i]["category"] == "SKY") {
          category["title"] = Text("현재 하늘은",
            style: TextStyle(fontSize: 20.0,color: Color.fromRGBO(84,55,41,1), fontWeight: FontWeight.bold),);;
          int status = int.parse(data[i]['fcstValue']);
          String sky = "";
          if (status < 6) {
            sky = " 맑음";
          } else if (status < 9) {
            sky = " 구름 많음";
          } else {
            sky = " 흐림";
          }
          category["status"] = sky;
          category["iconname"] = Image.asset('images/rain.png');
        }
        else if (data[i]["category"] == "REH") {
          category["title"] = Text("습도",
            style: TextStyle(fontSize: 20.0,color: Color.fromRGBO(84,55,41,1), fontWeight: FontWeight.bold),);;
          category["status"] = data[i]["fcstValue"].toString() + "%";
          category["iconname"] = Image.asset('images/humidity.png');
        }
        else if (data[i]["category"] == "T3H") {
          category["title"] = Text("온도",
            style: TextStyle(fontSize: 20.0,color: Color.fromRGBO(84,55,41,1), fontWeight: FontWeight.bold),);;
          category["status"] = data[i]["fcstValue"].toString() + "℃";
          category["iconname"] = Image.asset('images/temparature.png');
        }
        else if (data[i]["category"] == "PTY") {
          int status = int.parse(data[i]["fcstValue"]);
          category["title"] = Text("현재 상태",
            style: TextStyle(fontSize: 20.0,color: Color.fromRGBO(84,55,41,1), fontWeight: FontWeight.bold),);
          category["status"] = ptycategory[status];
        }
        else {
          continue;
        }
        weatherlist.add(category);

      }
    }
    print("index1: "+weatherlist[0].toString());
    return weatherlist;
  }
  Future<List> getData(String url) async {
    http.Response response = await http.get(
        url,
        headers: {"Accept":"application/json"});
    dynamic temp = jsonDecode(response.body);
    List data = [];
    if(temp["response"]["header"]["resultCode"]=="00")
      data = temp["response"]["body"]["items"]["item"];
    else
      data.add({"error":"error"});
    return data;
  }
  @override
  void initState(){
    super.initState();
    this.getUrl().then((url){
      this.getData(url).then((result){
        print(result);
        this.setState((){
          this.getWeather(result).then((weatherlist){
            this.weather = weatherlist;
          })
              .catchError((onError){
            print(onError);
          });
        });
      });
    });
  }

  Widget build(BuildContext context) {
    return  Container(
      child: new ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: weather == null ? 0 : weather.length,
          itemBuilder: (BuildContext context,int index){
            return new Container(
              color: index%2==1 ? Colors.greenAccent : Colors.amberAccent,
              child:ListTile(
                leading: Container(
                    width: 60.0,
                    height: 60.0,
                    child:weather[index]["iconname"]
                ),
                title: weather[index]["title"],
                subtitle: Text(weather[index]["status"]),
              ),
            );
          },
        ),
    );
  }
}
