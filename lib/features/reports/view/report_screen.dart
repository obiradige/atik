import 'package:atik/constants/contants.dart';
import 'package:atik/features/reports/cubit/report_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reportCubitRead = context.read<ReportCubit>();
    final reportCubitState = context.watch<ReportCubit>();
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar : AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Constants.greens,size: 30),onPressed: (){
          Navigator.of(context).pop();
        },),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(onPressed: () {
                // ignore: use_build_context_synchronously
                DatePicker.showDatePicker(
                  context,
                  minTime: DateTime(2022),
                  maxTime: DateTime(2100),
                  currentTime: reportCubitState.state.selectedDateTime ??
                      DateTime.now(),
                  onChanged: (date) {},
                  onConfirm: (date) {
                    reportCubitRead.onDateChange(date: date);
                  },
                locale: LocaleType.tr
                );
          }, icon:  Icon(Icons.calendar_month,color: Constants.greens,size: 30,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            if (context.watch<ReportCubit>().state.reportPageStateStatus ==
                ReportPageStateStatus.loading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                itemCount: reportCubitState.state.orders?.length ?? 0,
                itemBuilder: (context, index) {
                  final order =
                      reportCubitState.state.orders!.elementAt(index);
                  return Card(
                    child: ListTile(
                      title: Text(
                          "${order.customerInfo.name[0]}****** ${order.customerInfo.surname[0]}******"),
                      subtitle: Text('${order.price} ₺'),
                      onTap: (){
                     
                
                showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Detaylar'),
                            content: SizedBox(
                              width: w * 0.9, 
                              height: MediaQuery.of(context).size.height/2.5,//  <------- Use SizedBox to limit width
                              child: SingleChildScrollView(
                                physics: const ClampingScrollPhysics(),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children:  [
                                          Text("Ürün İsmi",style: TextStyle(fontSize: w * 0.030),),
                                          Text("Ürün Ağırlık",style: TextStyle(fontSize: w * 0.030),),
                                          Text("Toplam Fiyat",style: TextStyle(fontSize: w * 0.030),)
                                      ],
                                    ),
                                    const SizedBox(height: 20,),
                                    ListView.builder(
                                      shrinkWrap:
                                          true, //            <------  USE SHRINK WRAP
                                      itemCount: order.products.length,
                                      itemBuilder: (context, index) => Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left :20.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: w * 0.15,
                                                  child: Text(order.products[index].productName,style:  TextStyle(fontSize: w * 0.03,fontWeight: FontWeight.bold),)),
                                                SizedBox(width: w * 0.15,child: Text(order.products[index].productField.toString())),
                                                SizedBox(width: w * 0.15,child: Text('${order.products[index].productPrice}₺')),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 20,)
                                        ],
                                      )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}