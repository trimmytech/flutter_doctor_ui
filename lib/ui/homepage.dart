import 'package:flutter/material.dart';
import 'package:flutter_docker/components/components.dart';
import 'package:flutter_docker/helper.dart';
import 'package:flutter_docker/widgets/listview_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../models/doctor.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavBar(),
              SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.headline1,
                    children: [
                      TextSpan(text: "Find"),
                      TextSpan(
                        text: " your doctor",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: kGreyColor900),
                      )
                    ]),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.only(
                    right: 8, left: 16, bottom: 5, top: 6),
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kGreyColor500),
                child: TextField(
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: kBlackColor900),
                  cursorHeight: 24,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.search,
                        color: kBlackColor900,
                      ),
                      suffixIconConstraints: BoxConstraints(
                        maxHeight: 24,
                      ),
                      hintText: "Search doctors, medicine etc ..",
                      hintStyle: Theme.of(context).textTheme.headline5,
                      contentPadding: EdgeInsets.only(bottom: 5),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: doctorMenu.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10),
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext contex, index) {
                    return GestureDetector(
                      onTap: () {
                        print("item ${index} clicked !!");
                      },
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: 85,
                        ),
                        child: Column(
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                  minHeight: 56,
                                  minWidth: 56,
                                  maxWidth: 69,
                                  maxHeight: 69),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: Svg("assets/svg/${doctorMenu[index].image}"),
                                fit: BoxFit.cover
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Expanded(
                                child: Text(doctorMenu[index].name, style: Theme.of(context).textTheme.headline6,) )
                          ],
                        ),
                      ),
                    );
                  }),
              SizedBox( height: 24,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top Doctor", style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: kBlackColor800, fontSize: 18
                  ),),
                  GestureDetector(
                    onTap: () {

                    },
                    child: Text("View all", style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Color(0xff4485FD), fontSize: 11, height: 1.2
                    ),),
                  )
                ],
              ),
              SizedBox( height: 24,),
              ListView.builder(
                  itemCount: topDoctors.length,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    //
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    constraints: BoxConstraints(
                        maxHeight: 80
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 88,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xffEAEAEA),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/${topDoctors[index].doctorPicture}")
                              )
                          ),
                        ),
                        Flexible(
                          child: Hero(
                            tag: topDoctors[index].doctorName,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(topDoctors[index].doctorName, style: Theme.of(context).textTheme.headline2!.copyWith(
                                    color: Color(0xff404345), fontSize: 16
                                  ),),
                                  Text("${topDoctors[index].doctorSpecialty} • ${topDoctors[index].doctorHospital}", style: Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Color(0xffAAAAAA), fontSize: 14
                                  ),),


                                  const Spacer(),

                                  SizedBox(
                                    width: MediaQuery.of(context).size.width - 136,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            RatingBar.builder(
                                              itemSize: 16,
                                              initialRating: double.parse(
                                                topDoctors[index].doctorRating,
                                              ),
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.zero,
                                              itemBuilder: (context, _) => const Icon(
                                                Icons.star,
                                                color: kYellowColor,
                                              ),
                                              onRatingUpdate: (rating) {
                                                debugPrint(rating.toString());
                                              },
                                              unratedColor: kGreyColor600,
                                            ),
                                            Text("(${topDoctors[index].doctorNumberOfPatient})", style: Theme.of(context).textTheme.headline6!.copyWith(
                                                color: Color(0xffAAAAAA), fontSize: 14
                                            ),),


                                          ],
                                        ),
                                        Container(
                                          height: 24,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 13,
                                            vertical: 3,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            color: topDoctors[index].doctorIsOpen
                                                ? kGreenLightColor
                                                : kRedLightColor,
                                          ),
                                          child: Text(
                                            topDoctors[index].doctorIsOpen ? 'Open' : 'Close',
                                            style:
                                            Theme.of(context).textTheme.headline6!.copyWith(
                                              color: topDoctors[index].doctorIsOpen
                                                  ? kGreenColor
                                                  : kRedColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                );
              })
            ],
          ),
        ),
      ),
    ));
  }
}
