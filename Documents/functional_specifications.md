# A) Document Control
## 1) Document Information
| Document Owner | Mathis KAKAL |
|---|---|
| Issue date | Friday, May 25th 2024 5pm |
| Document Name | Functional Specifications |
## 2) Document Approval
| Role | Name | Signature | Date |
|---|---|---|---|
| Project Manager | Victor LEROY | | 05/24/2024 |
| Program Manager | Mathis KAKAL | | 05/04/2024 |
| Tech Lead | Grégory PAGNOUX | | 05/04/2024 |
| Software Developer | Laurent BOUQUIN | | 05/04/2024 |
| Technical Writer | Benoît DE KEYN | | 05/04/2024 |
| Quality Assurance | Aurélien FERNANDEZ | | 05/04/2024 |
# B) Introduction
## 1) Project Overview
This document aims to document and highlight the preliminary work undertaken for the "Adopte un Candidat" project in ALGOSUP, in partnership with MEMEDIA and WE ARE EVOLUTION, which are company branding agencies based in Chateauroux whom also feature other locations in France. 

Company branding agencies such as MEMEDIA and WE ARE EVOLUTION seek to help companies develop a more attractive brand identity in the eyes of the public. 
However, in the context of this project, our goal, as discussed with the customer, will be to focus mainly on explorating new and innovative means to match HRs/Recruiters and Job seekers/Candidates from a fresh new perspective. 

Indeed, the client has expressed their wish for us to spend more time on conducting thoughtful research and design, rather than implementing a non-innovative solution. 

Conducting thorough research in a framework that leaves a less than two weeks for it versus the implementation time which is four weeks is a challenging but exciting task that we will tackle with strategic planning, and collaborative effort. 

## 2) Project Definition
### Vision
As mentioned earlier, this project differs from our classic software development project as the customer is more interested in the research and ideation phases than in the development of it, which they know will ultimately take more than 6 weeks to achieve. 

That is why we plan to focus mainly on the front-end development of the app, to maximise the amount of novel features we can showcase, leveraging local storage and hardcoded content, rather than setting up the app to work on a production-ready server (which we don't exclude doing if we are ahead of schedule). 

More thought will be put in interactions and user experience, rather than on traditional non-functional requirements such as availability, security, scalability and so on. 

Finally, the customer expressed their will for us to come up with an entire brand identity for this new product. 

### Objectives

The exact brief for the project is: 

> *Adopte Un Candidat is a « Tinder style » recruitment application that matches companies with jobseekers in a different way. The app will need to be available on phone, tablet and computer.*

The goal is therefore to create an app that deviates from the conventional Job matching apps. Those pure players that dominate the industry usually take the shape of job listing boards sometimes with advanced research features. (see Benchmark)

The project brief mentions that one of the main points that we should tackle with this project is to give the candidates the ability to express themselves in an authentic manner, without revealing any personally identifiable information (PII), to avoid discrimination based on their gender, age, origin etc. 

All in all, the customer has remained vague on may implementation details which gives us a lot of creative freedom, you can however, review the entire project brief following <ins>this link</ins>

Finally, the technology to meet the multi-device requirement has already been chosen by the project overseer, Franck JEANNIN. It is going to be developed in Flutter, which is a framework maintained by google that allows fast paced multi-device devlopment with a single codebase. 

### Scope

| In Scope |
|---|
| Delivering a single codebase multi-platorm ^^MVP^^ |
| Focusing on exploration of novel features |
| Anonymisation of candidates |
| Matching Candidates with companies |
| Allowing both candidates and companies express themselves with elaborate profiles and user generated content |
| Delivering the project with a custom-made brand identity |
| Support different recruitment scenarios: some recruitment can be done through messaging, some needs an actual appointment to proceed |
| Focus the app on matching the soft skills both required by the company and soft-skills entered by candidates |
| Create/Ideate a platform that has to potential to reach a global market |

| Out of Scope |
|---|
| Delivering a production-ready product |
| Making another "Pure Player" Job board |
| Including Personally Identifiable Information (PII) of Candidates in the app. |
| Focusing on Diplomas and Professional Experience |

### Milestones

| Milestone | Deadline |
|---|---|
| Functional Specifications V1 | Friday, May 24th 2024 5pm |
| Technical Specifications V1 | Friday, June 7th 2024 5pm |
| Test Plan | Friday, June 7th 2024 5pm |
| MVP | Friday, June 14th 2024 5pm |
| User Manual | Friday, June 14th 2024 5pm |

# C) Functional Requirements
## 1) What are Job Dating apps?

This section is important to justify the decisions that were made, but you may skip to  <LINK TO PERSONAE> if you are only interested about the implementation. <MAKE AN ADMONITION NOTE>

### History/Context

The job recruitment market has been around since the 1990s, where forums and Bulletin Board Systems (BBS) saw the emergence of many job offers, most notably for IT positions. In 1994/1995, Monster.com and CareerBuilder emerged, pioneering many of the base concepts that would build the basis of online job listings. 

The 2000s saw the rise of web-based technologies, which created new ways to connect recruiters and candidates, while more niche platform emerged as well, such as Stack Overflow for developers and Behance for creative professionals. 

The following years, up until the 2010s saw platforms integrating more sophisticated technologies such as AI, matching algorithms, and machine learning, while Linkedin famously rolled out its skills and endorsements feature, which paved the way for ^^third-party (peer to peer) verification^^. 

In the early 2010s, the proliferation of smartphones led to the development of mobile apps for job searching, making job hunting more accessible and immediate. In the meantime, Glassdoor famously allowed employees to review companies, providing transparency and helping job seekers assess potential employers' work environments and cultures. 

In the late 2010s, the focus shifted to ^^employer branding^^ to attract top talent. Social media like Facebook, Twitter and Instagram were often used to showcase company culture and values. At that point, Glassdoor reviews and social media presence became crucial for recruitment. 

In the Late 2010s ^^the gig economy^^ grew rapidly, which led to the rising popularity of platforms like Upwork, Malt and Fiverr, which became popular for freelance and contract work. 

In 2020, the covid 19 event accelerated the adoption of remote work and demand for flexibility in job roles. Platforms adapted by highlighting remote opportunities. 

This was followed by a phenomenon called ^^the great resignation^^ which spread worldwide, and which saw a significant shift in job seekers' priorities, with increased emphasis on work-life balance, mental health and job satisfaction. 

Today, as AI and machine learning continue to evolve, with recruitment platforms offering more personalised and efficient job matching. Employer branding remains crucial, with a strong focus on diversity, equity, and inclusion. Job seekers value career development, continuous learning, and a positive company culture more than ever. 

It is exactly in the continuity of this history that "Adopte un Candidat" aims to find its place. 

Sources:
- https://www.welcometothejungle.com/en/articles/dating-apps-for-networking-job-hunt
- https://www.ft.com/content/f2bc1a8c-4fd9-4a70-9fd3-03571ced18f7
- https://www.propellum.com/blog/job-boards-tracing-the-history-and-evolution/

### Benchmark

The Job Recruitment platform market is a very competitive market with many actors ranging from ^^pure players^^ to more niche ones. 

In order to come up with feature ideas for the product and try to understand which feature belongs to which usage/type of user, we will have to conduct a simple ^^benchmark^^ of existing solutions, from a UX perspective (we are interested in features more so than key business indicators). 

#### Traditional Solutions
Here is a list of all the observed companies:  <THE LINK>
What can be drawn from this research is that the market is segmented in three main categories: 

- Job Boards, which are online platforms where employers post job listings and job seekers can search and apply for job openings.
- Professional Networking Sites, which are platforms that focus on building professional relationships and networks, often including job listings and career development tools.
- Niche Job Sites, which specialised job platforms catering to specific industries, job types, or demographics, offering tailored job listings and industry-specific resources.

In terms of demographics, we can see that there are patterns for each category, such as job boards being the most all-encompassing platforms in terms of age, professional networking sites often targeting mid-career professionals and niche sites, depending, well... on the niche. 

From this information we can already make the hypothesis that our app should probably be closer to a job board than to the other categories in terms of feature set, if it were to go global and reach most age ranges. 

>[!IMPORTANT]
> An interesting note to make, is that while many sources declare that soft skills are the future of employment and that they might as well be more important than ^^"hard skills"^^, it is hard to find competitors that capitalise completely on soft skills, the way the customer expects us to do so. 

Sources: 
- https://www.adecco.lu/en-gb/job-seeker-tips/soft-skills
- https://blog.openclassrooms.com/en/2019/01/31/showing-off-your-soft-skills-the-modern-way-to-land-a-job/
- https://blog.hunteed.com/en/soft-skills-recruitment

There are multiple reasons for this, such as: 
- Historical focus on "hard skills", as recruitment has focused on qualifications, experience, and hard skills because these are easier to quantify and standardise.
- Ease of quantification, as "hard skills" are easier to measure and verify. For example, programming languages, certifications, and degrees have clear benchmarks.
- Technology limitations, as gathering reliable data on soft skills is challenging. Interviews, references, and behavioural assessments are not easily quantifiable in the same way as hard skills.

#### Emerging Solutions

However, this doesn't mean that a solution that fulfils our criteria doesn't exist. Indeed, some platforms actually combine novel mechanisms, such as artificial intelligence, neuroscience and ^^gamification^^ to evaluate candidates. 

Here is a list of observed companies: click here <THE LINK> 

After trying out multiple of those services, here is what we can note about their approach and the tools they leverage: 

- The overwhelming use of artificial intelligence and data driven insights about candidates (throughout pretty much all of spectrum). This data is then used to
- The use of ^^psychometric and cognitive assessments^^ (especially Plum.io and Psychometrics Canada, among others) to offer deeper insights into a candidate's personality traits and therefore, suitability for a role.
- The use of gamification (for Arctic Chores and Knack), which provide reliable data on candidates' skills while being fun to play.
- The use of video interviewing along with AI analysis to analyse candidates' verbal and non-verbal communication, facial expressions, and language patterns.

The novel features from those modern-day platforms can be split into two categories: 
- Features enhancing the life of the candidate.
- Features enhancing the life of the recruiter.

Let's review some of those.

##### <ins>Candidate features</ins>

- **Video introductions and interviews**  

Platforms like HireVue and Spark Hire offer this feature.

| Assets | Drawbacks |
|---|---|
| They provide a more personal touch | Can be stressful for candidates who are uncomfortable on camera |
| Allow candidates to showcase their communication skills and personality | May require access to good internet and camera equipment |
| Enables asynchronous interviewing, saving time for both candidates and recruiters | Potential for technical issues or malfunctions during recording or playback |
| Helps recruiters assess soft skills and cultural fit early in the process | May introduce bias based on appearance or speaking style |
| Can be reviewed and re-evaluated by multiple hiring team members | Not suitable for all types of job roles or industries |
| Provides a standardized interview process | |

- **Portfolio and project Showcases** 

Platforms like Behance and Dribble have this.
| Assets | Drawbacks |
|---|---|
| Provides tangible proof of skills and experience | Can be time-consuming to create and maintain |
| Allows candidates to demonstrate their creativity and technical abilities | May require candidates to have design skills or familiarity with portfolio tools |
| Enhances a candidate's application by showcasing real work samples | Potential for plagiarism or copying of work by others |
| Helps recruiters evaluate the quality and relevance of a candidate's work | Not all job roles can be effectively showcased through portfolios |
| Can be easily shared and accessed online | |
| Offers a comprehensive view of a candidate's capabilities beyond the resume | |

- **Cultural Fit Assessments** 

Platforms like Glassdoor and Comparably have this.
| Assets | Drawbacks |
|---|---|
| Helps candidates find roles that align with their values and work preferences | May introduce bias in the hiring process if not properly designed |
| Increases job satisfaction and retention by finding better cultural fits | Can be subjective and difficult to quantify accurately |
| Assists recruiters in identifying candidates who will thrive in the company environment | May exclude qualified candidates who do not fit the cultural mold |
| Enhances team cohesion and productivity by ensuring cultural compatibility | Some candidates may not be fully honest in their assessments |
| Provides insights into company culture for job seekers, aiding informed decision-making | Implementation and interpretation can be complex and resource-intensive |
| Reduces turnover by matching candidates to compatible work environments | Can be seen as invasive or overly personal by candidates |

- **AI-Powered Resume Builders and Optimizers** 

Zety and Resume Worded use that.

| Assets | Drawbacks |
|---|---|
| Ensures resumes are tailored to job descriptions and ^^ATS^^-friendly, increasing the chances of passing initial screenings | May produce too generic resumes if over-relied upon |
| Saves time for job seekers by providing templates and optimization suggestions | Can reduce the personal touch and uniqueness of a resume |
| Helps highlight relevant skills and experiences effectively | May require a learning curve to use effectively |
| Provides insights on how to improve resume content and format | AI algorithms may not always accurately interpret context or industry-specific terms |
| Enhances the likelihood of matching resume keywords with job postings on some platforms | Could overlook valuable experiences or skills not deemed relevant by the AI |

As well as some other features such as career coaching and advice and job application tracking, but that belong to segments that deviate from our goals.

##### Recruiter Features

While the previous features can also be considered as "Recruiter features" the following described features are more focused on the recruiter point of view. 


## 2) Personae

The customer has explicitly mentioned that their target was the global market, which is similar to

## 3) Feature Set 
## 4) Measuring Success 

# E) Appendix
## Benchmark of traditional recruitment platforms
| Platform Name | Country of origin | Platform type | Type of recruitment | Targeted audience age | Is company still active? | Founded in? |
|---|---|---|---|---|---|---|
| Meteojob | France | Job Board | Full-time, part-time | Primarily 18-54 | Yes | 2008 |
| RegionsJob | France | Job Board | Full-time, part-time | Primarily 18-54 | Yes | 2000 |
| Apec | France | Job Board | Full-time, part-time | Primarily 25-54 | Yes | 1966 |
| JobiJoba | France | Job Aggregator | Full-time, part-time, freelance | Primarily 18-54 | Yes | 2007 |
| Kudoz | France | Job Board | Full-time, part-time | Primarily 18-54 | No | 2015 |
| Jobamax | France | Job Board | Full-time, part-time | Primarily 18-30 | No | 2016 |
| Wizbii Jobs | France | Job Board | Full-time, part-time | Primarily 16-30 | | 2010 |
| Shapr | France | Professional Networking App | Full-time, part-time, freelance | Primarily 25-54 | No | 2015 |
| Cadremploi | France | Job Board | Full-time, part-time | Primarily 25-54 | Yes | 1990 |
| Viadeo | France | Professional Networking Site | Full-time, part-time, contract-based, freelance | Primarily 25-54 | Yes | 2004 |
| Fiverr | Israel | Freelance and Gig Platform | Freelance, contract-based, project-based | Primarily 18-45 | Yes | 2010 |
| Linkedin | United States | Professional Networking Site | Full-time, part-time, contract-based, freelance | Primarily 25-54 | Yes | 2003 |
| Indeed | United States | Job Board | Full-time, part-time, contract-based, freelance | Primarily 18-65 | Yes | 2004 |
| Monster.com | United States | Job Board | Full-time, part-time, contract-based | Primarily 18-54 | Yes | 1994 |
| Glassdoor | United States | Job Board with Company Reviews | Full-time, part-time, contract-based | Primarily 18-54 | Yes | 2007 |
| Upwork | United States | Freelance and Gig Platform | Freelance, contract-based, project-based | Primarily 18-45 | Yes | 2015 (merger of Elance and oDesk) |
| CareerBuilder | United States | Job Board | Full-time, part-time, contract-based, freelance | Primarily 18-54 | Yes | 1995 |
| Jobr | United States | Job Search App | Full-time, part-time | Primarily 18-45 | No | 2014 (acquired by Monster in 2016) |
| Cornerjob | Spain | Job Board | Full-time, part-time, temporary | Primarily 18-45 | Yes | 2015 |
| Ahead | Belgium | Professional Networking Site | Full-time, part-time, freelance | Primarily 25-54 | Yes | 1995 |
| Yooture | Switzerland | Job Search App | Full-time, part-time, freelance | Primarily 18-45 | Yes | 2013 |
| Skillue | Switzerland | Professional Networking Site | Full-time, part-time | Primarily 25-54 | Yes | 2016 |
| Astreva | Unknown | Professional Networking Site | Full-time, part-time, freelance | Primarily 25-54 | Yes | 2022 |
| Turing | United States | Freelance and Remote Platform | Full-time, part-time, freelance | Primarily 18-45 | Yes | 2018 |
| Findem | United States | Talent Intelligence Platform | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2019 |
| Talenture RS | India | Recruitment Software | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2009 |
| Fetcher | United States | Recruiting Automation Platform | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2015 |
| Humanly | United States | Recruiting Automation Platform | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2019 |
| Manatal | Thailand | Recruitment Software | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2019 |
| TurboHire | India | Recruitment Software | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2019 |
| Eightfold | United States | Talent Intelligence Platform | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2016 |
| SeekOut | United States | Talent Intelligence Platform | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2017 |
| Stryke | United States | Professional Networking Site | Full-time, part-time, freelance | Primarily 25-54 | Yes | 2023 |
| Angellist | United States | Startup and Investment Platform | Full-time, part-time, freelance | Primarily 18-45 | Yes | 2010 |
| Otta | United Kingdom | Job Search Platform | Full-time, part-time, contract-based, freelance | Primarily 25-54 | Yes | 2019 |
| Simply Hired | United States | Job Board | Full-time, part-time, contract-based | Primarily 18-54 | Yes | 2003 |
| Xing | Germany | Professional Networking Site | Full-time, part-time, contract-based, freelance | Primarily 25-54 | Yes | 2003 |
| Opportunity | United States | Networking and Job Matching Site | Full-time, part-time, freelance | Primarily 25-54 | Yes | 2014 |
| Hired | United States | Job Matching Platform | Full-time, part-time, freelance | Primarily 25-54 | Yes | 2012 |
| Ziprecruiter | United States | Job Board | Full-time, part-time, contract-based, freelance | Primarily 18-54 | Yes | 2010 |
| Dribble | United States | Job Board for Designers | Full-time, part-time, freelance | Primarily 18-45 | Yes | 2009 |
| Behance | United States | Creative Portfolio Platform | Full-time, part-time, freelance | Primarily 18-45 | Yes | 2005 |

## Benchmark of novel recruitment platforms

| Platform | Country of Origin | Platform Type | Type of Recruitment | Targeted Audience Age | Is Company Still Active? | Founded |
|---|---|---|---|---|---|---|
| HireVue | United States | Video Interview and AI Platform | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2004 |
| Koru | United States | Predictive Hiring Platform | Full-time, part-time | Primarily 25-54 | Yes | 2013 |
| Plum | Canada | Psychometric Assessment Platform | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2012 |
| Traitify | United States | Visual-based Assessment Platform | Full-time, part-time, contract-based | Primarily 18-45 | Yes | 2011 |
| Arctic Shores | United Kingdom | Gamified Assessment Platform | Full-time, part-time, contract-based | Primarily 18-45 | Yes | 2014 |
| Knack | United States | Game-based Assessment Platform | Full-time, part-time, contract-based | Primarily 18-45 | Yes | 2012 |
| Berke | United States | Customizable Assessment Platform | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2004 |
| Outmatch | United States | Behavioral and Cognitive Platform | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2015 |
| Psychometrics Canada | Canada | Psychometric Assessment Platform | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 1976 |
| Talview | United States | Video Interview and AI Platform | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2013 |
| Pymetrics | United States | Neuroscience-based Assessment Platform | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2013 |
| Harver | Netherlands | Pre-employment Assessment Platform | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2014 |
| Thymometrics | United Kingdom | Employee Engagement Platform | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2013 |
| Clearfit | Canada | Predictive Analytics Platform | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2006 |
| Vervoe | Australia | AI-based Skills Assessment Platform | Full-time, part-time, contract-based | Primarily 25-54 | Yes | 2016 |
