---
title: "Test Legacy Code"
date: 2022-05-29T09:31:19+01:00
images: []
categories: []
tags: ["TDD","TestDrivenDevelopment","Java","Maven","Tests","LegacyCode"]
authors: ["fanjups"]
---


I remind myself that 7 years ago I didn't know TDD (Test Driven Development). What's funny is that I heard the word "TDD" for the first time while being interviewed 😂, Genius  👏👏👏! I was just testing manually.

As an app, I updated myself since then.

2 years ago, I got a legacy project from a friend. It didn't even use a code management tool like Maven so I began by turning this Java project to a Maven one.

**Then, the big question : HOW TO TEST IT ?**

I was figuring out  how to add  tests. It was really tough. **How to test without breaking anything ? How to test a project I have never seen before ?**

This book from Lasse Kokela helped me to do that. It's a game changer 💯 :  https://www.manning.com/books/test-driven

I will share what I learned from this book in order to add tests to legacy code.

1- It is really simple, first just create an interface **IFeatureClass** from the production ready class **FeatureClass** already present in your codebase.

IDEs have this option _"Extract an interface from ..."_. Now, you have 2 classes : the interface and your production class implementing.

`class FeatureClass implements IFeatureClass { }`

2- Then, create another class **FeatureClassTestEnv** extending that feature class **FeatureClass.** This new class represents the feature class in the test environment.

Here, it's up to you to override what's necessary. Maybe, you'll override the Database connection method in order to use a list of objects instead of the production database.

`class FeatureClassTestEnv extends FeatureClass { }`

At this stage, you have 3 classes.

Finally, you will create a 4th class **FeatureClassTests** containing your tests.

```
class  FeatureClassTests {


    IFeatureClass features = new FeatureClassTestEnv();

// Write your tests here

}
```
