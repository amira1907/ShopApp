import 'package:ShopApp/Lay_out/Cubit/cubit.dart';
import 'package:ShopApp/Lay_out/Cubit/states.dart';
import 'package:ShopApp/Shareing/Compounant/compunant.dart';
import 'package:ShopApp/models/DetielsModel.dart';
import 'package:ShopApp/moduls/CartScreen.dart';
import 'package:ShopApp/moduls/home_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = ShopCubit.get(context);

    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.orangeAccent,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: IconButton(

                   icon:Icon(
                    Icons.favorite_border,
                    // color: ShopCubit.get(context).favorites[cubit.]
                    // color: ShopCubit.get(context).favorites[cubit.productDetailsModel!.productData!.id]??
                    size: 36,
                  ),
                  onPressed:() {
                    ShopCubit.get(context).changFavorite(cubit.productDetailsModel!.productData!.id!);

                  },
                ),
              ),
            ],
          ),
          body: ConditionalBuilder(
            builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child:Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CarouselSlider.builder(
              itemCount: cubit.productDetailsModel?.productData?.images?.length,
                itemBuilder: (context, index, n) {
                  return Container(
                            width: MediaQuery.of(context).size.width,
                            child: CachedNetworkImage(
                              imageUrl: cubit.productDetailsModel!.productData!.images![index],
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                  color: Colors.orangeAccent,
                                  value: downloadProgress.progress,
                                  strokeWidth: 3,
                                ),
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                              ),
                            ),
                  );
                }, options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                cubit.onPageChange(index);

                              },
                              height: MediaQuery.of(context).size.height/2.5,
                              viewportFraction: 3,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlay: true,



              ),
              ),
                            CircleAvatar(
                              child:    IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  ShopCubit.get(context).changFavorite(cubit.productDetailsModel!.productData!.id!);
                                },
                                icon: CircleAvatar(
                                  backgroundColor: ShopCubit.get(context).favorites[cubit.productDetailsModel?.productData?.id]??  false ? Colors.purple:Colors.grey[300],
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
            ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '${cubit.productDetailsModel?.productData?.name?.toUpperCase()}',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Text(
                        '${cubit.productDetailsModel?.productData?.description}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black45
                        ),
                        // maxLines: 11,
                        // overflow: TextOverflow.ellipsis,

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(

                      children: [
                        Expanded(
                          child: Text(
                            '${cubit.productDetailsModel?.productData?.price} EGP',
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,

                              fontSize: 27
                            ),
                          ),
                        ),
                        // Spacer(),
                        Expanded(
                          child: Container(
                            // width: 13,

                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orangeAccent),
                              child: Text(
                                'Add To Chart',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              onPressed: () {
                                cubit.changCart(cubit.productDetailsModel!.productData!.id);
                                // navigateTo(context, CartScreen());
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],

              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator(
              color: Colors.orangeAccent,
            )),
            condition:
            // cubit.productDetailsModel?.productData?.image!=null&&
            // cubit.productDetailsModel?.productData?.price!=null&&
            // cubit.productDetailsModel?.productData?.description!=null&&
            state is ! ShopLoadingDetailsState,

            // state is ShopSuccessRemoveOrAddCartState,

          ),
        );
      },
    );
  }
}
