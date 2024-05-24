<h1 align="center">
 Functional Specifications
</h1>

<details><summary><em><ins>Click here to expand the table of content...</ins></em></summary>

- [A) Document Control](#a-document-control)
  - [1) Document Information](#1-document-information)
  - [2) Document Approval](#2-document-approval)
- [B) Introduction](#b-introduction)
  - [1) Project Overview](#1-project-overview)
  - [2) Project Definition](#2-project-definition)
    - [a) Vision](#a-vision)
    - [b) Objectives](#b-objectives)
    - [c) Scope](#c-scope)
    - [d) Milestones](#d-milestones)
- [C) Functional Requirements](#c-functional-requirements)
  - [1) What are Job Dating apps?](#1-what-are-job-dating-apps)
    - [a) History/Context](#a-historycontext)
    - [b) Benchmark](#b-benchmark)
      - [1) Traditional Solutions](#1-traditional-solutions)
      - [2) Emerging Solutions](#2-emerging-solutions)
        - [Candidate features](#candidate-features)
        - [Recruiter Features](#recruiter-features)
  - [2) Personae](#2-personae)
    - [a) The Jobseeker](#a-the-jobseeker)
      - [1) Entry-level Job Seekers](#1-entry-level-job-seekers)
      - [2) Mid-Career Professionals](#2-mid-career-professionals)
      - [3) Senior-level and executive job seekers](#3-senior-level-and-executive-job-seekers)
    - [b) Recruiters](#b-recruiters)
      - [1) In-house recruiters](#1-in-house-recruiters)
      - [2) Agency Recruiters](#2-agency-recruiters)
      - [3) Executive Recruiters](#3-executive-recruiters)
  - [3) Feature Sets](#3-feature-sets)
    - [a) Feature to problem matrices](#a-feature-to-problem-matrices)
      - [1) Jobseekers' problems](#1-jobseekers-problems)
      - [2) Recruiters' problems](#2-recruiters-problems)
    - [b) Retained Features](#b-retained-features)
      - [1) Most impactful Jobseeker features](#1-most-impactful-jobseeker-features)
      - [2) Most impactful Recruiter features](#2-most-impactful-recruiter-features)
      - [3) Filtering out hard tasks](#3-filtering-out-hard-tasks)
      - [4) Minimum Viable Product](#4-minimum-viable-product)
      - [5) Conclusion](#5-conclusion)
  - [4) Measuring Success](#4-measuring-success)
- [D) Functional Specifications](#d-functional-specifications)
  - [1) Use Cases Analysis](#1-use-cases-analysis)
  - [2) Functional Analysis](#2-functional-analysis)
- [E) Non-Functional Requirements](#e-non-functional-requirements)
  - [1) Usability](#1-usability)
  - [2) Accuracy](#2-accuracy)
    - [a)  Precision and Recall](#a--precision-and-recall)
    - [b) Accuracy](#b-accuracy)
  - [3) Transparency](#3-transparency)
  - [4) Accessibility](#4-accessibility)
  - [5) Compliance](#5-compliance)
    - [a) Personal Data Protection](#a-personal-data-protection)
    - [b) Transparency](#b-transparency)
    - [c) Non-Discrimination](#c-non-discrimination)
    - [d) Fair Access to Employment](#d-fair-access-to-employment)
    - [e) Consent and Right to be Forgotten](#e-consent-and-right-to-be-forgotten)
    - [f) Data Security](#f-data-security)
    - [g) Contractual Obligations](#g-contractual-obligations)
  - [6) Localization and Internationalization](#6-localization-and-internationalization)
- [F) Appendix](#f-appendix)
  - [1) Benchmark of traditional recruitment platforms](#1-benchmark-of-traditional-recruitment-platforms)
  - [2) Benchmark of novel recruitment platforms](#2-benchmark-of-novel-recruitment-platforms)

</details>

# A) Document Control
## 1) Document Information

| Document Owner | Mathis KAKAL |
|---|---|
| Issue date | Friday, May 24th 2024 5pm |
| Document Name | Functional Specifications |

## 2) Document Approval

| Role | Name | Signature | Date |
|---|---|---|---|
| Project Manager | Victor LEROY | ✅ | 05/24/2024 |
| Program Manager | Mathis KAKAL | ✅ | 05/04/2024 |
| Tech Lead | Grégory PAGNOUX |✅ | 05/04/2024 |
| Software Developer | Laurent BOUQUIN |✅ | 05/04/2024 |
| Technical Writer | Benoît DE KEYN |✅ | 05/04/2024 |
| Quality Assurance | Aurélien FERNANDEZ |✅ | 05/04/2024 |

# B) Introduction
## 1) Project Overview

This document aims to document and highlight the preliminary work undertaken for the "Adopte un Candidat" project in ALGOSUP, in partnership with MEMEDIA and WE ARE EVOLUTION[^1], which are company branding agencies based in Chateauroux whom also feature other locations in France. 

Company branding agencies such as MEMEDIA and WE ARE EVOLUTION seek to help companies develop a more attractive brand identity in the eyes of the public. 

However, in the context of this project, our goal, as discussed with the customer[^1], will be to focus mainly on explorating new and innovative means to match HRs/Recruiters and Job seekers/Candidates from a fresh new perspective. 

Indeed, the client has expressed their wish for us to spend more time on conducting thoughtful research and design, rather than implementing a non-innovative solution. 

Conducting thorough research in a framework that leaves a less than two weeks for it versus the implementation time which is four weeks is a challenging but exciting task that we will tackle with strategic planning, and collaborative effort. 

## 2) Project Definition
### a) Vision

As mentioned earlier, this project differs from our classic software development project as the customer is more interested in the research and ideation phases than in the development of it, which they know will ultimately take more than 6 weeks to achieve. 

That is why we plan to focus mainly on the front-end development of the app, to maximise the amount of novel features we can showcase, leveraging local storage and hardcoded content, rather than setting up the app to work on a production-ready server (which we don't exclude doing if we are ahead of schedule). 

More thought will be put in interactions and user experience, rather than on traditional non-functional requirements such as availability, security, scalability and so on. 

Finally, the customer expressed their will for us to come up with an entire brand identity for this new product. 

### b) Objectives
The exact brief for the project is: 

> *Adopte Un Candidat is a « Tinder style » recruitment application that matches companies with jobseekers in a different way. The app will need to be available on phone, tablet and computer.*

The goal is therefore to create an app that deviates from the conventional Job matching apps. Those pure players that dominate the industry usually take the shape of job listing boards sometimes with advanced research features. (see Benchmark) 

The project brief mentions that one of the main points that we should tackle with this project is to give the candidates the ability to express themselves in an authentic manner, without revealing any personally identifiable information (PII), to avoid discrimination based on their gender, age, origin etc. 

All in all, the customer has remained vague on may implementation details which gives us a lot of creative freedom, you can however, review the entire project brief following this link 

Finally, the technology to meet the multi-device requirement has already been chosen by the project overseer, Franck JEANNIN. It is going to be developed in Flutter, which is a framework maintained by google that allows fast paced multi-device devlopment with a single codebase. 

### c) Scope

| In Scope |
|---|
| Delivering a single codebase multi-platorm MVP |
| Focusing on exploration of novel features |
| Anonymisation of candidates |
| Matching Candidates with companies |
| Allowing both candidates and companies express themselves with elaborate profiles and user generated content |
| Delivering the project with a custom-made brand identity |
| Support different recruitment scenarios: some recruitment can be done through messaging, some needs an actual appointment to proceed |
| Focus the app on matching the soft skills both required by the company and soft-skills entered by candidates |
| Create/Ideate a platform that has to potential to reach a global market |
| Conducting UX research on analysing trends and competition. |

| Out of Scope |
|---|
| Delivering a production-ready product |
| Making another "Pure Player" Job board |
| Including Personally Identifiable Information (PII) of Candidates in the app. |
| Focusing on Diplomas and Professional Experience |
| Creating a full-fledged employee/applicant/talent tracking/application system |
| Conducting actual user research to discover features, as the client advised us not to. |

### d) Milestones

| Milestone | Deadline |
|---|---|
| Functional Specifications V1 | Friday, May 24th 2024 5pm |
| Technical Specifications V1 | Friday, June 7th 2024 5pm |
| Test Plan | Friday, June 7th 2024 5pm |
| MVP | Friday, June 14th 2024 5pm |
| User Manual | Friday, June 14th 2024 5pm |

# C) Functional Requirements
## 1) What are Job Dating apps?

>[!NOTE]
>This section is important to justify the decisions that were made, but you may skip to  <LINK TO PERSONAE> if you are only interested about the implementation.

### a) History/Context
The job recruitment market has been around since the 1990s, where forums and Bulletin Board Systems (BBS) saw the emergence of many job offers, most notably for IT positions. In 1994/1995, Monster.com and CareerBuilder emerged, pioneering many of the base concepts that would build the basis of online job listings. 

The 2000s saw the rise of web-based technologies, which created new ways to connect recruiters and candidates, while more niche platform emerged as well, such as Stack Overflow for developers and Behance for creative professionals. 

The following years, up until the 2010s saw platforms integrating more sophisticated technologies such as AI, matching algorithms, and machine learning, while Linkedin famously rolled out its skills and endorsements feature, which paved the way for third-party (peer to peer) verification. 

In the early 2010s, the proliferation of smartphones led to the development of mobile apps for job searching, making job hunting more accessible and immediate. In the meantime, Glassdoor famously allowed employees to review companies, providing transparency and helping job seekers assess potential employers' work environments and cultures. 

In the late 2010s, the focus shifted to employer branding to attract top talent. Social media like Facebook, Twitter and Instagram were often used to showcase company culture and values. At that point, Glassdoor reviews and social media presence became crucial for recruitment. 

In the Late 2010s the gig economy grew rapidly, which led to the rising popularity of platforms like Upwork, Malt and Fiverr, which became popular for freelance and contract work. 

In 2020, the Covid-19 event accelerated the adoption of remote work and demand for flexibility in job roles. Platforms adapted by highlighting remote opportunities. 

This was followed by a phenomenon called the great resignation which spread worldwide, and which saw a significant shift in job seekers' priorities, with increased emphasis on work-life balance, mental health and job satisfaction. 

Today, as AI and machine learning continue to evolve, with recruitment platforms offering more personalised and efficient job matching. Employer branding remains crucial, with a strong focus on diversity, equity, and inclusion. Job seekers value career development, continuous learning, and a positive company culture more than ever. 

It is exactly in the continuity of this history that "Adopte un Candidat" aims to find its place. 

Sources:
- https://www.welcometothejungle.com/en/articles/dating-apps-for-networking-job-hunt
- https://www.ft.com/content/f2bc1a8c-4fd9-4a70-9fd3-03571ced18f7
- https://www.propellum.com/blog/job-boards-tracing-the-history-and-evolution/

### b) Benchmark

The Job Recruitment platform market is a very competitive market with many actors ranging from pure players to more niche ones. 

In order to come up with feature ideas for the product and try to understand which feature belongs to which usage/type of user, we will have to conduct a simple benchmark of existing solutions, from a UX perspective (we are interested in features more so than key business indicators). 

#### 1) Traditional Solutions

Here is a list of all the observed companies:  <THE LINK>

What can be drawn from this research is that the market is segmented in three main categories: 

- Job Boards, which are online platforms where employers post job listings and job seekers can search and apply for job openings.

- Professional Networking Sites, which are platforms that focus on building professional relationships and networks, often including job listings and career development tools.

- Niche Job Sites, which specialised job platforms catering to specific industries, job types, or demographics, offering tailored job listings and industry-specific resources.

In terms of demographics, we can see that there are patterns for each category, such as job boards being the most all-encompassing platforms in terms of age, professional networking sites often targeting mid-career professionals and niche sites, depending, well... on the niche. 

From this information we can already make the hypothesis that our app should probably be closer to a job board than to the other categories in terms of feature set, if it were to go global and reach most age ranges. 

> [!NOTE]
> While many sources declare that soft skills are the future of employment and that they might as well be more important than "hard skills", it is hard to find competitors that capitalise completely on soft skills, the way the customer expects us to do so.

Sources: 
- https://www.adecco.lu/en-gb/job-seeker-tips/soft-skills
- https://blog.openclassrooms.com/en/2019/01/31/showing-off-your-soft-skills-the-modern-way-to-land-a-job/
- https://blog.hunteed.com/en/soft-skills-recruitment

There are multiple reasons for this, such as: 
- Historical focus on "hard skills", as recruitment has focused on qualifications, experience, and hard skills because these are easier to quantify and standardise.

- Ease of quantification, as "hard skills" are easier to measure and verify. For example, programming languages, certifications, and degrees have clear benchmarks.
Technology limitations, as gathering reliable data on soft skills is challenging. Interviews, references, and behavioural assessments are not easily quantifiable in the same way as hard skills.

#### 2) Emerging Solutions

However, this doesn't mean that a solution that fulfils our criteria doesn't exist. 

Indeed, some platforms actually combine novel mechanisms, such as artificial intelligence, neuroscience and gamification to evaluate candidates. 

Here is a list of observed companies: <THE LINK> 

The novel features from those modern-day platforms can be split into two categories: 

- Features enhancing the life of the candidate.

- Features enhancing the life of the recruiter.

Let's review some of those.

##### Candidate features

**Video introductions and interviews**  

Platforms like HireVue and Spark Hire offer this feature.
| Assets | Drawbacks |
|---|---|
| They provide a more personal touch | Can be stressful for candidates who are uncomfortable on camera |
| Allow candidates to showcase their communication skills and personality | May require access to good internet and camera equipment |
| Enables asynchronous interviewing, saving time for both candidates and recruiters | Potential for technical issues or malfunctions during recording or playback |
| Helps recruiters assess soft skills and cultural fit early in the process | May introduce bias based on appearance or speaking style |
| Can be reviewed and re-evaluated by multiple hiring team members | Not suitable for all types of job roles or industries |
| Provides a standardized interview process | |

**Portfolio and project Showcases** 

Platforms like Behance and Dribble have this.

| Assets | Drawbacks |
|---|---|
| Provides tangible proof of skills and experience | Can be time-consuming to create and maintain |
| Allows candidates to demonstrate their creativity and technical abilities | May require candidates to have design skills or familiarity with portfolio tools |
| Enhances a candidate's application by showcasing real work samples | Potential for plagiarism or copying of work by others |
| Helps recruiters evaluate the quality and relevance of a candidate's work | Not all job roles can be effectively showcased through portfolios |
| Can be easily shared and accessed online | |
| Offers a comprehensive view of a candidate's capabilities beyond the resume | |

**Cultural Fit Assessments** 

Platforms like Glassdoor and Comparably have this.

| Assets | Drawbacks |
|---|---|
| Helps candidates find roles that align with their values and work preferences | May introduce bias in the hiring process if not properly designed |
| Increases job satisfaction and retention by finding better cultural fits | Can be subjective and difficult to quantify accurately |
| Assists recruiters in identifying candidates who will thrive in the company environment | May exclude qualified candidates who do not fit the cultural mold |
| Enhances team cohesion and productivity by ensuring cultural compatibility | Some candidates may not be fully honest in their assessments |
| Provides insights into company culture for job seekers, aiding informed decision-making | Implementation and interpretation can be complex and resource-intensive |
| Reduces turnover by matching candidates to compatible work environments | Can be seen as invasive or overly personal by candidates |

**AI-Powered Resume Builders and Optimizers** 

Zety and Resume Worded use that.

| Assets | Drawbacks |
|---|---|
| Ensures resumes are tailored to job descriptions and ATS-friendly, increasing the chances of passing initial screenings | May produce too generic resumes if over-relied upon |
| Saves time for job seekers by providing templates and optimization suggestions | Can reduce the personal touch and uniqueness of a resume |
| Helps highlight relevant skills and experiences effectively | May require a learning curve to use effectively |
| Provides insights on how to improve resume content and format | AI algorithms may not always accurately interpret context or industry-specific terms |
| Enhances the likelihood of matching resume keywords with job postings on some platforms | Could overlook valuable experiences or skills not deemed relevant by the AI |

As well as some other features such as career coaching and advice and job application tracking, but that belong to segments that deviate from our goals.

##### Recruiter Features

While the previous features can also be considered as "Recruiter features" the following described features are more focused on the recruiter point of view. 

**AI-Powered Job Description Generators** 

Platforms/tools like Linkedin and Textio allow this.

| Assets | Drawbacks |
|---|---|
| Ensures job descriptions are comprehensive and appealing | May produce generic or formulaic descriptions if over-relied upon |
| Tailors job descriptions to attract the right candidates by analyzing job titles, roles, and required skills | AI-generated content may lack the nuanced understanding of specific company culture or unique role requirements |
| Saves time for HR professionals and recruiters by automating the job description creation process | May require significant initial setup and training to use effectively |
| Increases consistency and standardization across job postings | Can reduce the personal touch and uniqueness of job descriptions |
| Promotes inclusivity by suggesting inclusive language and reducing biased terminology | |

**Skill-Based Job Matching** 

Platforms like Linkedin and Vervoe feature this.

| Assets | Drawbacks |
|---|---|
| Helps recruiters identify the specific skills needed for a job and ensure these are clearly detailed in the job offer | May miss out on candidates who have the potential but lack specific listed skills |
| Increases the accuracy of job matches by focusing on skills rather than just job titles or experience | Can lead to a narrow focus on hard skills, potentially overlooking important soft skills |
| Saves time by automating the matching process and quickly identifying suitable candidates | Relies on accurate input data; any inaccuracies can lead to poor matching results |
| Enhances candidate experience by providing them with relevant job opportunities based on their skills | May require candidates to update and accurately maintain their skills profiles regularly |
| Platforms like LinkedIn and Vervoe offer this feature, integrating seamlessly into the recruitment workflow | Can be costly to implement and maintain advanced skill-based matching systems |

**Candidate Persona Development** 

Platforms like HubSpot have this.
| Assets | Drawbacks |
|---|---|
| Helps in crafting job descriptions that appeal to the ideal candidate profile | Can be time-consuming to create and maintain detailed personas |
| Assists recruiters in understanding the traits and characteristics of successful employees | May lead to overly narrow candidate searches, potentially excluding diverse talent |
| Improves targeting of job advertisements to attract the right candidates | Relies on accurate and comprehensive data; inaccuracies can result in ineffective personas |
| Enhances the alignment of candidate expectations with company culture and job roles | Can become outdated quickly if not regularly updated to reflect changing job requirements and market conditions |
| Tools like HubSpot offer features for developing detailed candidate personas | |

**Employee Value Propositions (EVP)** 

Universum and Glassdoor feature this.

| Assets | Drawbacks |
|---|---|
| Clearly communicates what makes the company an attractive place to work | Can be challenging to develop an authentic EVP that resonates with all employees |
| Helps attract top talent by highlighting unique benefits and opportunities offered by the company | Requires continuous effort and resources to maintain and update the EVP to stay relevant |
| Enhances employer branding and differentiates the company from competitors | Overemphasis on EVP can lead to neglecting other critical aspects of recruitment and retention |
| Aligns candidate expectations with the company’s culture, values, and mission | May not address individual candidate needs and preferences adequately |
| Promotes a positive image of the company to potential candidates, increasing application rates | |

**Inclusive Language Checkers** 

Platforms like Textio and Linkedin feature this.

| Assets | Drawbacks |
|---|---|
| Promotes diversity and inclusion by making job offers more accessible to a broader range of candidates | May require significant initial setup and integration into existing systems |
| Helps eliminate biased or exclusionary language from job descriptions | Over-reliance on automated tools might miss context-specific nuances |
| Enhances employer brand by demonstrating a commitment to inclusive practices | Can be seen as limiting or overly prescriptive by some users |
| Improves the readability and appeal of job postings to underrepresented groups | May need continuous updates to reflect evolving language and cultural norms |

We can also add other features that revolve around the aggregation of a lot of real-time market data, which we didn't explore because of time constraints.

Finally, it might be interesting to mention that the use of complete anonymisation of candidates has been found in several—but few, roughly 4% of all observed—platforms either through interviews analysed by AI, or by psychometric/game profiles. 

Those *seem* to be the only tools that allow for quality profiles to be anonymous.

## 2) Personae

The customer has explicitly mentioned that their target was the global market, which is similar to pure players such as Linkedin, Monster.com, Indeed and Glassdoor.

None of them, however, feature a tinder-style swiping mechanism. We will try to define personae that can blend the reach of global platforms and the more "niche" and modern aspects of swipe-based apps.

The personae will be split into two categories:

- Job seekers
- Recruiters

> [!IMPORTANT]
> Current employees looking for opportunities or just browsing the catalog have been mixed up with "Job seekers" for the sake of simplicity.

### a) The Jobseeker

#### 1) Entry-level Job Seekers

| **Persona** | <INSERT PHOTO HERE> |
|---|---|
| **Demographics** | Recent graduates, interns, or individuals with 0-2 years of work experience. |
| **Goals** | Securing their first job or internship, gaining experience, building a professional network, and learning industry skills. |
| **Behaviour** | Actively applying for entry-level positions, seeking internships or apprenticeship opportunities, engaging with career advice content, and attending job fairs or networking events. |
| **Challenges** | Limited work experience, lack of professional network, high competition for entry-level roles, and uncertainty about career direction. |
| **Primary use of platform** | Searching for entry-level positions, reading company reviews, seeking interview preparation tips, and networking with professionals in their desired field. |
| **Key features used** | Job search filters for entry-level positions, resume building tools, company reviews, and career advice articles. |
| **Pain Points** | Difficulty in getting noticed by employers, lack of clarity on what employers are looking for, and finding roles that offer growth opportunities. |

#### 2) Mid-Career Professionals

| **Persona** | <INSERT IMAGE HERE> |
|---|---|
| **Demographics** | Individuals with 3-10 years of work experience looking to advance or pivot their careers. |
| **Goals** | Seeking career advancement, higher salaries, better work-life balance, or transitioning to a new industry or role. |
| **Behaviour** | Updating their professional profiles, applying for mid-level positions, seeking certifications or further education, and networking to find new opportunities. |
| **Challenges** | Finding roles that match their experience level, balancing current job responsibilities with job searching, and staying competitive in the job market. |
| **Primary use of platform** | Searching for mid-level positions, researching companies, networking with industry peers, and looking for professional development opportunities. |
| **Key features used** | Advanced job search filters, company research tools, salary comparison tools, and professional development resources. |
| **Pain Points** | Identifying opportunities that align with their career goals, negotiating salary and benefits, and managing the transition between roles or industries. |

#### 3) Senior-level and executive job seekers

| **Persona** | <INSERT IMAGE HERE> |
|---|---|
| **Demographics** | Individuals with over 10 years of experience, including managers, directors, executives, and seasoned professionals. |
| **Goals** | Seeking leadership positions, career fulfillment, strategic roles, or consulting opportunities. |
| **Behaviour** | Leveraging their network for job leads, applying for high-level positions, engaging with industry thought leadership, and often working with recruiters or headhunters. |
| **Challenges** | Limited availability of high-level roles, maintaining professional reputation, negotiating executive compensation packages, and navigating complex hiring processes. |
| **Primary use of platform** | Searching for senior and executive positions, researching company leadership and organizational culture, networking with other executives, and engaging in industry-specific discussions. |
| **Key features used** | Executive job search tools, company and executive team insights, networking and headhunter connections, and compensation benchmarking tools. |
| **Pain Points** | Finding roles that offer the right level of responsibility and compensation, discreetly exploring opportunities while employed, and negotiating complex compensation and benefits packages. |

### b) Recruiters
#### 1) In-house recruiters

| **Persona** | <INSERT IMAGE HERE> |
|---|---|
| **Demographics** | Recruiters working within a company's HR department, focused on internal hiring. |
| **Goals** | Finding the best talent for the company, maintaining employer branding, managing the recruitment process. |
| **Behaviour** | Posting job openings, screening resumes, conducting interviews, collaborating with hiring managers. |
| **Challenges** | Handling a high volume of applicants, ensuring cultural fit, maintaining employer brand. |
| **Primary Use of Platform** | Managing job postings, tracking applicant progress, communicating with candidates, analyzing recruitment metrics. |
| **Key Features Utilized** | ATS integration, company branding tools, job posting management, candidate communication tools. |
| **Pain Points** | High volume of applicants, ensuring good cultural fit, maintaining a strong employer brand. |

#### 2) Agency Recruiters

| **Persona** | <INSERT IMAGE HERE> |
|---|---|
| **Demographics** | Recruiters working for staffing agencies or recruitment firms, serving multiple clients. |
| **Goals** | Filling positions for various clients, matching candidates to roles, managing multiple job openings. |
| **Behaviour** | Sourcing candidates, networking, conducting screenings, presenting candidates to clients. |
| **Challenges** | Managing diverse client needs, tracking numerous candidates, quickly finding qualified candidates. |
| **Primary Use of Platform** | Sourcing candidates, managing job postings, tracking candidate progress for clients, communicating with clients and candidates. |
| **Key Features Utilized** | Advanced search and filtering tools, client management tools, CRM features, job posting distribution tools. |
| **Pain Points** | Managing multiple client needs, tracking numerous candidates, quickly finding qualified candidates for diverse roles. |

#### 3) Executive Recruiters

| Persona | <INSERT IMAGE HERE> |
|---|---|
| **Demographics** | Specialized recruiters focused on filling high-level executive positions, often on a retained search basis. |
| **Goals** | Identifying and attracting top executive talent, conducting thorough vetting, managing discreet and high-stakes searches. |
| **Behavior** | Leveraging networks, conducting deep candidate research, extensive vetting and interviewing, negotiating compensation packages. |
| **Challenges** | Finding top-tier executive talent, maintaining confidentiality, managing long and complex search processes. |
| **Primary Use of Platform** | Researching executive candidates, managing confidential searches, networking with high-level professionals. |
| **Key Features Utilized** | Executive search tools, confidential candidate management, networking and referral systems, compensation benchmarking tools. |
| **Pain Points** | Finding and attracting top-tier executive talent, maintaining confidentiality, managing long and complex search processes. |

## 3) Feature Sets
### a) Feature to problem matrices

The following matrices pair the novel features we have found to existing pain points, and will help us prioritising which features we should implement in the time given.

The last column of the table is a score column, giving a sense of the impact the feature has on the end users.

#### 1) Jobseekers' problems 

| | Difficulty being noticed by employers | Lack of clarity on what employers are looking for | Finding roles that offer growth opportunities | Finding roles that match their experience level | Balancing current job responsibilities with job searching | Staying competitive in the job market | Limited availability of high-level roles | Maintaining professional reputation | Negotiating executive compensation packages | **Score** |
|---|---|---|---|---|---|---|---|---|---|---|
| AI-Powered Resume Builder and Templates | X | | | X | | X | | | | 3 |
| Cultural Fit Assessment | | X | | | | X | | | | 2 |
| Job Match Recommendations | | X | X | | | X | | | | 3 |
| Career Pathway Guides | | X | X | | | X | | | | 3 |
| Portfolio Showcase | X | | | | | X | | | | 2 |
| Mentorship Programs | | | X | | | X | | | | 2 |
| Advanced Search Filters | | X | X | X | | X | X | | | 5 |
| Professional Development Resources | X | X | X | X | X | X | | X | | 7 |
| Job Alerts and Notifications | X | X | X | X | X | X | X | | | 7 |
| Network Enhancement Tools | X | X | X | X | | X | | X | | 6 |
| Career Coaching | | X | X | X | X | X | X | X | X | 8 |
| Exclusive Job Boards | X | X | X | X | | X | X | X | | 7 |
| Company Insights and Leadership | X | X | X | X | | X | X | | | 6 |
| Confidential Job Search Tools | X | | | X | | X | | | | 3 |
| Compensation Benchmarking Tools | | | X | | | X | | X | X | 4 |

#### 2) Recruiters' problems 

| | High volume of applicants | Ensuring good cultural fit | Maintaining a strong employer brand | Efficient candidate communication | Managing multiple client needs | Tracking numerous candidates | Quickly finding qualified candidates | Keeping track of candidate interactions | Finding and attracting top-tier executive talent | Maintaining confidentiality | Managing long and complex search processes | Negotiating complex compensation packages | Maintaining Diversity | **Score** |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| AI-Powered Job Description Generator | X | | X | | | | X | | | | | | X | 4 |
| Skill-based job matching | X | | | | | | X | | X | | | | | 3 |
| Candidate Persona Development | | X | X | | | | | | X | | | | | 3 |
| Employee Value Propositions | | X | X | | | | | | | | | | | 2 |
| Automated Screening Tools | X | | | | X | X | X | | | | | | | 4 |
| Cultural Fit Assessments | | X | | | | | | | | | | | X | 2 |
| Branded Career Pages | | | X | | | | | | | | | | | 1 |
| Candidate Communication Tools | | | | X | | | | X | | | | | | 2 |
| Multi-Client Management Dashboard | | | | | X | X | | X | | | | | | 3 |
| Advanced Search and Filtering Tools | X | | | | | X | X | | X | | | | | 4 |
| Job Posting Distribution Tools | X | | X | | | | X | | | | | | | 3 |
| Candidate Relationship Management (CRM) System | | | | X | X | X | | X | | | | | | 4 |
| Executive Search Tools | | | | | | | X | | X | | X | | | 3 |
| Confidential Candidate Management | | | | | | | | | X | X | X | | | 3 |
| Networking and Referral Systems | | X | X | | | | | | X | | | | | 3 |
| Compensation Benchmarking Tools | | | | | | | | | | | X | X | | 2 |
| Inclusive Language Checkers | | X | | | | | | | | | | | X | 2 |

### b) Retained Features
#### 1) Most impactful Jobseeker features

If we apply a simple Pareto principle to focus on the features that account for 80% of the impact, we get the most important features for the Jobseeker's point of view: *Ranked from most to least important*

- Career Coaching (8)
- Professional Development Resources (7)
- Job Alerts and Notifications (7)
- Exclusive Job Boards (7)
- Network Enhancement Tools (6)
- Company Insights and Leadership (6)
- Advanced Search Filters (5)
- Compensation Benchmarking Tools (4)
- AI-Powered Resume Builder and Templates (3)

#### 2) Most impactful Recruiter features

Same methodology, applying a simple Pareto principle to focus on the features that account for 80% of the impact, yields the most important features for the recruiter's point of view: *Ranked from most to least important*

- AI-Powered Job Description Generator (4)
- Automated Screening Tools (4)
- Advanced Search and Filtering Tools (4)
- Candidate Relationship Management (CRM) System (4)
- Skill-based job matching (3)
- Candidate Persona Development (3)
- Multi-Client Management Dashboard (3)
- Job Posting Distribution Tools (3)
- Executive Search Tools (3)
- Confidential Candidate Management (3)
- Networking and Referral Systems (3)

#### 3) Filtering out hard tasks

We have plotted all the previous mentioned features—on an admittedly hard-to-read graph—in a impact/time/effort matrix.

![Impact/Effort Matrix](/img/impactMatrix.png.png)

Our capacities correspond to any feature ranging from low to medium effort, with the desire to have low to high impact features to create a successful MVP.

> [!IMPORTANT]
> The effort estimations have been done by an artificial intelligence, considering a team of 3 full-time developers, which has been validated by the customer.

This leaves us with the following features:

- **Professional Development Resources**
	- Impact: 7
	- Effort: Medium
	- Time: 8 weeks

- **Job Alerts and Notifications**
	- Impact: 7
	- Effort: Medium
	- Time: 6 weeks

- **Exclusive Job Boards**
	- Impact: 7
	- Effort: Medium
	- Time: 8 weeks

- **Company Insights and Leadership**
	- Impact: 6
	- Effort: Medium
	- Time: 8 weeks

- **AI-Powered Resume Builder and Templates**
	- Impact: 3
	- Effort: Medium
	- Time: 6 weeks

- **AI-Powered Job Description Generator**
	- Impact: 4
	- Effort: Medium
	- Time: 6 weeks

- **Skill-based job matching**
	- Impact: 3
	- Effort: Medium
	- Time: 8 weeks

- **Candidate Persona Development**
	- Impact: 3
	- Effort: Medium
	- Time: 8 weeks

- **Executive Search Tools**
	- Impact: 3
	- Effort: Medium
	- Time: 8 weeks

- **Networking and Referral Systems**
	- Impact: 3
	- Effort: Medium
	- Time: 8 weeks

- **Compensation Benchmarking Tools**
	- Impact: 4
	- Effort: Low
	- Time: 4 weeks

- **Job Posting Distribution Tools**
	- Impact: 3
	- Effort: Low
	- Time: 4 weeks

- **Confidential Candidate Management**
	- Impact: 3
	- Effort: Low
	- Time: 4 weeks

#### 4) Minimum Viable Product

We finally have enough information to set a goal for the minimum viable product (MVP).

> [!NOTE]
> Some features explicitly required by the customer have been added to the list, while others have been arbitrarily added for coherence.

The MoSCoW analysis below summarises how we prioritised each feature. The "Must" column is what will constitute the minimum viable product.

> [!IMPORTANT]
> Keep in mind that the time estimates are the time estimates for full  development of the feature, while our MVP, as requested by the customer, will only focus on the front-end, user experience side of the development. This discrepancy is due to the fact that this is a school project after all.

**MUST**

| Feature | Impact | Effort | Time |
|---|---|---|---|
| Confidential Candidate Management | 3 | Low | 4 weeks |
| Candidate Video Stories | 5 | Medium | 8 weeks |
| Swipe-based Gestures | 2 | None | Already done |
| Professional Development Resources | 7 | Medium | 8 weeks |
| Company Insights and Leadership | 6 | Medium | 8 weeks |
| Job Alerts and Notifications | 7 | Medium | 6 weeks |
| Skill-based Job Matching | 3 | Medium | 8 weeks |

**SHOULD**

| Feature | Impact | Effort | Time |
|---|---|---|---|
| Candidate Persona Development | 3 | Medium | 8 weeks |
| AI-Powered Job Description Generator | 4 | Medium | 6 weeks |

**COULD**

| Feature | Impact | Effort | Time |
|---|---|---|---|
| Exclusive Job Boards | 7 | Medium | 8 weeks |
| AI-Powered Resume Builder and Templates | 3 | Medium | 6 weeks |
| Executive Search Tools | 3 | Medium | 8 weeks |
| Networking and Referral Systems | 3 | Medium | 8 weeks |

**WILL NOT**

| Feature | Impact | Effort | Time |
|---|---|---|---|
| Compensation Benchmarking Tools | 4 | Low | 4 weeks |
| Job Posting Distribution Tools | 3 | Low | 4 weeks |

#### 5) Conclusion

> [!TIP]
> We made a gross estimation that the MVP would take approximately 4 months to develop by 3 developers.

Now that we have our feature list, we will take a look at how the different features break down in terms of use cases, and even further, in terms of functions, in the following section.

## 4) Measuring Success

In order to evaluate the performance of the app and its features and to make it evolve, several metrics can be monitored. Here are some that might be interesting to consider in the future:

- **Time-to-Hire**: The average time it takes from the job posting to the candidate's acceptance of the job offer.
- **Time-to-Fill**: The time taken to fill a position from the moment it was approved to be filled.
- **Time-to-Screen**: The time taken to review and screen candidates after they apply.
- **Cost-per-Hire**: The total cost incurred to hire a candidate, including advertising, recruiter fees, and other expenses.
- **Candidate Satisfaction Score**: Use surveys to measure candidates' satisfaction with the recruitment process.
- **Net Promoter Score (NPS)**: Ask candidates if they would recommend your recruitment platform to others.
- **Application Completion Rate**: The percentage of candidates who complete the application process once they start.
- **Offer Acceptance Rate**: The percentage of candidates who accept job offers.
- **Recruiter Productivity**: Measure the number of hires made by each recruiter within a certain period.
- **Candidate-to-Interview Ratio**: The number of candidates needed to secure an interview.
- **Interview-to-Hire Ratio**: The number of interviews needed to make a hire.

# D) Functional Specifications
## 1) Use Cases Analysis

...

## 2) Functional Analysis

...

# E) Non-Functional Requirements

> [!NOTE]
> Many traditional non-functional requirements such as cost, availability, scalability etc. have not been included as they are out of scope for this project.

## 1) Usability

As the product targets a global market with wide demographics ranges, we must ensure that the product is usable.

Unfortunately the customer didn't approve our request to develop the product with its existing users, making user-centered design a bit more complicated in our time frame.

However, some steps have been and will be taken to mitigate this potential usability issue:

- Designing a clear and simple navigation: easy-to-navigate menus and a logical flow.
- Making the design consistent through the use of design systems
- Preventing frustration by optimising loading times.
- Minimalistic design, using whitespace to improve readability and to help focus on essential features and functions
- Accessibility, described in <LINK TO ACCESSIBILITY>
- Onboarding tutorials, to make sure every user is on the same page
- Clear online documentation, thanks to the user manual.

## 2) Accuracy

Accuracy of the matching algorithm will be crucial for the success of the product.
The following outlines the strategies used to collect insights about the performance of the algorithm and iterate on it.

### a)  Precision and Recall

The F-Score is a measure of predictive performance in statistical analysis of binary information. The F1 score is usually used as a way to combine both metrics of precision and recall. Here is how to calculate it:

Source: https://en.wikipedia.org/wiki/F-score

**Precision:** Measures the proportion of relevant matches among the total matches suggested by the algorithm.

$$
\text{Precision} = \frac{\text{True Positives}}{\text{True Positives} + \text{False Positives}}
$$ 

**Recall:** Measures the proportion of relevant matches that were identified by the algorithm out of all possible relevant matches.

$$
\text{Recall} = \frac{\text{True Positives}}{\text{True Positives} + \text{False Negatives}}
$$ 

**F1 Score:** Combines precision and recall into a single metric.

$$
\text{F1 Score} = 2 \times \frac{\text{Precision} \times \text{Recall}}{\text{Precision} + \text{Recall}}		  
$$ 

Here is the iterative protocol to use the F-Score to ameliorate the matching algorithm

- Step 1: **Define the Baseline**

	- Run the current version of the algorithm on a test dataset to establish baseline precision, recall, and F1 Score.

	- Record the initial F1 Score, precision, and recall to compare against future iterations.

- Step 2: **Identify Areas for Improvement**

	- Examine false positives and false negatives to understand where the algorithm is failing. This can provide insights into which aspects of the algorithm need improvement.

	- Consider adding, removing, or modifying features based on error analysis to improve the algorithm's performance.

- Step 3:  **Modify the Algorithm**

	- Make changes to the algorithm based on the identified areas for improvement.
 
	- Choose the most relevant features that contribute positively to the precision and recall of the algorithm.

- Step 4:  **Train and Test**

	- Train the modified algorithm on the training dataset.
  
	- Evaluate the modified algorithm on a separate test dataset to measure its performance.

- Step 5:  **Evaluate Using F1 Score**

	- Compute the precision, recall, and F1 Score for the modified algorithm.

- Step 6:  **Compare Against Baseline**

	- Compare the new F1 Score with the baseline F1 Score.
	- If the F1 Score has improved, the changes are likely beneficial.
	- If the F1 Score has declined, further investigation is needed to understand why the changes did not work.

- Step 7:  **Iterate**

	- Repeat the Process Based on the results, either accept the changes if they improve the F1 Score or revert to the previous version and try different modifications.
	- This iterative process continues, with each iteration aimed at gradually improving the F1 Score and, consequently, the algorithm's performance.

### b) Accuracy

Another simple metric that can be used during the iteration on the matching algorithm is accuracy, which can be calculated this way:

$$
\text{Accuracy} = \frac{\text{True Positives} + \text{True Negatives}}{\text{Total Number of Matches}}
$$

## 3) Transparency

Lack of transparency can lead to mistrust among candidates and recruiters, especially when "black box" AI models are used. It might be interesting to leverage explainable AI features (XAI) from the get-go to mitigate those issues.

Source: https://www.ibm.com/topics/explainable-ai

## 4) Accessibility

As of now, only color-blindness and visual impairment have been taken into consideration, but eventually it would be commendable to follow the WCAG guidelines. 
[Link to guidelines](https://www.w3.org/WAI/standards-guidelines/wcag/)

This former has been mitigated by using an app named Daltonize Me to simulate all the variations of color-blindness and ensure that no element of the design depended purely on color perception.

The latter consisted of using the alt properties of images to enable text to speech to describe them with more ease.

## 5) Compliance

Adherence to laws, regulations, and standards must be taken into consideration. Focusing on European and French regulations is usually a good start since they are more strict than other regulations.

Here are the regulations that will apply to this product:

### a) Personal Data Protection

- **GDPR (General Data Protection Regulation)**: Any application collecting personal data must comply with the GDPR, which imposes strict rules on the collection, processing, storage, and protection of personal data. 
[Link to guidelines](https://gdpr.eu/checklist/)

- **CNIL (Commission Nationale de l'Informatique et des Libertés)**: The customer must declare the data processing activities to the CNIL and adhere to its recommendations. It is crucial to ensure users' rights (right of access, rectification, deletion, etc.). [Link to guidelines](https://www.cnil.fr/fr/les-outils-de-la-conformite)

### b) Transparency

- **Obligation to Inform**: Users will be clearly and transparently informed about how their data will be used, who will have access to it, and for what purposes. This includes having an accessible and understandable privacy policy.
- **Cookies and Trackers**: Cookies will be used to understand how the app is used by the users and to collect insights that will help to improve the product. A cookie consent/manager will be included with the product.

### c) Non-Discrimination

- **Labor Code**: It prohibits any form of discrimination in hiring based on criteria such as age, sex, origin, religion, sexual orientation, disability, etc. Explainable AI and thoughtful iteration and design helped mitigate this issue.
- **Law for the Freedom to Choose One's Professional Future**: It reinforces employers' obligations to combat discrimination and promote professional equality. https://travail-emploi.gouv.fr/IMG/pdf/loi_pour_la_liberte_de_choisir_son_avenir_professionnel-2.pdf
- **Diversity Charter**: Although not legally binding, adhering to this charter can demonstrate your commitment to promoting diversity. 
https://www.charte-diversite.com/

### d) Fair Access to Employment

- **Law for Confidence in the Digital Economy**: It imposes obligations of fairness and transparency in digital services, including recruitment platforms. https://www.legifrance.gouv.fr/loda/id/JORFTEXT000000801164
- **Anti-Discrimination Law**: We must ensure that your algorithm and platform do not indirectly discriminate against certain groups of candidates. For example, it is prohibited to filter applications based on discriminatory criteria. https://www.legifrance.gouv.fr/loda/id/JORFTEXT000018877783

### e) Consent and Right to be Forgotten

- **Explicit Consent**: Users must give explicit consent for the processing of their data, especially if it involves sensitive data.
- **Right to be Forgotten**: Users must be able to request the deletion of their personal data, and you must be able to comply with this request within the specified time frames.

### f) Data Security

- **Security Measures**: In the future, we plan to implement technical and organisational measures to ensure the security of personal data, such as encryption, access controls, etc. A good rule of thumb is to always respecting the CIA principles https://www.techtarget.com/whatis/definition/Confidentiality-integrity-and-availability-CIA

### g) Contractual Obligations

- **Terms and Conditions (T&Cs)**: These must be clear and accepted by users, defining the rights and obligations of each party.
- **Contracts with Recruiters**: Contracts should stipulate responsibilities regarding data processing and compliance with anti-discrimination laws.

## 6) Localization and Internationalization

The product has been thought for the global market, but focuses on the French market for now.
The product will have to include French and English languages for the minimum viable product.

# F) Appendix
## 1) Benchmark of traditional recruitment platforms

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

## 2) Benchmark of novel recruitment platforms

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
