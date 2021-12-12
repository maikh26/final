class News {
  final imageUrl;
  final title;
  final description;
   final screenshots;
   final date;


  News({
    this.title,
    this.description,
    this.imageUrl,
        this.screenshots,
this.date,
  });
}

final List<News> breaking_news = [
  News(
    imageUrl: 'assets/images/cring.jpg',
    title: 'baby sleep',

    date: '26-Nov-2020',
    description:
        ' , but your newborn already knows they can rely on you. By now, they can recognize your voice, and the familiarity helps them adjust to the strange new world outside the womb. They cant understand your words, but talk to them often as an expression of love and comfort. ',
    screenshots: [
      'assets/images/cring.jpg',
     // 'assets/images/news_en/innovation-grant.jpeg',
     // 'assets/images/news_en/Zunaid-Ahmed-Palak.jpg',
    ],
  ),
 

]; //breaking_news

final List<News> trending_news = [
  News(
    imageUrl:  'assets/images/cring.jpg',
    title: '',
    date: '',
    description:
    '',
    screenshots: [
       'assets/images/cring.jpg',
    ],
  ),
  News(
    imageUrl: 'assets/images/news_en/unibator.jpeg',
    title: 'Unibator programme launched',
    date: '30-Jan-2021',
    description:
    'According to the Data of Bangladesh Bureau of Statistics, about one million (10 Lac) students enter the job market every year after graduation. As per the graduation rule, all graduating students have to submit at least one thesis or similar academic project in order to be eligible for the completion of the graduation. But in almost all cases, these projects or concepts / theories or ideas remain confined to the report with no practical use of the ideas. As a result, students tend to choose repeated topics, performing a copy paste, rather than working on working on new concepts or innovative ideas. Objectives of UNIBATOR - Through UNIBATOR program, Bangladesh Hi-Tech Park Authority (BHTPA) and Institution of Engineers,  Bangladesh hope to bring a change in the thinking process of our educational institutions and upcoming graduate level students regarding the thesis / academic projects. The name UNIBATOR has been derived from the statement, ‘University Incubator’ with a focus to bring mentors and students together on entrepreneurial journey. Selected ideas will win month-long free mentorship from global leaders, incubation program to think and transform the ideas into functional ventures, taka 10lac grant to launch their ventures in the market. Who can apply? - Any Bangladeshi national aged between 16 to 64 with Thesis Work (Final Year Project), Research Work (Academic or Institutional Research), Academic Work (Lab Report, Departmental Project, Science Fair Project, etc.) or any Other Random Projects (Personal Ideas, Startups, Innovations, etc.) may apply individually or in a team of 2 to 5 people. Bangladeshi nationals residing outside of Bangladesh may also apply.',
    screenshots: [
      'assets/images/news_en/Palak-Mp.jpeg',
      'assets/images/news_en/Guest-Posters-MD-Madam-01-scaled.jpeg',
      'assets/images/news_en/asif-mahmud-01-scaled.jpeg',
      'assets/images/news_en/Sonia-apa-1.jpeg',
    ],
  ),
  News(
    imageUrl: 'assets/images/news_en/bb_20_0.jpeg',
    title: 'BB forms Tk 500cr fund to help new entrepreneurs',
    date: '21-Mar-2021',
    description: 'The Bangladesh Bank has formed a Tk 500 crore fund in order to help new entrepreneurs aged between 21 and 45 years start businesses. The fund has been constituted in the form of a refinance scheme, meaning banks will firstly disburse loans to clients and the banking regulator will later reimburse the fund to banks. The Bangladesh Bank issued a notice on Tuesday to this end. New entrepreneurs will be allowed to manage funds from the refinance scheme at a maximum interest rate of 4 per cent and banks will get funds at 0.5 per cent interest from the central bank. The maximum repayment tenure of the fund is five years. A client will get a maximum of Tk 1 crore from the fund including one year grace period. In addition, the banking regulator also asked banks to form a separate startup fund from their own money. Each bank will have to keep 1 per cent money from their operating profit from this year. They will have to allocate the fund mentioned by the central bank for the next five years. At least 10 per cent of the disbursed loan under the startup fund will have to be given out to female entrepreneurs.',
    screenshots: [
    ],
  ),
  News(
    imageUrl: 'assets/images/news_en/ict-ministry.jpeg',
    title: 'Seven startups get Tk 15cr capital',
    date: '01-Mar-2021',
    description: 'Startup Bangladesh, the flagship venture capital fund of the ICT ministry, announced the first series of investments of Tk 15 crore, or \$1.75 million, for seven startups yesterday. The government formed Startup Bangladesh in March 2020 with an allocated capital of Tk 500 crore to help new entrepreneurs innovate faster, create new jobs, develop technical skills and realise the vision of Digital Bangladesh. This time, the company has launched the "Shoto Borshe Shoto Asha" initiative to invest Tk 100 crore in 50 startups in 2021 to mark the birth centenary of Bangabandhu Sheikh Mujibur Rahman and Golden Jubilee of Bangladesh. The seven startups selected for the first series of investments are: Pathao (ride-sharing/logistics), Dhaka Cast (health-tech), Moner Bondhu (mental health and Wellbeing), Chaldal (e-commerce), Eduhive (education-tech), Sheba.xyz (domestic services and SME) and Intelligent Machines (software services). Through this initiative, the government has created a national entrepreneurship platform to support the startup ecosystem, said ICT State Minister Zunaid Ahmed Palak. "Startup Bangladesh could bridge the gap between the startups and their potential with required capital financing. The tech-solutions provided by startups could help the nation achieve its Sustainable Development Goals by 2030." He spoke after announcing the investments at a programme organised by the ICT Division and Startup Bangladesh at the Bangladesh Computer Council in Dhaka\'s Agargaon. The startups received this fund to scale up their production, improve the quality of goods and services and develop the supply chain and marketing strategies.',
    screenshots: [
      'assets/images/news_en/pathao_gojek_bangladesh_loss.jpg',
      'assets/images/news_en/chaldal.jpg',
      'assets/images/news_en/eduhive.png',
    ],
  ),
  News(
    imageUrl: 'assets/images/cring.jpg',
    title: '',
    date: '06-April-2021',
    description: '',
    screenshots: [
      'assets/images/news_en/lockdown_1.jpeg',
      'assets/images/news_en/sbh-2-new.jpeg',
      'assets/images/news_en/lockdown_0.jpeg',
    ],
  ),
]; //trending_news



final List<String> trending_pic = [
  'assets/images/cring.jpg', 'assets/images/cring.jpg', 'assets/images/cring.jpg', 'assets/images/cring.jpg', 'assets/images/cring.jpg', 'assets/images/cring.jpg',
];

