## Introduction, 1 minute

(START AT CELL PHONE SLIDE, TRANSITION TO HEADER SLIDE AT THE START)

Good morning! I'm Dev, and this session is about practical techniques to make decisions using data.

In my day job I'm a data scientist and researcher at the University of Washington. 

(TRANSITION TO AGENDA SLIDE)

If you have any questions or comments or want to chat latter, I'm @DevNambi on Twitter, and there's my email address. Please feel free to email me.

We will be looking at some of the basics of making decisions, and then 3 common, (TRANSITION) headache-inducing problems: cars, houses, and health. We'll see how to use data to make better choices. Let's get started.

(TRANSITION TO DECISION ENGINEERING SLIDE)

## Decision Engineering, 3 minutes (4)


* Everyone makes decisions using data. 
* You do it all the time. We adjust how much we spend based on our bank balance and income. 
* We try different restaurants, and conferences, based on what we hear from friends and colleagues, and in reviews.
* Really trying to do is make *better* decisions using data. 
* All decisions have a few things in common...

#

1. Trying to solve a problem. If there's anybody here without any problems, go away. Better yet, come up here after so we can trade places.
2. We have Constraints. We never have perfect outcomes, because inevitably there are trade-offs and options that aren't available to us. These constraints are often defined by the problem we're trying to solve. We'll see examples of this later.
3. Next, they try and answer a question. What we're trying to do is turn a problem we have into a question we can answer. This is where we can be clever, because some questions lead to more accurate answers and can be answered with data.
4. Lastly, practically all decisions involve looking at the ratio of cost to value. Cost here isn't just money, and value isn't just profit. They can be many different things.

(TRANSITION TO NEXT DECISION ENGINEERING SLIDE)

To get to that outcome, we have tools we can use.

1. We have Data. It's a raw material we can mold with our curiosity to answer questions.
2. We have Time. We can spend time and effort in order to make a decision and hopefully gain something valuable.
3. And, last but not least, we have Brains. When I say brains, I mean we have skills and most importantly we have curiosity to work at a problem until we find a solution.

(TRANSITION, ANALYSIS PARALYSIS)

**Analysis Paralysis**

Unfortunately, tools and a goal aren't enough. A common failing of new analysts is to be too ambitious in their work and to overthink things, so they get stuck. 

Trying to come up with the perfect answer is a great way to never complete anything.

(TRANSITION)

**Take the problem in steps**

Instead, we should tackle any decision problem in steps.

First, we should identify a question. At the very beginning, it's a vague question. Then we collect data and do research. Finally we do some analysis with what we've collected. 

At that point we have a choice. We can either go one level deeper, and try to refine what we've done, or we can stop (TRANSITION).

Oh, and we don't spend equal amounts of time on these. There's been a lot of research on how scientists and analysts do their work, and any cycle like breaks into 10% question (TRANSITION), 80% collecting/cleaning up data (TRANSITION), and 10% analysis (TRANSITION).

OK, enough theory. Let's jump into a real problem, one people absolutely hate...buying a car. 

(TRANSITION, CARS)

## Cars, 15 minutes (19)



People enjoy this process about as much as oral surgery or the U.S. Congress. It's expensive, emotional, and the process is very vague, so it's easy to feel like you're getting ripped off.

Let's look at it as a problem we can solve using data.


**PROBLEM**

We can start by defining the problem as "I need a new car", when a more accurate statement is "I need to be mobile to commute and be social." This way we can look at other options, like public transportation (TRANSITION) and cycling (TRANSITION). A thorough analysis would look at those options, but this is a short presentation.

So for now, let's stick with cars.


**Constraints**

So, what are the constraints for buying a car? What are some of the fundamental behaviors that we have to deal with?

* Not all cars are created equal. They differ in features, quality, safety, and especially reliability.

* All of them wear down. They're machines. They have a finite lifespan; it's rare to hear of a car that lasts more than 300K miles or so, although cars with 200K miles on them are becoming fairly common.

* The biggest expense is the car itself; it's not gas, or insurance, or repairs, it's the cost of purchasing the vehicle.

Let's quantify that, using data.

(DEMO, SWITCH TO TABLEAU, AGE-VS-PRICE, DEPRECIATION MAKE)

* Cars: the price of a car drops by 15-25% each year for the first 5 years. 
* People normally drive around 12K miles a year. 200K mile car that's driven 12K miles a year will last around 16.6%. 5.9% a year.

(SWITCH BACK TO POWERPOINT)

One other constraint: most cars are purchased within 100 miles of where the owner lives. It's pretty rare to get a car from further away.


**QUESTION**

OK. Now that we've defined the problem and looked at constraints, let's come up with a question. 


A very common question is "What's best price of a new car?"

A refinement of that is "What's the best new car for my needs?"

A refinement of that is "What's the best car, new or used, for my needs, that's on sale right now within 300 miles?" Oh, and that costs less than 20K.

Notice that "best" implies a value of some kind.


**RATIO OF COST:VALUE**

Our question asks "what's a good deal". A 'deal' is one where there's high value for low cost. So we need to define cost, and value.

Cost is easy. It's not just purchase price. It's also the cost of maintenance, insurance, and gas. Any DBAs in the audience will be very familiar with the concept of TCO; total cost of ownership. 

Value, though, is harder to define.  It's the value proposition of a car; it's transportation that saves time/energy compared to walking.

One simple way is the number of miles it can take us before it dies. 

The ratio of cost:value is therefore the # of expected miles vs. its total cost of ownership.

We can simplify this to $ per expected mile. 


**Data**

* Car advice sites
* Information about which brands die off.
* Information about depreciation rates.


**Time**

What we should do is limit ourselves to a reasonable amount of time. The rule I use is my hourly rate X 10, which is about $400/hr. For me, for a $25K to $40K car, that comes out to around 62-100 hours, which is a week's worth of evening and weekends. 

Let's break that into 3 iterations: car models, car age, and specific cars.

(TRANSITION)


#### Round 1: Car Makes & Models

Right now you can buy over a thousand different car models. Some are brand-new, some are a bit older, but you can find all of them.

That's a lot, so we have narrow down the field. Luckily, most of us can do this pretty easily. 

(DEMO) Car makes and models in Excel

* Ensembling
* Conditional formatting in Excel
* Eliminating bad options vs. picking good ones

**Ensembling** a.k.a model averaging or bagging.

***Big problem***: How do we choose what make and model of car to buy? 
   * We know some reliable brands. Honda and Toyota are famous.
   * We ask our friends, family, neighbors, coworkers.
   * We rely on what has worked before. 

Anyone who followed the US presidential election last year, this is what Nate Silver did to predict the outcome of all 50 states.

* This problem comes up all the time, in politics, medicine, finance, even cooking. Nobody has all of the information and no bias, but *collectively* there's enough information and the bias can average out. 
* Simple way: find the ratings from major car sites and average them. This is more reliable than any single site alone.

I did this for small cars & sedans last year.

* When there is no single reliable source of data, use the aggregate of different sources. 
   * Combining the ratings of 10 different car-review sites is more accurate than the ratings of any single site.


#### Round 2: Age

(SWITCH TO TABLEAU, COST PER MILE, TCO PER MILE)

* Eliminating bad options vs. picking good ones
* Diminishing returns
DEMO - ROI, diminishing returns, cost:value


#### Round 3: Specific cars for sale

(DEMO, SWITCH TO EXCEL)

Specific cars. Filter #3
"Seattle is the dumbest place to buy a Prius"

**Transition**

Recap: what did we learn?

* Constraints
* Ratio of Cost:Value
* Time 
* Questions
* Data
* Iterate
	* Car models
		* Ensembling
	* Car age
		* Scatterplots and ratios
		* Percentages
		* Manipulate numbers based on questions

So now let's jump to our next section, houses


## Houses, 10 minutes (29)


**PROBLEM**

Need a place to live.

(TRANSITION)

Some place like that. That'll do.

(TRANSITION)

**QUESTION**

* "Where the heck should I live?"
* "What apartments are available to rent near San Francisco?"
* "What's best place for me to live that's available for rent in the next 45 days?"

**Constraints**

* Location
* Schools
* Size

(TRANSITION)

Here's a graph of San Francisco rent prices.
Predictive analytics - we can predict it going up

It's gone from 2600 to 3800 in 2 years 

600 a year. That's about 16% rate increase.

(TRANSITION)

Here's San Francisco's income 

We've gone from about 26000 to 61000 in '95 to 2012' - 17 years
Goes up about $2058 a year. That's about 3-4% a year.

How does rent go up 4X faster than income for an entire city?


(TRANSITION)

Here's another graph we can do predictive analytics on - house prices

(TRANSITION)

...and we can see how well *that* would have worked. 

(TRANSITION, RENT IS TOO DAMN HIGH)

Law that never changes in housing - house prices and rent prices move relative to income.

(TRANSITION, ELEPHANT IN THE ROOM)

It's an elephant in the room.

Not talking about buying a house

(TRANSITION)


**RATIO OF COST:VALUE**

* Cost - time to pay for a place, plus time to commute to work for that time. 
* Value - quality of life. Size. Amenities. School quality. We'll get back to that.


**Data**

* Information about neighborhoods.
* Information about rent prices/options
* Information about commute times

**Time**

* It's not uncommon to spend $20K to $35K a year on rent in the Bay Area. 
* Comes out to 50 to 88 hours each year, if I'm renting a house.


**ITERATE, ITERATE, ITERATE**

**Iteration 1**

(SWITCH TO EXCEL MATRIX PRIORITIZATION)

* DEMO - Matrix prioritization

(TRANSITION)

* There is one thing you always spend, and never get back. 
* One metric to rule them all. 

(TRANSITION)

Time.

(TRANSITION)

**Iteration 2**

(SWITCH TO TABLEAU)

* Time value of each place
* Tableau presentation


**Iteration 3, Specific Apartments (skipped)**


(SWITCH BACK TO POWERPOINT, TRANSITION)

Now let's jump into health. We've talked about how we're spending our time. Let's see if we can get more of it.


## Health, 10 min (39)


**PROBLEM**

* "How many people trust doctors to do what's best for their health?"
* "How many people trust doctors to find the best balance of health and price?"
* We want to be healthy all the time, for as long as possible.
* When we get sick or hurt, we want to recover as quickly as possible.
* We don't want any chronic diseases or conditions.

(TRANSITION)

**Constraints**

* Not this guy again!.
* There's one big elephant in the room.

(TRANSITION)

* Most of the health-care system pays for diseases that are largely preventable.
* Lifestyle diseases
* Preventable by good nutrition and exercise

(TRANSITION)

**QUESTION**

* Business cat is right. 
* Trying to think of ways to reduce medical costs isn't the right approach
* "How can we make the medical system more efficient?"
* "How can we make the medical system unnecessary for lifestyle diseases?"
* "What are the best exercises for me?"
* "What are ways that I can eat healthier food without hating my life?"

(TRANSITION, ROI OF HEALTHY LIVING)

Let's look at *exercise as a data problem*

**CONSTRAINTS**

* People start an exercise, and then stop
* Sports are seen as expensive
* Some sports are culturally specific (football, hockey)
* Limited willpower, especially at first.
* Habits take 6 months to develop in our brains. So something has to be fun for at least the first 6 months.

**QUESTION**

* "Where's a good gym?"
* "What exercise is best for me, that I will keep doing?"


**RATIO OF COST:VALUE**

Cost: wasted time + money.

Value: time spent exercising X how much you enjoy it.

**Data**

* Lists of sports
* Cost of each. Lots of Google searches.
* Weather data about your city. 

**Time**

* Let's say we're trying to avoid heart disease and diabetes
* $19K a year. 
* 10X time, comes out to 47.5 hours *per year* spent analyzing exercise.
* $19K is about 475 hours of your time. So if we can exercise less than 475 hours a year, we'll come out ahead.
* 1 hour a day of exercise pays $52 an hour in avoiding (19K / 365)

**ITERATE, ITERATE, ITERATE**

**Iteration 1**: list of sports and prices

* Sports Dash
* Price Dash

**Iteration 2**: prep time and ROI

* Time Dash
* Time v Price Dash
* Time ROI Dash

(SWITCH BACK TO POWERPOINT)

**3 min conclusion** (47)


## Conclusion, 3 min

Go over core steps in a data problem again


* **PROBLEM** - Have a problem.
* **CONSTRAINTS** - learn about things. News/blog posts
* **QUESTION** - be precise. Question assumptions.
* **RATIO OF COST:VALUE** - always think about metrics
* **Data** - 80% of the work. Data cleansing. Ensembling.
* **Time** - limit yourself. 80/20 rule.
* **Brains** - be curious
* **ITERATE, ITERATE, ITERATE** - until you run out of time, or are satisfied.


**Techniques**

* Ensembling
* Matrix Prioritization
* Visualize everything
* Manipulate numbers
* Linear regression
* Choosing metrics

(TRANSITION)

## Q&A, 13 min

(TRANSITION)

Make sure you fill out an evaluation, enter for the chance to win some fun stuff!