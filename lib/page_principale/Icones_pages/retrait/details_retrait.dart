import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiso_cash/page_principale/Nav_Bar_composants/Nav_Bar.dart';

class Details_Retrait extends StatefulWidget {
  const Details_Retrait({super.key});

  @override
  State<Details_Retrait> createState() => _Details_RetraitState();
}

class _Details_RetraitState extends State<Details_Retrait> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Détails du retrait',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.offAll(() => const acceuil());
            },
            icon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.cancel, size: 40,),
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                      
                  //details sur le code de retrait
                  Container(
                    height: screen_height*.4,
                    width: screen_width * .90,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(.05),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Détails sur le code de retrait',
                            style:
                                TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor,
                                  ),
                          ),
                      
                          //sizedbox
                          const SizedBox(
                            height: 5,
                          ),
                      
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Numéro de code de retrait',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                              ),
                              Text('673 8747',
                              style: TextStyle(color: Colors.black, fontSize: 12),)
                            ],
                          ),
                      
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Montant',
                              style: TextStyle(color: Colors.black, fontSize: 12),), 
                              Text('XAF XXXXXX',
                              style: TextStyle(color: Colors.black, fontSize: 12),)],
                          ),
                      
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Montant facturé',
                              style: TextStyle(color: Colors.black, fontSize: 12),), 
                              Text('XAF XXXXXX',
                              style: TextStyle(color: Colors.black, fontSize: 12),)],
                          ),
                      
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Montant débité',
                              style: TextStyle(color: Colors.black, fontSize: 12),), 
                              Text('XAF XXXXXX',
                              style: TextStyle(color: Colors.black, fontSize: 12),)],
                          ),
                      
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Généré le',
                              style: TextStyle(color: Colors.black, fontSize: 12),), 
                              Text('23/12/2022',
                              style: TextStyle(color: Colors.black, fontSize: 12),)],
                          ),
                      
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Expire dans',
                              style: TextStyle(color: Colors.black, fontSize: 12),), 
                              Text('11h 22min',
                              style: TextStyle(color: Colors.black, fontSize: 12),)],
                          ),
                      
                          TextButton(
                            onPressed: (){}, 
                            child: Text(
                            'Partager le code retrait',
                            style:
                                TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Theme.of(context).primaryColor.withOpacity(.5),
                                  ),
                          ),
                            )
                        ],
                      ),
                    ),
                  ),
                      
                  //sizedbox
                  const SizedBox(
                    height: 15,
                  ),
                  
                  //comment optenir le montant ??
                  Container(
                    height: screen_height*.45,
                    width: screen_width * .90,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(.05),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Comment optenir le montant ?',
                              style:
                                  TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Theme.of(context).primaryColor,
                                    ),
                            ),
                        
                            //sizedbox
                            const SizedBox(
                              height: 5,
                            ),
                        
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                child: const Text('1', style: TextStyle(fontSize: 25, color: Colors.white),),
                              ),
                              title: const Text('Allez sur guichet SOWITEL GAB',
                                style: TextStyle(color: Colors.black, fontSize: 16),),
                            ),
                                
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                child: const Text('2', style: TextStyle(fontSize: 25, color: Colors.white),),
                              ),
                              title: const Text('Sélectionner l\'option WisoCash et suivez les indications pour retirer votre argent',
                                style: TextStyle(color: Colors.black, fontSize: 16),),
                            ),
                                
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                child: const Text('3', style: TextStyle(fontSize: 25, color: Colors.white),),
                              ),
                              title: const Text('Dans l\'agence WisoCash, présenter le code de retrait en plus du numéro de l\'émétteur du retrait',
                                style: TextStyle(color: Colors.black, fontSize: 16),),
                            ),
                        
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
