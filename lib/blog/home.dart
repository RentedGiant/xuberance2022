import 'package:exebit21_covid/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:exebit21_covid/news1.dart';
import 'package:exebit21_covid/news_widget/news.dart';
import 'package:exebit21_covid/statistics_widget/statistics_widget.dart';
import 'create_blog.dart';
import 'package:expand_widget/expand_widget.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingNavbar(
          backgroundColor: Color.fromARGB(255, 109, 111, 197),
          width: 250,
          elevation: 0,
          borderRadius: 100.0,
          iconSize: 25,
          itemBorderRadius: 100,
          onTap: (int val) {
            if(val==1){
              Navigator.push(context, MaterialPageRoute(builder: (context) => News_Feed()));
            }
            else if(val==0){
              Navigator.push(context, MaterialPageRoute(builder: (context) => news()));
            }
            else if (val==2){
              Navigator.push(context, MaterialPageRoute(builder: (context) => StatisticsWidget()));
            }
          //  else if (val==4){
            //  Navigator.push(context, MaterialPageRoute(builder: (context) => Maps()));
           // }
          },
          currentIndex: 3,
          items: [
            FloatingNavbarItem(icon: Icons.poll_outlined,),
            FloatingNavbarItem(icon: Icons.copy_rounded, ),
            FloatingNavbarItem(icon: Icons.local_hospital_outlined, ),
            FloatingNavbarItem(icon: Icons.mark_chat_read_outlined,title: 'Blog' ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:30.0, left: 30,right: 30),
              child:  Card(
                child: Column(
                  children: [
                    Text("Disproportions In Wealth during covid", style: TextStyle(fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpandText(
                        'The COVID-19 crisis is now widely seen as the greatest economic calamity since the Great Depression. In January, it was expected that global income would grow 3 percent; it is now forecast to fall 3 percent, much worse than during the Great Recession of 2008-09. Behind this dire statistic is an even grimmer possibility: if past pandemics are any guide, the toll on poorer and vulnerable segments of society will be several times worse. Indeed, a recent poll of top economists found that the vast majority felt the COVID-19 pandemic will worsen inequality, in part through its disproportionate impact on low-skilled workers.The evidence supports concerns about the adverse distributional impacts of pandemics. It has been found that major epidemics in this century have raised income inequality and hurt employment prospects of those with only a basic education while scarcely affecting employment of people with advanced degrees',
                                  textAlign: TextAlign.justify,
                                ),
                    ),
                  ],
                ),
              ),
                      ),
            Padding(
              padding: const EdgeInsets.only(top:10.0, left: 30,right: 30),
              child:  Card(
                child: Column(
                  children: [
                    Text("How South Africa Curbed Covid", style: TextStyle(fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpandText(
                        'In this time of crisis, we are often reminded of a famous quote, attributed to Churchill during World War II: “If youre going through hell, keep going.” While South Africa is not in the middle of a physical war, it is battling the COVID-19 (coronavirus) crisis in full force. Like most other countries, South Africa could not escape the pandemic. It suffered the loss of lives and livelihoods. At the time of writing, in early July 2021, more than 64,000 South Africans have lost their lives. The third wave is hitting the country very hard and infections keep rising every day. But there is also light at the end of a very long tunnel.The government responded swiftly and strongly to the crisis while also spearheading an international alliance for the distribution of vaccines in Africa. This resolve to level the international playing field demonstrates that COVID-19 can serve as a turning point in reenergizing South Africas economy and labor market. . While South Africa is set to emerge from the crisis weaker than it was going into it, the World Bank’s most recent South Africa Economic Update argues that the reasons for low growth and high unemployment do not lie in the Government’s crisis response. Instead, the pandemic has exposed long-standing structural weaknesses that  have progressively worsened since the global financial crisis of 2008–09.',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0, left: 30,right: 30),
              child:  Card(
                child: Column(
                  children: [
                    Text("Travel Restrictions due to COVID-19", style: TextStyle(fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpandText(
                                'The COVID-19 pandemic led to major disruptions globally, and survey operations were not immune from its impact. Much-needed mitigation efforts by country leaders, such as travel restrictions, social distancing, and lockdowns, though instrumental in curbing the spread of the virus, made traditional face-to-face surveys and the accompanying technical assistance difficult to execute. By May 2020, 96% of National Statistics Offices (NSOs) had partially or completely halted face-to-face data collection and had to rely on web and phone interviews to conduct surveys.As some of these countries gradually resumed in-person operations, Task Force on COVID-19 and Household Surveys put together a guidance note, Planning and Implementing Household Surveys Under COVID-19, which addressed considerations for safe survey implementation during the pandemic. However, due to travel restrictions still in place, the Technical Assistance (TA) teams have had to provide remote support to the NSOs. This technical note, prepared by the Living Standards Measurement Study (LSMS) team, details ways in which TA teams can adequately support survey operations in client countries with minimal disruptions to the data collection efforts. This note is guided by the following principles: continuity of support, adherence to safety protocols, and limits on in-person activities.',
                        textAlign: TextAlign.justify,
                        collapsedHint: ('read more'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0, left: 30,right: 30),
              child:  Card(
                child: Column(
                  children: [
                    Text("A Miracle", style: TextStyle(fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpandText(
                        "I tested positive the day before I gave birth, Nigyritto, 32, DelhiI am a nurse at Fortis hospital, Shalimar Bagh. I was expecting my second child and since my due date was in May, I was to return home to my family in Ernakulam, Kerala in April. My husband, who works in Dubai, was to fly down for the birth as well. But the Covid-19 pandemic and the lockdown changed all our plans. Worried by coronavirus, I decided to go on medical leave earlier than I had planned, starting from the last week of March itself.As my due date approached, on May 12, I decided to get a Covid-19 test at my gynecologist’s advice. I was 37 weeks pregnant at the time. The results came two days later and it was positive. I was surprised because I didn’t have any symptoms and I had been at home. I still don’t know how I got the infection.I was worried, not so much for myself because I didn’t have symptoms, but about this would affect the delivery and my baby. I got admitted to the Covid-19 ward that day itself. The next morning, my labour pains started. Within three hours, my daughter was born through a normal delivery. She was tested for Covid-19 twice and thankfully was negative both times.After delivery, the baby was separated from me for 15 days. I had a room to myself, so I mostly spent time watching TV. The hospital staff helped me a lot during this time, and would often come to meet me so I was never scared. My friends, who were also nurses at the hospital, watched over the baby. I couldn’t see or feed her and so they'd show me her videos and photos. I would also do video calls with her. It was hard but I was glad that atleast she was safe.I was given vitamins and antibiotics after delivery. My diet mostly consisted of idli, sambhar, upma, rice, chapati, dal, vegetables and plenty of fruits and juices. I was finally discharged from the hospital on May 31 and went home with her and was under home quarantine. I tested negative on June 10. Now, the tension is finally over.",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0, left: 30,right: 30,bottom:150),
              child:  Card(
                child: Column(
                  children: [
                    Text("Hope", style: TextStyle(fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpandText(

                        "More than Covid, it's the loneliness, anxiety and depression which affects you, Dr Rishoth, 22, ChennaiI am interning at the orthopedic department of the Government Kilpauk Medical College in Chennai. On May 31, after my duty, I felt fatigued and went home. I had a body ache and went off to sleep without dinner. When I woke up, I had a raised temperature. I couldn't have food or water properly. It escalated quickly in the next 30 minutes, and suddenly I had difficulty in breathing. I didn't know if it was due to anxiety or Covid symptoms. I went to the hospital, gave a swab that night and was admitted to the emergency ward. My result came 24 hours later and I was positive.I was shifted to the ICU that night. The breathlessness made me uncomfortable, anxious and scared. I had never experienced anything like it before, though I had asthma as a child. I had been on Covid duty from May 5 to 11, and was staying at the hostel. I’d just go home to pick up my clothes, and unfortunately that day I was home. I was worried about my mother and brother catching it from me. They were quarantined too and thankfully tested negative.I had taken every precaution and always wore masks and gloves but I also come across 3,000-4000 patients daily and not all are wearing masks. Afterwards, my roommate and two close friends too tested positive.More than the symptoms, it was the anxiety that got me. I began to get flashes of my life and thought a lot about my family and future. I was in the ICU for a day and then shifted to an isolation ward. One day, when I woke up, I saw that two people next to me were dead.The initial four days in isolation were the toughest. I’d feel breathless with the slightest exertion. My pulse rate was much higher than normal and I could feel my heart pounding inside me. I called all the doctors I knew to ask if I would be okay. My CT scan too showed mild infiltrations on lungs, suggestive of viral pneumonia. But my oxygen level was normal.I didn't know whether it was day or night. I suffer from Irritable Bowel Syndrome, which was aggravated due to stress. Every time I ate something, I had to go to the toilet. It made me feel worse. Then I started to take home food and it got better. I felt dizzy and weak, and it took a while to regain the strength. Then I was shifted to the ward for asymptomatic patients. My breathlessness subsided by May 26 but I developed an intermittent fever. But I made up my mind that I would be okay.During the morning, my fellow doctors would visit or call me and tell me I’d come out of this. I’d spend the day watching movies or reading on the phone and napping. Due to a sore throat initially, I couldn’t eat properly or even drink water with the tablets. I had to be put on saline IV drip and did hot gargles. As I had Irritable Bowel Syndrome, I mostly ate soft and bland food, and nuts, fruits, juices and dates. By the evening of May 27, I felt much better. Finally, I was discharged on May 30. Now, I feel normal and energetic. I am out of quarantine. I will be joining work at the hospital again but I am happy to go there. If it happens to me again, I am confident I won’t be scared or anxious like the first time.",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

              ),

      floatingActionButton: Container(
        padding: EdgeInsets.only(left: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreateBlog()));
              },
                backgroundColor: AppColors.primaryElement,
                child: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
