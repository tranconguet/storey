import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/Product.dart';
import 'package:store_app/size_config.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int imageSelected = 0;

  @override
  Widget build(BuildContext context) {
    print(widget.product.id);
    return SingleChildScrollView(
      child: Column(
        children: [
          imageSlide(),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  widget.product.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenHeight(24),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.product.price,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: getProportionateScreenHeight(20),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => Container(
                            margin: EdgeInsets.all(3),
                            child: SvgPicture.asset(
                              "assets/icons/Star Icon.svg",
                              color: Colors.blueGrey[200],
                              height: getProportionateScreenHeight(20),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 180,
                        ),
                        SvgPicture.asset(
                          "assets/icons/heart.svg",
                          color: widget.product.love
                              ? Colors.red
                              : Colors.blueGrey[200],
                          height: getProportionateScreenHeight(40),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  widget.product.description,
                  style: TextStyle(
                    color: kSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column imageSlide() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Image.asset(
            widget.product.images[imageSelected],
            height: SizeConfig.screenHeight * 0.25,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                widget.product.images.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      imageSelected = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: imageSelected == index
                            ? kPrimaryColor
                            : kSecondaryColor,
                      ),
                    ),
                    child: Image.asset(
                      widget.product.images[index],
                      height: getProportionateScreenHeight(80),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
