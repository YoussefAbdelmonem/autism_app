import 'package:autism_project/shared/colors.dart';
import 'package:autism_project/shared/component.dart';

import 'package:flutter/material.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';


class CenterLayout extends StatefulWidget {

  List<Image> images = [
    Image.asset("assets/images/center 1.png"),
    Image.asset("assets/images/center 2.png"),
    Image.asset("assets/images/center 3.png"),
  ];

  @override
  State<CenterLayout> createState() => _CenterLayoutState();
}
var searchController=TextEditingController();
class _CenterLayoutState extends State<CenterLayout> {

  PageController pc;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // i did the search bar the ugly way
            // still we will modify it as we will make it actual search when we add the list of centers from API
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: defaultFormField(
                controller: searchController,

                type: TextInputType.text,

                validate: (String value) {
                  if (value.isEmpty) {
                    return 'search must not be empty';
                  }
                  return null;
                },
                label: 'Search',
                prefix: Icons.search,
              ),
            ),
            // here is the main container that will bd duplicated many times as the API tell us how many
            Container(
              height:MediaQuery.of(context).size.height/1.5,
              width: MediaQuery.of(context).size.width/1.5,
              color: Colors.black12,
              child:Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: Stack(

                      children: [
                        Image.asset("assets/images/Intersection 2 (1).png"),
                        Stack(

                          children: [

                            Positioned(

                              height: 200,
                              top: 0.5,
                              left: 10,

                              width: 220,



                              child: PageView(
                                scrollDirection: Axis.horizontal,

                                controller: pc,


                                children: [
                                  Image.asset('assets/images/center 1.png'),
                                  Image.asset('assets/images/center 2.png'),
                                  Image.asset('assets/images/center3.png'),



                                ],
                              ),

                            ),
                            /*
                              MaterialButton(onPressed: (){
                            pc.animateToPage(1, duration:const Duration(milliseconds: 400), curve:Curves.bounceIn );
                          },
                          child: const Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
                          )
                              */
                          ],
                        ),
                        Positioned(

                            width: 50,
                            height: 70,
                            top: 180,
                            left: 40,


                            child: Image.asset("assets/images/c3.png")),







                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text('Autismo',style: TextStyle(
                      color: ColorManager.blueFont,fontWeight: FontWeight.w500
                  ),),
                  const SizedBox(height: 20,),
                  //the information i leave it that way so when we apply the API we will know each one
                  const Text('Location',style: TextStyle(
                      color: ColorManager.blueFont,fontWeight: FontWeight.w500
                  ),),
                  const SizedBox(height: 20,),
                  const Text('Mobile Phone',style: TextStyle(
                      color: ColorManager.blueFont,fontWeight: FontWeight.w500
                  ),),
                  const SizedBox(height: 20,),
                  // the rating when we apply the stateManagement we will use we will save it in Share preference
                  SmoothStarRating(
                    rating: 0,
                    isReadOnly: false,
                    size: 30,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: true,
                    spacing: 2.0,

                  ),


                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
