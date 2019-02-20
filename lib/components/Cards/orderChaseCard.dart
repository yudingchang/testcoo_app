import 'package:flutter/material.dart';
import 'package:testcoo_inspector/theme/style.dart';
import 'package:testcoo_inspector/models/order.dart';
import 'package:testcoo_inspector/components/Buttons/RoundedButton.dart';

class OrderChaseCard extends StatefulWidget {
  Order order;

  OrderChaseCard({
    this.order,
  });

  @override
  _OrderChaseCardState createState() => new _OrderChaseCardState();
}

class _OrderChaseCardState extends State<OrderChaseCard> {

  List<Widget> _buildreportLanguages() {
    List<Widget> widgets = [];
    widget.order.reportLanguages.forEach((Map item) {
      return widgets.add(new Container(
        padding: new EdgeInsets.only(right: 4.0),
        child: Text(item['language'] + '报告' + ' x ' +  item['count'], style: smallStyle,),
      ));
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return (new Container(
      decoration: new BoxDecoration(
          color: Color(0XFFFFFFFF),
          borderRadius: new BorderRadius.all(Radius.circular(8.0))
      ),
      padding:  new EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
      margin: new EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new LimitedBox(
                          maxWidth: _width / 1.8,
                          child: new Text(widget.order.address, style: normalStyle,),
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
                      new Container(
                        height: 18.0,
                        child: new Text('验货日期:', style: normalStyle,)
                      ),
                      new Container(
                        height: 18.0,
                        padding: new EdgeInsets.only(left: 5.0, bottom: 1),
                        child: new Align(
                          alignment: Alignment.bottomLeft,
                          child: new Text(widget.order.inspectionDates),
                        ),
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
                        child: new Text(widget.order.workload + '天', style: dangerStyle,),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          new Container(
            padding:  new EdgeInsets.symmetric(vertical: 8.0),
            child: new Column(
              children: <Widget>[
                new Container(
                  padding:  new EdgeInsets.symmetric(vertical: 4.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                        children: _buildreportLanguages(),
                      ),
                      new Row(
                        children: <Widget>[
                          widget.order.isMain ? new Container(
                              child: Text('主', style: whiteStyle,),
                              padding: new EdgeInsets.all(2.0),
                              decoration: new BoxDecoration(
                                  color: Color(0XFFEF3535),
                                  borderRadius: new BorderRadius.all(Radius.circular(3.0))
                              )
                          ) : new Container(
                              child: Text('辅', style: whiteStyle,),
                              padding: new EdgeInsets.all(2.0),
                              decoration: new BoxDecoration(
                                  color: Color(0XFF38B993),
                                  borderRadius: new BorderRadius.all(Radius.circular(3.0))
                              )
                          ),
                          new Padding(
                            padding: new EdgeInsets.only(left: 6.0),
                            child: Text('￥' + widget.order.commission, style: normingWarningStyle,),
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
        ],
      ),
    ));
  }
}
