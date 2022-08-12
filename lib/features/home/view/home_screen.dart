import 'package:atik/constants/contants.dart';
import 'package:atik/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    //final homeCubit = context.watch<HomeCubit>().state;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: IconButton(
                  color: Colors.amber,
                  icon: Image.asset("assets/cancel.png", fit: BoxFit.cover),
                  onPressed: () {
                    
                  },
                ),
              ),
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0.1,
          centerTitle: true,
          title: Builder(
            builder: (context) {
              return Text(context.watch<HomeCubit>().state.baseMunicipalityModel!.municipalityName);
            }
          ),
          // leading: Center(
          //   child:Image.network('${Constants.getBaseUrl()}/${homeCubit.baseMunicipalityModel?.image}')
          // ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // SizedBox(
              //     height: h * 0.17,
              //     child: Image.network('${Constants.getBaseUrl()}/${homeCubit.baseMunicipalityModel?.cardImage}')),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          PermissionStatus cameraStatus =
                              await Permission.camera.request();
                          if (cameraStatus == PermissionStatus.granted) {
                            
                          }
                          if (cameraStatus == PermissionStatus.denied) {
                            print("hata");
                          }
                          if (cameraStatus ==
                              PermissionStatus.permanentlyDenied) {
                            openAppSettings();
                          }
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Constants.greens, Constants.greens2],
                              ),
                            ),
                            width: w * 0.36,
                            height: h * 0.38,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/qr.png",
                                  color: Colors.white,
                                  scale: 4,
                                ),
                                Text(
                                  "Qr Oku",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: w * 0.045,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )),
                      ),
                      SizedBox(
                        width: w * 0.04,
                      ),
                      InkWell(
                        onTap: () {
                         
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Constants.greens, Constants.greens2],
                              ),
                            ),
                            width: w * 0.36,
                            height: h * 0.38,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/barcode.png",
                                  color: Colors.white,
                                  scale: 4.5,
                                ),
                                Text(
                                  "Kodu Giriniz",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:w * 0.045,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.orange,
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.orange.shade400,
                            Colors.orange.shade700
                          ],
                        ),
                      ),
                      height: h * 0.1,
                      width: w * 0.45,
                      child: MaterialButton(
                          onPressed: () {
                           
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                Icons.align_horizontal_left_sharp,
                                color: Colors.white,
                                size: 24,
                              ),
                              Text(
                                "Raporlar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: w * 0.05),
                              )
                            ],
                          ))),
                ],
              ),
              SizedBox(
                  height: h * 0.2,
                  child: Image.asset(
                    "assets/atik_hesapla.png",
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
