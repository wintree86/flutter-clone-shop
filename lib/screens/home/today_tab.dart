import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dating_app/models/product.dart';
import 'package:flutter_dating_app/widgets/simple_product.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

Product productBuilder(productId, shop, title, price, sale, sellingCount) {
  return new Product(
      productId: productId,
      shop: shop,
      title: title,
      price: price,
      sale: sale,
      sellingCount: sellingCount);
}

List<Product> products = [
  productBuilder(1, '레몬트리', '[원피스/4ps구성] 퍼펙트SET (5color)', 17500, 0.0, 2233),
  productBuilder(2, '레몬', '[원피스/4ps구성] 퍼펙트SET', 117500, 10.0, 33),
  productBuilder(3, '트리', '[원피스/4ps구성]', 1000, 0.0, 3),
  productBuilder(4, '몬트', '[원피스/4ps구성] 퍼펙트SET (5color)', 17500, 20.0, 0),
  productBuilder(5, '레몬트', '[원피스/4ps구성] 퍼펙트SET (5color)', 17500, 0.0, 233),
  productBuilder(6, '몬트리', '[원피스/4ps구성]', 50500, 17.0, 2233),
  productBuilder(7, '레트리', '[원피스/4ps구성] 퍼펙트SET (5color)', 30000, 16.0, 4533),
  productBuilder(8, '레몬리', '[원피스/4ps구성] 퍼펙트SET (5color)', 5000, 0.0, 12233),
  productBuilder(9, '레몬트', '[원피스/4ps구성] 퍼펙트SET (5color)', 17500, 0.0, 23233),
  productBuilder(10, '몬트리', '[원피스/4ps구성] 퍼펙트SET (5color)', 17500, 0.0, 2233),
  productBuilder(11, '레트리', '[원피스/4ps구성] 퍼펙트SET (5color)', 17500, 0.0, 2233),
  productBuilder(12, '레몬', '[원피스/4ps구성] 퍼펙트SET (5color)', 17500, 0.0, 2233),
  productBuilder(13, '트리', '[원피스/4ps구성] 퍼펙트SET (5color)', 17500, 0.0, 2233),
  productBuilder(14, '레리', '[원피스/4ps구성] 퍼펙트SET (5color)', 17500, 0.0, 2233),
  productBuilder(15, '레트리', '[원피스/4ps구성] 퍼펙트SET (5color)', 17500, 0.0, 2233),
  productBuilder(16, '레몬', '[원피스/4ps구성] 퍼펙트SET (5color)', 17500, 0.0, 2233),
];

class TodayTab extends StatefulWidget {
  @override
  _TodayTabState createState() => _TodayTabState();
}

class _TodayTabState extends State<TodayTab> {
  int _bannerIndex = 0;
  @override
  Widget build(BuildContext context) {
    int bannerImgLength = imgList.length;
    int bannerIndex = _bannerIndex + 1;

    return Builder(
      builder: (BuildContext context) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _bannerIndex = index;
                          });
                        }),
                    items: imgList
                        .map((item) => Container(
                              child: Image.network(item,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width),
                            ))
                        .toList(),
                  ),
                  Positioned(
                    top: 160,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                      child: Text('$bannerIndex / $bannerImgLength',
                          style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: EventPageButton(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '회원님을 위한 추천',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 0.55,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return SimpleProduct(
                      item: products[index],
                      index: index,
                    );
                  },
                  childCount: products.length,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class EventPageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          EventButton(
            btnIcon: Icon(Icons.dashboard, color: Colors.grey),
            btnTitle: '카테고리',
          ),
          VerticalDivider(width: 2, color: Colors.grey),
          EventButton(
            btnIcon: Icon(Icons.card_giftcard, color: Colors.grey),
            btnTitle: '쿠폰 / 이벤트',
          ),
        ],
      ),
    );
  }
}

class EventButton extends StatelessWidget {
  final Icon btnIcon;
  final String btnTitle;
  EventButton({this.btnIcon, this.btnTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        btnIcon,
        SizedBox(
          width: 10,
        ),
        Text(
          btnTitle,
          style: TextStyle(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
