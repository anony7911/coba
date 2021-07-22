import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coba/constants.dart';
import 'package:coba/jobs.dart';

void main() {
  runApp(Coba());
}

class Coba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CariJobs',
      theme: ThemeData.light(),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final textController = TextEditingController();
  String displayName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(kSafePadding),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cari',
                    style: GoogleFonts.poppins(
                        color: kBlack,
                        fontSize: 48.0,
                        fontWeight: FontWeight.w800),
                  ),
                  Text('Jobs',
                      style: GoogleFonts.poppins(
                          color: kGreen,
                          fontSize: 48.0,
                          fontWeight: FontWeight.w800))
                ],
              ),
            ),
            SizedBox(height: 2 * kSafePadding),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Siapa nama Anda?',
                      style: GoogleFonts.poppins(
                          color: kBlack, fontWeight: FontWeight.w500)),
                  SizedBox(height: 2 * kBasePadding),
                  Container(
                    height: 12 * kBasePadding,
                    padding: EdgeInsets.symmetric(horizontal: kSafePadding),
                    decoration: BoxDecoration(
                        color: kWhite,
                        border: Border.all(color: kLightGrey),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukkan nama Anda'),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 2 * kSafePadding),
            // ignore: deprecated_member_use
            FlatButton(
                color: kGreen,
                onPressed: () {
                  setState(() {
                    displayName = textController.text;
                  });

                  if (displayName != '') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePage(displayName: displayName);
                    }));
                  } else {
                    return null;
                  }
                },
                child: Text('NEXT',
                    style: GoogleFonts.lato(
                        color: kWhite, fontWeight: FontWeight.w500)))
          ],
        )),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String displayName;

  HomePage({this.displayName});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Jobs> recommendedJobs = [
    Jobs(
        jobPosition: 'Web Developer',
        companyName: 'Google',
        location: 'Singapore, Singapore',
        salaryRange: '\$65 - \$80K',
        logoName: 'google.png',
        savedJob: false),
    Jobs(
        jobPosition: 'Web Developer',
        companyName: 'UBER',
        location: 'Singapore, Singapore',
        salaryRange: '\$65 - \$80K',
        logoName: 'uber.png',
        savedJob: false),
    Jobs(
        jobPosition: 'UX Designer',
        companyName: 'Microsoft',
        location: 'Washington DC, USA',
        salaryRange: '\$65 - \$90K',
        logoName: 'microsoft.png',
        savedJob: false)
  ];

  List<Jobs> recentJobs = [
    Jobs(
        jobPosition: 'Web & Mobile Developer',
        companyName: 'Reddit',
        location: 'California, United States',
        salaryRange: '\$60 - \$75K',
        logoName: 'reddit.png',
        savedJob: false),
    Jobs(
        jobPosition: 'Senior UX Designer',
        companyName: 'Apple Inc.',
        location: 'California, United States',
        salaryRange: '\$110 - \$130K',
        logoName: 'apple.png',
        savedJob: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGrey,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: RichText(
            text: TextSpan(
                text: 'Cari',
                style: GoogleFonts.poppins(
                    color: kBlack, fontSize: 20.0, fontWeight: FontWeight.w800),
                children: <TextSpan>[
              TextSpan(
                  text: 'Jobs',
                  style: GoogleFonts.poppins(
                      color: kGreen, fontWeight: FontWeight.w800))
            ])),
        actions: [
          IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: kDarkGrey,
              ),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                  kSafePadding, 2 * kSafePadding, kSafePadding, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello ${widget.displayName},',
                      style: GoogleFonts.lato(
                          color: kDarkGrey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 2.0),
                  Text('Temukan pekerjaan disini!',
                      style: GoogleFonts.poppins(
                          color: kBlack,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w800))
                ],
              ),
            ),
            SizedBox(height: 1.5 * kSafePadding),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kSafePadding),
                    child: Text(
                      'Direkomendasikan...',
                      style: GoogleFonts.poppins(
                          color: kBlack,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 2 * kBasePadding),
                  Container(
                    height: 12 * kSafePadding,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: recommendedJobs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return JobsDetail(
                                jobPosition: recommendedJobs[index].jobPosition,
                                companyName: recommendedJobs[index].companyName,
                                location: recommendedJobs[index].location,
                                salaryRange: recommendedJobs[index].salaryRange,
                                logoName: recommendedJobs[index].logoName,
                              );
                            }));
                          },
                          child: Container(
                            width: 10 * kSafePadding,
                            margin: index != recommendedJobs.length - 1
                                ? EdgeInsets.only(left: kSafePadding)
                                : EdgeInsets.symmetric(
                                    horizontal: kSafePadding),
                            padding: EdgeInsets.symmetric(
                                vertical: kSafePadding,
                                horizontal: 2 * kBasePadding),
                            decoration: BoxDecoration(
                                border: Border.all(color: kLightGrey)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/${recommendedJobs[index].logoName}',
                                  scale: 2.0,
                                ),
                                SizedBox(height: kSafePadding),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(recommendedJobs[index].jobPosition,
                                        style: GoogleFonts.lato(
                                            color: kBlack,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700)),
                                    SizedBox(height: 2.0),
                                    Text(recommendedJobs[index].companyName,
                                        style: GoogleFonts.lato(
                                            color: kDarkGrey,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700)),
                                    SizedBox(height: 4.0),
                                    Text(recommendedJobs[index].location,
                                        style: GoogleFonts.lato(
                                          color: kDarkGrey,
                                        )),
                                    SizedBox(height: 4.0),
                                    Text(recommendedJobs[index].salaryRange,
                                        style: GoogleFonts.lato(
                                            color: kDarkGrey,
                                            fontWeight: FontWeight.w600))
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.5 * kSafePadding),
            Container(
              padding: EdgeInsets.symmetric(horizontal: kSafePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terbaru...',
                    style: GoogleFonts.poppins(
                        color: kBlack,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 2 * kBasePadding),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: recentJobs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return JobsDetail(
                              jobPosition: recentJobs[index].jobPosition,
                              companyName: recentJobs[index].companyName,
                              location: recentJobs[index].location,
                              salaryRange: recentJobs[index].salaryRange,
                              logoName: recentJobs[index].logoName,
                            );
                          }));
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: kSafePadding),
                          padding: EdgeInsets.all(kSafePadding),
                          decoration: BoxDecoration(
                              border: Border.all(color: kLightGrey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/${recentJobs[index].logoName}',
                                      scale: 2.0,
                                    ),
                                    SizedBox(width: kSafePadding),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(recentJobs[index].jobPosition,
                                            style: GoogleFonts.lato(
                                                color: kBlack,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w700)),
                                        SizedBox(height: 2.0),
                                        Text(recentJobs[index].companyName,
                                            style: GoogleFonts.lato(
                                                color: kDarkGrey,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w700)),
                                        SizedBox(height: 4.0),
                                        Text(recentJobs[index].location,
                                            style: GoogleFonts.lato(
                                              color: kDarkGrey,
                                            )),
                                        SizedBox(height: 4.0),
                                        Text(recentJobs[index].salaryRange,
                                            style: GoogleFonts.lato(
                                                color: kDarkGrey,
                                                fontWeight: FontWeight.w600))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: recentJobs[index].savedJob == true
                                      ? Icon(Icons.bookmark, color: kGreen)
                                      : Icon(Icons.bookmark_border,
                                          color: kDarkGrey),
                                  onPressed: () {
                                    setState(() {
                                      recentJobs[index].savedJob =
                                          !recentJobs[index].savedJob;
                                    });
                                  })
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class JobsDetail extends StatelessWidget {
  final String jobPosition;
  final String companyName;
  final String location;
  final String salaryRange;
  final String logoName;

  JobsDetail(
      {this.jobPosition,
      this.companyName,
      this.location,
      this.salaryRange,
      this.logoName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kLightGrey,
            elevation: 0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: kGreen),
                onPressed: () {
                  Navigator.pop(context);
                }),
            centerTitle: true,
            title: Text(companyName,
                style: GoogleFonts.poppins(
                    color: kBlack,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600))),
        body: SingleChildScrollView(
          child: SafeArea(
            minimum: EdgeInsets.all(kSafePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only(top: kSafePadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/$logoName',
                        scale: 1.5,
                      ),
                      SizedBox(width: kSafePadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(jobPosition,
                              style: GoogleFonts.lato(
                                  color: kBlack,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700)),
                          Text(companyName,
                              style: GoogleFonts.lato(
                                  color: kDarkGrey,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700)),
                          Text(location,
                              style: GoogleFonts.lato(
                                  color: kDarkGrey, fontSize: 16.0)),
                          Text(salaryRange,
                              style: GoogleFonts.lato(
                                  color: kDarkGrey,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 1.5 * kSafePadding),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Deskripsi Pekerjaan',
                          style: GoogleFonts.poppins(
                              color: kBlack,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700)),
                      SizedBox(height: kBasePadding),
                      Text(
                        'Saya mencari desainer UI/UX yang kuat dan efisien untuk ditambahkan ke tim saya. Kandidat harus sangat memperhatikan pedoman Material.io. Klien juga harus mahir dengan teknologi berikut: Adobe XD, Invision, Photoshop, Illustrator, Zeplin.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.lato(color: kBlack, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 1.5 * kSafePadding),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Kualifikasi',
                          style: GoogleFonts.poppins(
                              color: kBlack,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700)),
                      SizedBox(height: kBasePadding),
                      Text('• Min level of education: B.Sc. in CSE',
                          style:
                              GoogleFonts.lato(color: kBlack, fontSize: 16.0)),
                      Text('• Expert in Laravel framework',
                          style:
                              GoogleFonts.lato(color: kBlack, fontSize: 16.0)),
                      Text('• Fluent in English language',
                          style:
                              GoogleFonts.lato(color: kBlack, fontSize: 16.0)),
                    ],
                  ),
                ),
                SizedBox(height: 1.5 * kSafePadding),
                Container(
                  padding: EdgeInsets.all(2 * kSafePadding),
                  decoration: BoxDecoration(
                      color: kLightGrey,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.people_outline,
                            color: kGreen,
                            size: 28.0,
                          ),
                          SizedBox(width: 1.5 * kSafePadding),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Lowongan',
                                  style: GoogleFonts.lato(
                                      color: kBlack,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: kBasePadding),
                              Text('03',
                                  style: GoogleFonts.lato(
                                      color: kBlack,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700))
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: kSafePadding),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: kGreen,
                            size: 28.0,
                          ),
                          SizedBox(width: 1.5 * kSafePadding),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Batas Waktu',
                                  style: GoogleFonts.lato(
                                      color: kBlack,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: kBasePadding),
                              Text('31 Aug 2021',
                                  style: GoogleFonts.lato(
                                      color: kBlack,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700))
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: kSafePadding),
                      Row(
                        children: [
                          Icon(
                            Icons.picture_in_picture_alt,
                            color: kGreen,
                            size: 28.0,
                          ),
                          SizedBox(width: 1.5 * kSafePadding),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Wawancara',
                                  style: GoogleFonts.lato(
                                      color: kBlack,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: kBasePadding),
                              Text('05 Sep 2021',
                                  style: GoogleFonts.lato(
                                      color: kBlack,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
