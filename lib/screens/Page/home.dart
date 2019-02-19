import "package:flutter/material.dart";
import 'package:testcoo_inspector/theme/style.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:testcoo_inspector/components/Buttons/textButton.dart';
import 'package:testcoo_inspector/components/Buttons/RoundedButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key key }) : super(key: key);

  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  List<Image> images = [];

  HomeScreenState() {
    images.add(new Image.network(
      "https://testcoo.oss-cn-hangzhou.aliyuncs.com/resources/pT9XTGtbeVkx3E62vSdXsBgkIDKDsunc9EYUMuPo.jpeg",
      fit: BoxFit.fill,
    ));
    images.add(new Image.network(
      "https://testcoo.oss-cn-hangzhou.aliyuncs.com/resources/A5M1omMl9Dwjl9xANChjhLBUB1vgqjx62IhkaA6T.jpeg",
      fit: BoxFit.fill,
    ));
    images.add(new Image.network(
      "https://testcoo.oss-cn-hangzhou.aliyuncs.com/resources/Yhcs17M3KMwDoDnANFVx4Ofl0rmAgMcDfyqDVoSr.jpeg",
      fit: BoxFit.fill,
    ));
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.width / 2;

    // TODO: implement build
    return SingleChildScrollView(
      child: new Column(
        children: [
          new Container(
              color: Colors.white,
              width: _width,
              height: _height,
              child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return images[index];
                },
                itemCount: images.length,
                itemWidth: _width,
                itemHeight: _height,
                autoplay: true,
                layout: SwiperLayout.STACK,
                pagination: new SwiperPagination(alignment: Alignment.bottomRight),
              )
          ),
          new Container(
            color: Color(0XFFFFFFFF),
            padding:  new EdgeInsets.symmetric(horizontal: 0.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding:  new EdgeInsets.symmetric(vertical: 11.0, horizontal: 12.0),
                  decoration: new BoxDecoration(border: Border(bottom: BorderSide(color: Color(0XFFE6E6E6), width: 0.5, ))),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        child: new Text('待抢订单', style: titleStyle),
                      ),
                      new Container(
                        child: new Row(
                          children: <Widget>[
                            new Text('更多', style: titleSecondaryStyle),
                            new Icon(Icons.chevron_right, size: 22.0, color: Color(0XFFBFBFBF),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                new Container(
                  padding:  new EdgeInsets.symmetric(horizontal: 12.0),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        padding:  new EdgeInsets.symmetric(vertical: 8.0),
                        decoration: new BoxDecoration(border: Border(bottom: BorderSide(color: Color(0XFFE6E6E6), width: 0.5, ))),
                        child: new Column(
                          children: <Widget>[
                            new Container(
                                padding:  new EdgeInsets.symmetric(vertical: 4.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Container(
                                      child: new Text('上海市', style: normalStyle,),
                                    ),
                                    new Container(
                                      child: new Text('215.3公里', style: smallStyle,),
                                    )
                                  ],
                                )
                            ),
                            new Container(
                              padding:  new EdgeInsets.symmetric(vertical: 4.0),
                              child: new Row(
                                children: <Widget>[
                                  new Text('验货日期: 5.21 - 5.23', style: normalStyle,)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        padding:  new EdgeInsets.symmetric(vertical: 8.0),
                        decoration: new BoxDecoration(border: Border(bottom: BorderSide(color: Color(0XFFE6E6E6), width: 0.5, ))),
                        child: new Column(
                          children: <Widget>[
                            new Container(
                                padding:  new EdgeInsets.symmetric(vertical: 4.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Container(
                                      child: new Text('二级分类', style: smallStyle,),
                                    ),
                                  ],
                                )
                            ),
                            new Container(
                              padding:  new EdgeInsets.symmetric(vertical: 4.0),
                              child: new Row(
                                children: <Widget>[
                                  new Text('工作量', style: smallStyle,),
                                  new Padding(
                                    padding: new EdgeInsets.only(left: 6.0),
                                    child: new Text('2天', style: dangerStyle,),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        padding:  new EdgeInsets.symmetric(vertical: 8.0),
                        decoration: new BoxDecoration(border: Border(bottom: BorderSide(color: Color(0XFFE6E6E6), width: 0.5, ))),
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              padding:  new EdgeInsets.symmetric(vertical: 4.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      Text('中文报告x3', style: smallStyle,),
                                      Text('(线上)', style: smallStyle,),
                                    ],
                                  ),
                                  new Row(
                                    children: <Widget>[
                                      new Container(
                                        child: Text('主', style: whiteStyle,),
                                        padding: new EdgeInsets.all(2.0),
                                        decoration: new BoxDecoration(
                                          color: Color(0XFFEF3535),
                                          borderRadius: new BorderRadius.all(Radius.circular(3.0))
                                        )
                                      ),
                                      new Padding(
                                        padding: new EdgeInsets.only(left: 2.0),
                                        child: Text('￥900.00', style: normingWarningStyle,),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            new Container(
                              padding: new EdgeInsets.only(top: 10.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  new RoundedButton(
                                      buttonName: "查看产品",
                                      onTap: () => {},
                                      width: 88.0,
                                      height: 28.0,
                                      textStyle: warningStyle,
                                      borderColor: const Color(0XFFFFA800),
                                      bottomMargin: 5.0,
                                      borderWidth: 1.0),
                                  new RoundedButton(
                                      buttonName: "抢单",
                                      onTap: () => {},
                                      width: 88.0,
                                      height: 28.0,
                                      textStyle: warningStyle,
                                      borderColor: const Color(0XFFFFA800),
                                      bottomMargin: 5.0,
                                      leftMargin: 10.0,
                                      borderWidth: 1.0)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        padding:  new EdgeInsets.symmetric(vertical: 4.0),
                        child: new TextButton(
                            buttonName: "查看抢单资格",
                            onPressed: () => () => {},
                            buttonTextStyle: warningButtonTextStyle),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}