+++
title = "The value and opportunity of Data Engineering "
description = "What is data engineering, why is it valuable, and where are its exciting frontiers?"
category = "Data"
tags = ["data engineering"]
date = 2020-02-02
draft=true
+++

A few years ago a colleague of mine explained to me how, when asked about his
role, he would glibly respond with something along the lines of: "i do things
with computers". At the time this sounded fairly reasonable. I too have fun
doing things with computers and will always consider myself somewhat of a
generalist technologist.

However, out of all the projects I have worked on, I have begun to realise that
it's the ones that are in some way data intensive that particularly hold my
interest. After some thought I have decided to embrace this and take on data
engineering as a full time role.

While this is not the first time I have held the data engineering job title,
working in tech consulting has broadened my horizons on the various challenges
folks have getting value from there data and I find myself returning to the
role with newfound enthusiasm.

The goal of this post was to share with you why I think data engineering is a
pretty exciting discipline. But, truth be told, as I starting writing I had a
minor identity crisis around what exactly my role as a data engineer should
entail, so first, lets explore some definitions. 

Data engineers have been variously described as being responsible for:

- Building and maintaining data pipelines.
- Ensuring data is clean, reliable and accessible.
- Using distributed computing to solve data intensive problems.
- Working with data scientists to deploy machine learning solutions. 

Is this a fair characterisation? Well, sort of. The above responsibilities do
describe activities that both myself and colleagues of mine have carried out
while working under the umbrella of data engineering. However, this explanation
doesn't really touch on  _why_ we do this work. Why do we build pipelines,
optimise queries and scale out clusters? To what end are we working towards?
Here is my attempt as defining data engineering in terms what it enables.

> The practice of building software that can reliably distill data into a
> meaningful form, such that a human or machine can easily make a decision
> and/or take an action.

Ultimately, it's a lot easier to demonstrate value when you make people feel
empowered to confidently make a decision, or at the very least, reduce
uncertainty. I wouldn't even suggest we necessarily need super sophisticated
techniques to do so either. Never underestimate the power in having the right
data in the right place, with even some super basic analysis.


This definition is could also perhaps apply to data science, but I think that's
OK given the highly complementary nature of these two roles. In fact, as a
colleague of mine helpfully pointed out, if the act of "distilling data" is is
orthogonal (i.e not exclusive to data engineers or scientists), then the role
of the data engineer is about doing so with a focus on reliability, data
quality and data availability. I agree with this and think a key enabler for
doing so is to bring all the principals we know and love about making high
quality software to the realm of data. This includes practices like test driven
design, domain modeling, observability, etc. I would also make case that that
in certain circumstances data engineering also entails building platforms to
enable economy of scale. (The [Data Mesh][1] architecture is a great example of
how to do this elegantly)

So now we have a bit more of an understanding of what data engineers are
responsible for, lets explore some of reasons you might consider pursuing it as
a role. Here are some of the things that motivated me.

1. Close to the domain

   Unlike my previous role as an infrastructure developer\*, data engineering
   fully immerses you into whatever domain you are operating in. Calculating
   sales forecast for a supermarket? You are probably about to learn a fair bit
   about the economics of avocados. Building a routing service to plan
   journeys? You run the risk of eventually becoming somewhat of a train geek.  

   Every dataset has its own quirks. For example, while working with in
   automotive retail I uncovered some quite interesting "rare colours" of car.
   (i.e. colours that only appear once in a dataset of several million cars).
   I was amused to discover that car manufacturers would do things like
   describe a completely unremarkable SUV as being "Mystic Beige".

   I love finding a weird outlier in the dataset and trying to the story behind
   it. _"What on earth happened here, did a single customer really order 187
   mangos?"_ Working in data is rewarding for those who are fundamentally very
   curious.

   Also, its gratifying to see users glean insights from data you have
   delivered to them. This is great, both because its a valuable form of
   feedback, but also but its easy to see the impact of your work.


   \* _Big respect for infra-devs, this work is super valuable, sometimes under
   appreciated and so so vital to get right._

2. But still close to the metal

   Ultimately, all data, whether the colour of a car, or a count of mangos
   sold, is stored a series of bit and bytes in one or more computers. While I
   enjoy indulging in the aforementioned data-curiosity, I also find a lot of
   satisfaction in learning about the lower-level mechanics of how these values
   move about the computer. Not always, but often enough, having some
   appreciation of this can also be particularly important when designing and
   implementing data solutions.

   There are all sorts of cases where this applies. Maybe the data is big,
   maybe the data is small but computationally expensive. Perhaps the data
   needs to be fetched from a distant machine running a strange and arcane
   legacy system. In these situations where performance starts to matter we
   need to pay attention to how the shape of the problem we are solving
   intersects with the strength and weaknesses of the hardware we are building
   on top of.

   This concept of designing software to take into account the design of the
   underlying hardware is sometimes expressed as "mechanical sympathy". This
   term was popularised by [Martin Thompson][2] and attributed it to the
   Formula 1 racing champion Jackie Stewart, who "believed the best drivers had
   enough understanding of how a machine worked so they could work in harmony
   with it".

   We can use this principal to guide many of the design choices we make when
   coming up with solution. For instance:

   - Data locality and [latency][3]: Are we fetching data from the CPU cache,
     memory, disk or network?
   - Memory vs computer trade-off: It is more efficient to pre-calculate values
     at the cost of use more memory?
   - Parallelism: Would this be faster if we took advantage of more CPU cores?
   - Data oriented programming: Should my collection of data be represented as
     an array of structs, or a struct of arrays? Would vectorisation be faster?
   - Database choice: Is this database technology designed for analytical
     workloads. What indexes should we use?
   - Lazy evaluation: Can we process the data as a stream instead of loading
     the entire data set at once?

   Even when performance isn't as much of a concern, there are still compelling
   economical and ecological arguments to be made for being at least mindful of
   this and writing software that uses less resources.
   

3. In demand

   Ha ha ha

4. Lots of room for innovation

   Yay yay yay

TODO: Talk about forgoing expensive vendor stuff.

What I like about focusing on end outcome, is we can be quite opened minded
about our approach to building solutions. For example:

- Maybe data engineering is less about owning _all the pipelines_ and instead
  finding ways to empower developers to better shape the data flowing from
  their products.
- Perhaps instead of struggling to "clean" data, we focus on using domain
  driven design techniques to ensure data is coherently mapped from one domain
  to another.
- Could we solve the problem with a small python script instead of a
  distributed computing framework?

So, what makes this a compelling discipline to invest in?

*Close to the domain.*

*But still close to the metal.*

*Increasingly in demand.*

*Lots of room for innovation.*

Rust
Arrow


[1]: https://martinfowler.com/articles/data-monolith-to-mesh.html
[2]: https://mechanical-sympathy.blogspot.com
[3]: https://gist.github.com/hellerbarde/2843375
