import "package:flutter/material.dart";
import 'package:testcoo_inspector/theme/style.dart';
export 'package:flutter/painting.dart' show
  AssetImage,
  NetworkImage;

class MyScreen extends StatefulWidget {
  const MyScreen({ Key key }) : super(key: key);

  @override
  MyScreenState createState() => new MyScreenState();
}

class MyScreenState extends State<MyScreen>{
  List<Image> images = [];
  BuildContext context;

  _onPressed() {
//    Navigator.pushNamed(context, "DataAuthentication");
    Navigator.of(context).pushNamed("/DataAuthentication");
  }

  @override
  Widget build(BuildContext context) {

    this.context = context;
    double _width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Container(
      child: new Column(
        children: [
          new Container(
            width: _width,
            padding:  new EdgeInsets.symmetric(horizontal: 12.0, vertical: 50.0),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/my-screen-background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new AssetImage("assets/default-avatar.png"),
                        )
                      )),
                    new Container(
                      padding:  new EdgeInsets.only(left: 10.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.only(bottom: 5.0),
                            child: new Text('我的名字', style: largeWhiteStyle,),),
                          new Row(children: <Widget>[
                            new Icon(Icons.stay_primary_portrait, size: 16.0, color: Color(0XFFFFFFFF),),
                            new Text('15168224485', style: whiteStyle,),
                          ],)
                        ],),
                    )
                  ],
                ),
                new Container(
                  child: new Icon(Icons.arrow_forward_ios, size: 20.0, color: Color(0XFFFFFFFF),),
                )
              ],
            ),
          ),
          new Container(
            child: new Expanded(
              child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  new Container(
                    decoration: new BoxDecoration(
                      color: const Color(0XFFFFFFFF),
                    ),
                    child: new Container(
                      margin: new EdgeInsets.only(left: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(bottom: new BorderSide(color: const Color(0XFFE6E6E6)))
                      ),

                      child: ListTile(
                        title: new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Icon(Icons.print, color: Color(0XFF666666),),
                            new Padding(
                              padding: new EdgeInsets.only(left: 10.0),
                              child: new Text('专业资料认证'),
                            ),
                          ],
                        ),
                        onTap: _onPressed,
                        trailing: new Container(
                          width: 120.0,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Padding(padding: new EdgeInsets.only(right: 3.0), child: Text('未提交', style: normalSubStyle,),),
                              Icon(Icons.arrow_forward_ios, size: 16.0,)
                            ],


                          ),
                        )
                      ),
                    ),
                  ),
                  new Container(
                    decoration: new BoxDecoration(
                      color: const Color(0XFFFFFFFF),
                      border: new Border(bottom: new BorderSide(width: 11.0, color: const Color(0XFFF5F5F5)))
                    ),
                    child: new Container(
                      margin: new EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Icon(Icons.print, color: Color(0XFF666666),),
                            new Padding(
                              padding: new EdgeInsets.only(left: 10.0),
                              child: new Text('抢单资格'),
                            ),
                          ],
                        ),
                        trailing: new Container(
                          width: 120.0,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                          new Padding(padding: new EdgeInsets.only(right: 3.0), child: Text('查看', style: normalSubStyle,)

                          ),
                              Icon(Icons.arrow_forward_ios, size: 16.0,),

                            ],
                          ),

//                          onPressed: () {
//                            Navigator.of(context).pushNamed("DataAuthentication");
//                          },
                        )
                      ),
                    ),
                  ),
                  new Container(
                    decoration: new BoxDecoration(
                      color: const Color(0XFFFFFFFF),
                    ),
                    child: new Container(
                      margin: new EdgeInsets.only(left: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(bottom: new BorderSide(color: const Color(0XFFE6E6E6)))
                      ),
                      child: ListTile(
                        title: new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Icon(Icons.print, color: Color(0XFF666666),),
                            new Padding(
                              padding: new EdgeInsets.only(left: 10.0),
                              child: new Text('钱包'),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Padding(padding: new EdgeInsets.only(right: 3.0), child: Text('余额 ￥9999.00', style: normalSubStyle,),),
                            Icon(Icons.arrow_forward_ios, size: 16.0,),
                          ],
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    decoration: new BoxDecoration(
                      color: const Color(0XFFFFFFFF),
                      border: new Border(bottom: new BorderSide(width: 11.0, color: const Color(0XFFF5F5F5)))
                    ),
                    child: new Container(
                      margin: new EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Icon(Icons.print, color: Color(0XFF666666),),
                            new Padding(
                              padding: new EdgeInsets.only(left: 10.0),
                              child: new Text('数据统计'),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.arrow_forward_ios, size: 16.0,),
                          ],
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    decoration: new BoxDecoration(
                      color: const Color(0XFFFFFFFF),
                    ),
                    child: new Container(
                      margin: new EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Icon(Icons.print, color: Color(0XFF666666),),
                            new Padding(
                              padding: new EdgeInsets.only(left: 10.0),
                              child: new Text('设置'),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.arrow_forward_ios, size: 16.0,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}