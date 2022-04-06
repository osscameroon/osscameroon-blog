---
title: "How to Build an Oss Project"
date: 2022-04-04T15:22:02+02:00
categories: [opensource]
authors: [Elhmn]
---

Our goal in the osscameroon community is to build the open-source solutions our country needs. Unfortunately, building open-source solutions can be pretty challenging. Thus, we will share a few recommendations that we believe can help you bring a project to fruition.

#### The team

It is essential to keep the team working on the initial phase of the project small. Depending on the project's complexity, the team should be composed of 1 to 3 people.

- For a very simple project, meaning that it is not made up of several components, an API + mobile or web user interface, for instance, a single developer is enough.

- Suppose your project requires several components or services, such as a typical frontend + backend app. In that case, you can add a developer and split the work between the frontend and backend to reduce friction. The team may also require a designer, in which case there will be the 3rd member of that small and effective team.

- It might be possible to have teams of 4 to 5 members. We do not recommend having teams of more than 3 people, but make sure you have at least a person doing the vital project management work.

#### The Scope

Incentives to work on an open-source project can evolve, and it can be challenging to keep your motivation strong to release a project. Something that can help you move forward is to size the first release of your project to something that can provide the most value in the shortest amount of time.

**Example:**

We wanted to build [jobsika](https://github.com/osscameroon/camerdevs), a platform that will allow developers to share their salaries, review and rate their experience when working for companies, and share their availabilities for jobs. Here is what we did to scope down the project.

**Drop what’s unnecessary:**

The platform could be something that would allow developers to log in, edit their profiles, add a biography, and then drop a review. We could also enable companies to create and edit a company profile, share job descriptions, etc.

You may have understood it already, but many of the features listed above are not absolutely necessary. For example, we don’t need a login system for users to drop salaries and reviews.

**Focus on providing value:**

Limiting the features to what provides immediate value to the user is vital. For example, we built the platform for developers so that they can have an idea of what salaries they could ask for, depending on their work experience. We also wanted them to have a rough sense of how a company treats its developers.

This meant that everything related to the company profile and job listing could be added later to the project but was not essential to provide value to the users.

**Work on minor tasks:**

We often work on open-source projects in our spare time, a few hours a week for most of us. Unfortunately, depending on how we scope our tasks, it can take between a week to several months to get a feature completed.

A significant advantage of aiming to work on smaller tasks is that you might define tasks that are manageable in a few hours. Your team needs to see some progress, and working on smaller tasks will allow you to see the evolution of the project every week in the best case.

When defining tasks or creating issues for your project, we recommend breaking them down to the smallest entity possible. For example, start defining high-level goals or tasks like building the static home page, but then break it down to more minor issues such as:

- Create the search bar static component
- Create a component for a single item on a list
- Create the list component
- Make the search bar dynamic (make the actual search button search something)
- Etc.

#### The process

Following the evolution of the project, keeping the communication flowing in the team and setting realistic milestones are crucial for your project to be completed.

**Track the evolution of the project:**

It is important to set a **daily, weekly, or monthly catch-up** during which you can go through the issues you have created and discuss the evolution of the project. For **jobsika**, we have set a weekly meeting that was sometimes canceled as some of us were busy during specific periods.

Be mindful of other people’s time. It is acceptable for your collaborators to show up at a meeting with no work to report. They were probably busy or not inspired. What is essential is not to lie and be transparent about what you have accomplished. In some cases, a contributor won’t be productive for about two months or not be very present. Their motivation to work on the project might be in question, which should be discussed with them. They might need to quit the project for a while.

Track issues using [GitHub projects][1]. You can also use a kanban board during your daily or weekly catch-ups. We use GitHub projects to track [the roadmap][2] at **osscameroon**. So feel free to check it out for inspiration.

**Keep the communication flowing:**

Once you have formed a team to work on your project, it can be helpful to create a chat group for you to share information, ask for help, and discuss everything related to the project.

For **jobsika** and other projects at osscameroon, we created telegram groups. Using telegram group helps us kick off instant voice chat, which is pretty neat.

**Setting realistic milestones:**

As we discussed already, keeping your team motivated will be challenging and making sure you see important results quickly will be critical.

Developers tend to be very optimistic about how long a task will take. For example, let’s say a developer picks up the implementation of a search bar. In their mind they will think it is a 1h work. If you give them one week to work on such a task, they might wait for the last hour before the meeting to start working on the actual ticket. And might realize that they did not consider the filters in the search bar. This means you need more time to deliver that essential feature.

We don’t have an appropriate solution for that yet, but something that can help speed things up is to set a milestone that can match the 4-5 hours a week each team member can provide. So arbitrarily, we could say that for a single developer working 5 hours a week implementing a well-scoped (removed of unnecessary features) home page can be achieved in a month.

You could then expect the home page to be ready in a month, but as we often observe 99% of the time, this won’t be true. But at least you might have something close to a fully functional home page.

#### The Architecture

Regarding the architecture of your project, the keyword here is **simplicity**. As developers, we often like to work on complicated systems, implement challenging algorithms and use the new fancy DevOps practices or tools (Kubernetes) we saw on Twitter. These are all noble things to thrive for, but they come with a cost.

When we start a new open source project, we are excited about the problem we want to solve, the challenges we want to face, and what we will learn. This keeps us motivated long enough to release the project, but users start submitting feature requests or pointing out bugs as long as the project is out there. These incentives are not sufficient anymore, and the nice and fun development becomes a long-term maintenance chore.

Building applications made of multiple components in a microservice architecture with a database or a Saas solution comes with a few operational challenges and costs that should not be overlooked. The way you architecture or write your code and the technologies you choose might also harm the long-term maintenance of your project.

Maintaining an open-source project is a long-term commitment. And keeping things simple will considerably improve first-time contributions and your motivation to maintain your projects.

**How to keep things simple:**

- **Build a monolith** by default. Sometimes you might want to split your frontend and backend to ease the development of your team. It is totally fine. But build a monolith as far as the backend is concerned.

- **Mono repositories** are crucial to keep your application code at hand. It is easier to know where things happen when they happen in one place.

- **Avoid Saas.** Using subscriptions Saas like [Firebase][3], [MongoDB Atlas][4], or something not already used by the community can make operational work difficult. If you absolutely think you need a saas subscription [contact us][5], we will probably try to convince you that you don’t, but we are open to changing our mind or getting it for you.

- **Avoid self-managed Databases** as they require a massive amount of operational work. Generally speaking, we recommend you design your application using file **databases** like a YAML file or SQL-lite. [camerapps][6] is an excellent example of an application that uses a YAML file as a Database. We are working on making more use of SQL lite.

- **Ask for a managed Database** we acknowledge that it might be essential to spin up a database for a few projects. If you think your application needs one [talk to us][7], we think it probably doesn’t, but we are open.

- **Write code for humans**, write code others will understand, and don’t try to prove a point by using nested ternaries or comprehensions, complicated OOP design patterns, or fancy architectures. Good patterns, abstractions, and architectures emerge while writing something functional and straightforward. Code readability and maintenance come first. Keep that in mind.

- **Use automation to enforce Architectural decisions.** You can use [GitHub Actions][8] to add checks to enforce linting, run unit or integration tests, and enforce the use of [conventional commits][9] before the code gets merged.

- **Write tests**. Please do. It will help you better architect your code and maintain it in the future.

#### Deployment

To deploy your application, we recommend these solutions:

- **Use** [**GitHub Pages**][10] if you are working on a simple frontend application. A collection of restaurants, for instance.

- **Docker containers** are the recommended way to package your application. If you have a workflow that generates a Docker image, we can use our artifact management system to deploy your application on our servers.

- **Traditional Apache or APM** deployment, we also provide GitHub Action workflows to deploy your applications on Apache and APM.

We are currently working on improving the automatic deployment of our solutions, and you can read [this architecture draft][11] for our artifact management system. It is already used to deploy **jobsika**, but we will share more about that in the future.

### Conclusion

It is fun to work on new projects, we solve problems in our communities, we learn new things, and work with outstanding engineers. But if we are not careful, this work can quickly lead nowhere, and our projects become a pain to maintain in the future. We hope these few recommendations will help you believe that building an open-source project with a community of passionate developers is possible.

Now feel free to check out our list of [project ideas][12], build a team if necessary and start working on it.

[1]: https://docs.github.com/en/issues/trying-out-the-new-projects-experience/about-projects
[2]: https://github.com/orgs/osscameroon/projects/4
[3]: https://firebase.google.com/
[4]: https://www.mongodb.com/cloud/atlas/lp/try2?utm_source=google&utm_campaign=gs_emea_germany_search_nbnoncompetitor_atlas_desktop&utm_term=firebase&utm_medium=cpc_paid_search&utm_ad=e&utm_ad_campaign_id=12314592846&adgroup=133214220641&gclid=CjwKCAjwrqqSBhBbEiwAlQeqGpMNz9_UotyJFwj_vvReJ2aaDG7ZevkrxlprDrea47UuYpGMVchTRBoC7vkQAvD_BwE
[5]: https://t.me/+UpKZh_KXTaTx7JD7
[6]: https://github.com/osscameroon/camerapps.com
[7]: https://t.me/+UpKZh_KXTaTx7JD7
[8]: https://github.com/features/actions
[9]: https://www.conventionalcommits.org/en/v1.0.0/
[10]: https://pages.github.com/
[11]: https://github.com/osscameroon/sami/blob/main/Architecture.md
[12]: https://github.com/osscameroon/project-ideas
