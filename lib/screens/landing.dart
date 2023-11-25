import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../bin/main1.dart';
import '../databasehandle.dart';
import '../models.dart';
import '../models/model.dart';
import '../user_repo.dart';
import '../widgets/addedlist.dart';
import 'package:sqflite/sqflite.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/animation.dart';

import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyWidget(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 254, 254),
      body: Column(
         
              
        children:[
          Container(
          margin: const EdgeInsets.only( top: 40),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
           
            image: const DecorationImage(
              image: NetworkImage('assets/images/splash.gif'),
              
            ),
          ),
     
         
          ),
          Center(child:Text(
          
            'Welcome to Multi Tasking',
            textAlign: TextAlign.center,
            style: TextStyle( color:Colors.grey,fontSize: 20, fontWeight: FontWeight.bold),
          ),)
          
        ]
      )
      
        
          
     
     
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
   bool isDarkMode = false; // Initial theme mode

  // Function to toggle the theme mode
  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
      
        // backgroundColor: Color.fromARGB(255, 62, 61, 61),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 62, 61, 61),
          leadingWidth: 40,
          title: Text(""),
        ),
        //drawer
        drawer: Drawer(
          //listview
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                
              ),
              ListTile(
                title: Text('To Do List',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                onTap: () {
                  // Handle drawer item 1 tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Landing()),
                  );
                },
              ),
              ListTile(
                title: Text('Img/Vid',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                onTap: () {
                  // Handle drawer item 2 tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => My1()),
                  );
                },
              ),
              ListTile(
                title: Text('Sliders/TabBar',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                onTap: () {
                  // Handle drawer item 2 tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
              ),
              ListTile(
                title: Text('State Management',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                onTap: () {
                  // Handle drawer item 2 tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Counter()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
             Text(
              "A fantastic app you cannot live without",
              
               style: TextStyle(color: Colors.grey,fontSize: 20, fontWeight: FontWeight.bold),
             ),
             
             Text(
              "Multi Tasking",
               style: TextStyle(color: Colors.grey,fontSize: 35, fontWeight: FontWeight.bold),
             ),
             SizedBox(height: 30),
             IconButton(
                onPressed: toggleTheme,
               icon: Icon(Icons.bedtime),
               
              ),
              
            ]
          )
        )
        ));
  }
}

class My1 extends StatefulWidget {
  const My1({Key? key}) : super(key: key);

  @override
  State<My1> createState() => _My1State();
}

class _My1State extends State<My1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImgVid'),
      ),
      //drawer
      drawer: Drawer(
        //listview
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Image/Video',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text('Image Upload',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyImg()),
                );
              },
            ),
            ListTile(
              title: Text('Video Player',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyWidget1()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xff7c94b6),
          image: const DecorationImage(
            image: NetworkImage('assets/images/hy1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyWidget()),
          );
        },
        child: const Icon(Icons.arrow_back),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}

class Landing extends StatefulWidget {
  Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final TextEditingController todoTaskController = TextEditingController();
  final TodoBin todoBin = TodoBin();

  List<TodoModel> todoTasks = [];

  TodoModel?
      deletedTodoTask; 

  int?
      deletedTodoTaskPosition; 

  String? errorText;

  @override
  void initState() {
    super.initState();
    todoBin.getTodoList().then((value) {
      setState(() {
        todoTasks = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // * App Bar
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoTaskController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Write a task...',
                          errorText: errorText,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff00d7f3),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff00d7f3),
                        padding: EdgeInsets.all(14),
                      ),
                      onPressed: () {
                        // * Retrieving the inserted form field text
                        final taskTitle = todoTaskController.text;

                        if (taskTitle.isEmpty) {
                          setState(() {
                            errorText = 'The task cannot be empty!';
                          });
                          return;
                        }

                        setState(() {
                          final newTask = TodoModel(
                            title: taskTitle,
                            dateTime: DateTime.now(),
                          );
                          // * Render the screen to add the list
                          todoTasks.add(newTask);
                          errorText = null;
                        });
                        // * Clears text field after pressing the ADD button
                        todoTaskController.clear();
                        // * Saving the updated todo list
                        todoBin.saveTodoTaskList(todoTasks);
                      },
                      child: Icon(
                        Icons.add_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Flexible(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      for (TodoModel todo in todoTasks)
                        TodoListItem(
                          todoTask: todo,
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'You have ${todoTasks.length} pending tasks.',
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff00d7f3),
                        padding: EdgeInsets.all(14),
                      ),
                      onPressed: deleteAllTodos,
                      child: Text(
                        'Clear',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// * Deleting a task
  void onDelete(TodoModel todo) {
    deletedTodoTask = todo;

    deletedTodoTaskPosition = todoTasks.indexOf(todo);

    setState(() {
      todoTasks.remove(todo);
    });

    todoBin.saveTodoTaskList(todoTasks);

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          textColor: const Color(0xff00d7f3),
          label: 'Undo',
          onPressed: () {
            setState(() {
              todoTasks.insert(deletedTodoTaskPosition!, deletedTodoTask!);
            });
            todoBin.saveTodoTaskList(todoTasks);
          },
        ),
        content: Text(
          'task removed successfully!',
        ),
      ),
    );
  }

  void showDeleteTodosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Clear everything?',
        ),
        content: Text(
          'Are you sure you want to delete all the tasks?',
        ),
        actions: [
          // Cancel button
          TextButton(
            style: TextButton.styleFrom(
              primary: Color(0xff00d7f3),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel',
            ),
          ),
          // Clear All
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              deleteAllTodos();
            },
            child: Text(
              'Clean all',
            ),
          ),
        ],
      ),
    );
  }

  void deleteAllTodos() {
    setState(() {
      // Removes all objects from this list
      todoTasks.clear();
    });
    todoBin.saveTodoTaskList(todoTasks);
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyForm createState() => _MyForm();
}

class _MyForm extends State<MyForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Database? _database;

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';

  // void _submitForm() {
  //   final form = _formKey.currentState;
  //   if (form!.validate()) {
  //     form.save();
  //     // Handle form submission
  //     print('Name: $_name');
  //     print('Email: $_email');
  //     print('Password: $_password');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) => _name = value!,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) => _email = value!,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) => _password = value!,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {

                  },
                  child: Text('Insert'),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () {

                  },
                  child: Text('Read'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Database?> openDB() async {
    _database = await DatabaseHandle().openDB();
    return _database;
  }

  Future<void> insertUser() async {
    _database = await openDB();

    UserRepo userRepo = new UserRepo();
    userRepo.createTable(_database);

    Usermodel userModel = new Usermodel(nameController.text.toString(),
        emailController.text.toString(), passwordController.text.toString());

    await _database?.insert('User', userModel.toMap());

    await _database?.close();
  }

  Future<void> getfromUser() async {
    _database = await openDB();
    UserRepo userRepo = new UserRepo();
    await userRepo.getUsers(_database);
    await _database?.close();
  }
}

class MyImg extends StatefulWidget {
  const MyImg({Key? key}) : super(key: key);

  @override
  State<MyImg> createState() => _MyImgState();
}

class _MyImgState extends State<MyImg> {
  File? image;

  Future pickimage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to Pick:$e');
    }
  }

  Future pick1image() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to Pick:$e');
    }
  }

  Future uploadimage() async {
    final path = 'files/${image!}';
    final file = File(image!.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Container(
          padding: EdgeInsets.all(60),
          child: Center(
              child: Column(
            children: [
              Spacer(),
              image != null
                  ? Image.file(
                      image!,
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    )
                  : FlutterLogo(
                      size: 160,
                    ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  await pickimage();
                },
                child: Text('Select Image from Gallery'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  await pick1image();
                },
                child: Text('Select Image from Camera'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  uploadimage();
                },
                child: Text('Upload Image'),
              )
            ],
          ))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isExpanded = false;
  int _currentIndex = 0;
  List<String> _carouselItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5'
  ];

  @override
  void initState() {
    super.initState();
    // Create a custom TabController with 3 tabs
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose the TabController when the widget is disposed
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar & TabBarView Example'),
        bottom: TabBar(
          controller: _tabController, // Use the custom TabController
          tabs: <Widget>[
            Tab(
              text: 'Tab 1',
            ),
            Tab(
              text: 'Tab 2',
            ),
          ],
        ),
      ),
      // body: TabBarView(
      //   controller: _tabController, // Use the custom TabController
      //   children: <Widget>[
      // Center(
      //   child: ExpansionTile(
      //     title: Text('Expansion Tile 1'),
      //     children: <Widget>[
      //       ListTile(
      //         title: Text('Expansion Tile 1 Content'),
      //       ),
      //     ],
      //   ),
      // ),
      // Center(
      //   child: ExpansionPanelList(
      //     expansionCallback: (int index, bool isExpanded) {
      //       setState(() {
      //         _isExpanded = !_isExpanded;
      //       });
      //     },
      //     children: <ExpansionPanel>[
      //       ExpansionPanel(
      //         headerBuilder: (BuildContext context, bool isExpanded) {
      //           return ListTile(
      //             title: Text('Expansion Panel 1'),
      //           );
      //         },
      //         body: ListTile(
      //           title: Text('Expansion Panel 1 Content'),
      //         ),
      //         isExpanded: _isExpanded,
      //       ),
      //     ],
      //   ),
      // ),

      //   ],
      // ),
      body: ListView(children: [
        CarouselSlider(
          items: [
            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2017/01/08/13/58/cube-1963036__340.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/03/25/23/46/cube-689619__340.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJqqqTEDG47DmRff3nNLGXTq5CpMgiPWaVfw56m-Ulnb86AT005TvuIaQB58jJURMKlHk&usqp=CAU"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          options: CarouselOptions(
            height: 380.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
      ]),
    );
  }
}

class MyWidget1 extends StatefulWidget {
  const MyWidget1({Key? key}) : super(key: key);

  @override
  State<MyWidget1> createState() => _MyWidget1State();
}

class _MyWidget1State extends State<MyWidget1> {
  late VideoPlayerController _controller;
  late Future<void> _video;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _video = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: FutureBuilder(
        future: _video,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.value.isPlaying) {
            setState(() {
              _controller.pause();
            });
          } else {
            setState(() {
              _controller.play();
            });
          }
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Count: $_count',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Increment'),
              onPressed: _incrementCount,
            ),
          ],
        ),
      ),
    );
  }
}
