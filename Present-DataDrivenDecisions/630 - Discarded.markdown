
However, there are still some relevant points that I think will be useful.

### First, identify a problem

* We want to be healthy all the time, for as long as possible.
* When we get sick or hurt, we want to recover as quickly as possible.
* We don't want any chronic diseases or conditions.

**Acute vs. Chronic**

Medicine can generally be categorized as two dealing with two different problems. The first, *acute* medicine, is when time is critical.

We see these problems all the time. Gunshot wounds. Car accidents. Heart attacks. Stroke. Poisoning and snakebites. Situations where dramatic amounts of medical treatment can improve someone's health. This is the stuff of TV medical dramas.

The second category, *chronic* medicine, is where Western medicine tends to do much worse. These are issues that affect a person's life forever, and can be prevented in advance. Type 2 diabetes. Heart disease. Liver disease (from alcohol). Lung disease (from smoking). All of the side effects of obesity.

The difference here is that more medicine, rapidly applied, doesn't necessarily help. Sometimes it can even hurt, because many medical procedures are invasive or have side effects.

Western medicine treats disease *after a person has it*. It's not very good at preventative medicine. That's a shame, because prevention is more efficient, cheaper, and produces better quality of life.

The principal-agent problem starts to rear its ugly head again, because doctors make money when you visit them. Someone who can successfully avoid heart disease and diabetes through their own choices won't pay hospitals or doctors anything to treat those conditions.

The 80/20 rule applies here as well. What are the most effective ways you can become and stay healthy? Moderate exercise and eating healthy. Walking 10K steps a day and eating more green vegetables is almost always a good start.

When we look at time, we should also look at quality of time. How much time are you willing to spend walking during the day, and cooking healthy food, in return for years of better health when you're older?

I don't know the best diet or exercise plan; I'm not a doc. 

**Ensembling**



* Here, the goal is simple: I want to be healthy all the time. When I get sick or hurt, I want to recover as quickly and fully as possible. 
* Intrinsically healthy people are bad for health care as a business. They don't buy anything.
   * The principal-agent problem comes into play. People have their own incentives.
* Add in the concept of spent vs. gained time



### Know the right questions to ask

* Start with a question
   * Asking the right questions is the best way to get started
   * Making the wrong assumptions is the easiest way to screw up.
* Get your hands dirty. 
* Be proficient at cleaning data
   * Joins
   * Excel lookups
   * Manually
   * Mechanical Turk

* Add in scope and elephants in the room
   * Economics
   * Politics
   * User adoption/emotion. Not linear.

QUESTIONS FOR ME TO RESEARCH:

http://www.central1.com/sites/default/files/uploads/files/analysis_report/report_file/ea%202013_02.pdf

http://publications.gc.ca/collections/collection_2012/schl-cmhc/NH12-89-2012-eng.pdf?

http://www.news1130.com/2013/06/04/current-condo-incentives-may-hurt-industry-in-the-long-term/

* What is the median income in Vancouver? Victoria? Kalamazoo?
* Look at Edmonton, Kelowna, Kamloops, Victoria, etc.
* What is the median rent?
* What is the median house price?
* What has this been historically? What does that imply?
* How does the price change as you go to worse neighborhoods?
   * Where are the deals?
   * Deal = low price (external metric) vs. high personal value (you define)

**Evidence of Vancouver bubbles**

1. [Condo 1](http://www.leaderpost.com/business/real-estate/Boomers+will+finance+kids+housing+purchases+Vancouver/8397869/story.html)
2. [Hong Kong chinese are leaving](http://blogs.vancouversun.com/2013/04/17/hong-kong-chinese-leaving-vancouver-by-the-thousands/)
3. [PM sues condo developer](http://www.edmontonjournal.com/business/commercial-real-estate/Former+Campbell+sues+falling+vancouver/8112216/story.html)
4. [Canada banks inflate house prices](http://boundarysentinel.com/news/comment-canada%E2%80%99s-reckless-banks-inflate-house-price-bubble-23652#.UUs3dTd6jKy)
5. [Expensive BC home sales drop by 1/3](http://www.vancouversun.com/business/home+sales+above+million+fell+third+2012/8038269/story.html)
6. [Real-estate developer fakes demand](http://www.theglobeandmail.com/news/british-columbia/scant-evidence-behind-myth-of-vancouver-real-estates-foreign-buyers/article9000860/)
   Architect looked and found anywhere from 5.5% to 15% of condos are empty, meaning they are just investments.
7. [Montreal housing bubble is deflating](http://www.montrealgazette.com/business/Bryan+housing+numbers+point+soft+landing/7973381/story.html)
8. [Average family in Vancouver has sticker shock](http://www.theglobeandmail.com/life/home-and-garden/real-estate/vancouver-housing-have-nots-struggle-with-sticker-shock/article8729459/?cmpid=rss1)
9. [The coming 'Japanization' of Vancouver's housing market](http://www.oyetimes.com/lifestyle/naukri-paisa/36208-coming-japanization-of-canadian-real-estate-market)
10. [Nobody knows how many overseas buyers there are](http://www.theglobeandmail.com/report-on-business/economy/housing/crucial-bit-of-missing-information-may-be-driving-canadian-home-prices/article7935464/?page=all)
11. [Average rent Calgary](http://publications.gc.ca/collections/collection_2012/schl-cmhc/NH12-63-2012-eng.pdf?) and [here](http://www.jimsparrow.com/market-stats.php)
12. [Info about Okanagan](http://www.ourokanagan.ca/assets/files/OK%20VALLEY%20PROFILE.pdf)
13. [Info about Kootenay](http://www.city-data.com/canada/East-Kootenay.html)

### Data Sources

* There are ever more of them.
* Google searches are good
* Lots of sites with data
* You'll never find exactly what you're looking for.

**Common data sources**

* Geographic (GIS) data
* US, Canadian government
* State government - sometimes
* Small nonprofits
* Brokers - beware of agenda

### Acquire, clean up the Data
It's amazing just how much work is necessary to do here. Not very many shortcuts.

(INSERT) Tool by UC Berkely, Data Wrangler, to clean up data.

Common tools are:
1. Regular expressions
2. Excel (manually)


### Statistics

* First, visualize the data (density, histograms)
* Don't use mean (average) or standard deviation if it's not normal
* Correlation != causation. But sometimes correlation is enough. And !Correlation = !Causation
* Don't use complicated plots. Look at things you can understand.
* Bar and scatter plots are amazing for this
* Don't assume linear. Almost nothing is. Use exponents and logs to make this easy

* Do this in multiple tools: R, Excel, SSMS
* Show how to acquire data in multiple tools: PoSH, Python
* Include pictures of cats
* Start uber-technical, and then back off to simpler techniques.630 - 