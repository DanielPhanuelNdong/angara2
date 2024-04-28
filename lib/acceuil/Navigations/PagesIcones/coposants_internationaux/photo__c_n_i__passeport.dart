import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Photo_CNI_Passeport extends StatefulWidget {
  const Photo_CNI_Passeport({super.key});

  @override
  State<Photo_CNI_Passeport> createState() => _Photo_CNI_PasseportState();
}

class _Photo_CNI_PasseportState extends State<Photo_CNI_Passeport> {
  File? select_Image;
  File? select_Image2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transferts Internationaux',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //sizebox
              const SizedBox(
                height: 30,
              ),
        
              //texte
              const Text(
                textAlign: TextAlign.center,
                'vueillez importer la photo des deux faces CNI ou Passeport du bénéficiaire',
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 69, 69, 69),
                    fontWeight: FontWeight.w400),
              ),
        
              //sizedbox
              const SizedBox(
                height: 10,
              ),
        
              //cliques pour telecharger image 1
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: (){
                        telecharge_images();
                      },
                      child: Text(
                        'Cliquer ici pour importer',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      )),
                  TextButton(
                      onPressed: (){
                        filmer_images();
                      },
                      child: Text(
                        'Cliquer ici pour filmer',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      )),
                ],
              ),
        
              //sizedbox
              const SizedBox(
                height: 30,
              ),
        
              //image face 1
              Container(
                height: 150,
                width: 250,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 253, 236, 236)),
                child: select_Image != null ? Image.file(select_Image!) : const Text(
                  textAlign: TextAlign.center,
                  'image de face',
                  style: TextStyle(color: Color.fromARGB(255, 186, 185, 185)),
                ),
              ),
        
              //sizedbox
              const SizedBox(
                height: 40,
              ),
        
              //cliques pour telecharger image 2
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: (){
                        telecharge_images2();
                      },
                      child: Text(
                        'Cliquer ici pour importer',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      )),
                  TextButton(
                      onPressed: (){
                        filmer_images2();
                      },
                      child: Text(
                        'Cliquer ici pour filmer',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      )),
                ],
              ),
        
              //sizedbox
              const SizedBox(
                height: 40,
              ),
        
              //image face 2
              Container(
                height: 150,
                width: 250,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 253, 236, 236)),
                child: select_Image2 != null ? Image.file(select_Image2!) : const Text(
                  textAlign: TextAlign.center,
                  'image côté arrière',
                  style: TextStyle(color: Color.fromARGB(255, 186, 185, 185)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future telecharge_images() async {
    final return_gallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);

        setState(() {
          if (return_gallery != null){
            select_Image = File(return_gallery.path );
          }
          
        });
  }

  // ignore: non_constant_identifier_names
  Future filmer_images() async {
    final return_camera =
        await ImagePicker().pickImage(source: ImageSource.camera);

        setState(() {
          if (return_camera != null){
            select_Image = File(return_camera.path );
          }
          
        });
  }

  // ignore: non_constant_identifier_names
  Future telecharge_images2() async {
    final return_gallery2 =
        await ImagePicker().pickImage(source: ImageSource.gallery);

        setState(() {
          if (return_gallery2 != null){
            select_Image2 = File(return_gallery2.path );
          }
          
        });
  }

  // ignore: non_constant_identifier_names
  Future filmer_images2() async {
    final return_camera2 =
        await ImagePicker().pickImage(source: ImageSource.camera);

        setState(() {
          if (return_camera2 != null){
            select_Image2 = File(return_camera2.path );
          }
          
        });
  }
}

