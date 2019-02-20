import "package:flutter/material.dart";
import 'package:testcoo_inspector/theme/style.dart';
import 'package:testcoo_inspector/components/Cards/orderChaseCard.dart';
import 'package:testcoo_inspector/data/rest_ds.dart';
import 'package:testcoo_inspector/models/order.dart';

class ChaseScreen extends StatefulWidget {
  const ChaseScreen({ Key key }) : super(key: key);

  @override
  ChaseScreenState createState() => new ChaseScreenState();
}

class ChaseScreenState extends State<ChaseScreen>{
  List<Order> items = [];
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false; // 是否有请求正在进行
  RestDatasource api = new RestDatasource();
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _getData();
      }
    });
    _getData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _getData() async {
    if (!isPerformingRequest) { // 判断是否有请求正在执行
      setState(() => isPerformingRequest = true);
      List<Order> data = await api.getPublicationOrders(_page);

      if (data.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom = _scrollController.position.maxScrollExtent - _scrollController.position.pixels;
        if (offsetFromBottom < edge) {
          _scrollController.animateTo(
              _scrollController.offset - (edge -offsetFromBottom),
              duration: new Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }
      } else {
        _page++;
      }

      setState(() {
        items.addAll(data);
        isPerformingRequest = false;
      });
    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color(0XFFF5F5F5),
      child: ListView.builder(
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == items.length) {
            return _buildProgressIndicator();
          } else {
            return (new OrderChaseCard(order: items.elementAt(index)));
          }
        },
        controller: _scrollController,
      ),
    );
  }
}