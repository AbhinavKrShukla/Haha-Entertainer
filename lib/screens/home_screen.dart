import 'package:flutter/material.dart';
import 'package:haha_entertainer/screens/about_screen.dart';
import 'package:haha_entertainer/screens/privacy_policy_screen.dart';
import 'package:haha_entertainer/screens/terms_conditions_screen.dart';
import 'package:haha_entertainer/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List quotesList = [];
  List factsList = [];
  List jokesList = [];
  List dadjokesList = [];
  List riddlesList = [];
  bool riddlesShowAnswer = false;

  bool isLoading = true;


  Future getQuotes () async {
    quotesList = await hitApi("quotes");
    setState(() {
      isLoading = false;
    });
  }

  Future getFacts () async {
    factsList = await hitApi("facts");
    setState(() {
      isLoading = false;
    });
  }

  Future getJokes () async {
    jokesList = await hitApi("jokes");
    setState(() {
      isLoading = false;
    });
  }

  Future getDadJokes () async {
    dadjokesList = await hitApi("dadjokes");
    setState(() {
      isLoading = false;
    });
  }

  Future getRiddles () async {
    riddlesList = await hitApi("riddles");
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getQuotes();
    //   getFacts();
    //   getJokes();
    //   getDadJokes();
    //   getRiddles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 5, child: Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: Scaffold.of(context).openDrawer,
                icon: const Icon(Icons.menu)
            );
          },
        ),

        title: Row(
          children: [
            Image.asset('assets/images/emoji_icon_2.png', width: 40),
            const SizedBox(width: 10,),
            const Text('Haha Entertainer',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ],
        ),
        bottom: TabBar(tabs: [
          Tab(child: Image.asset('assets/images/quotes_icon.png'),),
          Tab(child: Image.asset('assets/images/facts_icon.png'),),
          Tab(child: Image.asset('assets/images/joke_icon.png'),),
          Tab(child: Image.asset('assets/images/dad_joke_icon.png'),),
          Tab(child: Image.asset('assets/images/riddles_icon.png'),),
        ]),
      ),

      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(5),
          children: [
            DrawerHeader(child: Column(
              children: [
                Image.asset('assets/images/emoji_icon_2.png', width: 100,),
                Text("Haha Entertainer",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.secondary
                  ),
                )
              ],
            )),

            Card(
              elevation: 3.0,
              child: ListTile(
                leading: Image.asset('assets/images/info_logo.png'),
                title: const Text('About',
                  style: TextStyle(
                    fontSize: 22
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const AboutScreen())
                  );
                }
              ),
            ),

            Card(
              elevation: 3.0,
              child: ListTile(
                  leading: Image.asset('assets/images/privacy_icon.png' ,),
                  title: const Text('Privacy Policy',
                    style: TextStyle(
                        fontSize: 22
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyScreen())
                    );
                  }
              ),
            ),

            Card(
              elevation: 3.0,
              child: ListTile(
                  leading: Image.asset('assets/images/terms_icon.png' ,),
                  title: const Text('Terms of Service',
                    style: TextStyle(
                        fontSize: 22
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const TermsConditionsScreen())
                    );
                  }
              ),
            ),
          ],
        )
      ),

      body: TabBarView(
        children: [
          // Quotes
          Center(
            child: Column(
              children: [
                Text('Quotes',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/quotes_bg_image.jpg'),
                      colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.15), BlendMode.dstATop
                      )
                    )
                  ),
                  height: MediaQuery.of(context).size.height * 4 / 7,
                  padding: EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(quotesList.isEmpty ? "" : quotesList[0]["quote"],
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 25
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(quotesList.isEmpty ? "" : "- "+quotesList[0]["author"],
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),


                SizedBox(
                  width: 100,
                  height: 100,
                  child: isLoading ? const CircularProgressIndicator() :
                    ElevatedButton(
                      onPressed: (){
                          setState(() {
                            getQuotes();
                          });
                      },
                    child: const Icon(Icons.repeat),

                  ),
                )
              ],
            ),
          ),

          // Facts
          Center(
            child: Column(
              children: [
                Text('Facts',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: const AssetImage('assets/images/facts_bg_image.png'),
                          colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.15), BlendMode.dstATop
                          )
                      )
                  ),
                  height: MediaQuery.of(context).size.height * 4 / 7,
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(factsList.isEmpty ? "" : factsList[0]["fact"],
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 25
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                SizedBox(
                  width: 100,
                  height: 100,
                  child: isLoading ? const CircularProgressIndicator() :
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        getFacts();
                      });
                    },
                    child: const Icon(Icons.repeat),

                  ),
                )
              ],
            ),
          ),

          // Jokes
          Center(
            child: Column(
              children: [
                Text('Jokes',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: const AssetImage('assets/images/jokes_bg_image.png'),
                          colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.15), BlendMode.dstATop
                          )
                      )
                  ),
                  height: MediaQuery.of(context).size.height * 4 / 7,
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(jokesList.isEmpty ? "" : jokesList[0]["joke"],
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 25
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 100,
                  height: 100,
                  child: isLoading ? const CircularProgressIndicator() :
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        getJokes();
                      });
                    },
                    child: const Icon(Icons.repeat),

                  ),
                )
              ],
            ),
          ),

          // Dad Jokes
          Center(
            child: Column(
              children: [
                Text('Dad Jokes',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: const AssetImage('assets/images/dadjokes_bg_image.png'),
                          colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.15), BlendMode.dstATop
                          )
                      )
                  ),
                  height: MediaQuery.of(context).size.height * 4 / 7,
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(dadjokesList.isEmpty ? "" : dadjokesList[0]["joke"],
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 25
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 100,
                  height: 100,
                  child: isLoading ? const CircularProgressIndicator() :
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        getDadJokes();
                      });
                    },
                    child: const Icon(Icons.repeat),

                  ),
                )
              ],
            ),
          ),

          // Riddles
          Center(
            child: Column(
              children: [
                Text('Riddles',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: const AssetImage('assets/images/riddles_bg_image.png'),
                          colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.15), BlendMode.dstATop
                          )
                      )
                  ),
                  height: MediaQuery.of(context).size.height * 4 / 7,
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Center(
                            child: Text(riddlesList.isEmpty ? "" : riddlesList[0]["title"],
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.secondary,
                                  fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(riddlesList.isEmpty ? "" : riddlesList[0]["question"],
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 25,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        
                        Text(riddlesList.isEmpty || !riddlesShowAnswer ? "" : riddlesList[0]["answer"],
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondaryContainer,
                              fontSize: 25,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                          ),
                            onPressed: (){
                              setState(() {
                                if (riddlesShowAnswer) {
                                  riddlesShowAnswer = false;
                                } else {
                                  riddlesShowAnswer = true;
                                }
                              });
                            },
                            child: riddlesShowAnswer ?
                              Text("Hide Answer",
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),
                              ) : Text("Show Answer",
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.secondary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),
                            ) ,
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 100,
                  height: 100,
                  child: isLoading ? const CircularProgressIndicator() :
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        getRiddles();
                        riddlesShowAnswer = false;
                      });
                    },
                    child: const Icon(Icons.repeat),

                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
