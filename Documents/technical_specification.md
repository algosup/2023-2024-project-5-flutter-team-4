# 2023-2024 - PROJECT 5 - "ADOPTE UN CANDIDAT" APPLICATION - TEAM 4

## Technical Specifications

![-](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)

<details>
<summary>📖 Table of content</summary>

- [2023-2024 - PROJECT 5 - "ADOPTE UN CANDIDAT" APPLICATION - TEAM 4](#2023-2024---project-5---adopte-un-candidat-application---team-4)
  - [Technical Specifications](#technical-specifications)
    - [I. Introduction of the project](#i-introduction-of-the-project)
      - [A. Client](#a-client)
      - [B. Goal of the project](#b-goal-of-the-project)
    - [II. Solution](#ii-solution)
      - [A. Descritpion](#a-descritpion)
      - [B. Operating environment](#b-operating-environment)
      - [C. Features](#c-features)
        - [1.](#1)
      - [D. Contraints](#d-contraints)
      - [E. Risks and assumptions](#e-risks-and-assumptions)
    - [III. Technical Specifications](#iii-technical-specifications)
      - [A. Graphic convention](#a-graphic-convention)
      - [B. Writing convention](#b-writing-convention)
      - [C. File architecture](#c-file-architecture)
      - [D. Implementation](#d-implementation)
    - [IV Program architecture diagram](#iv-program-architecture-diagram)
    - [V. Further considerations](#v-further-considerations)
      - [A. Cost estimation](#a-cost-estimation)
      - [B. Performance](#b-performance)
      - [C. Safety](#c-safety)
      - [D. Security](#d-security)
      - [E. Accessibility](#e-accessibility)
    - [VI. Success evaluation](#vi-success-evaluation)
    - [Project role distribution](#project-role-distribution)
    - [Glossary](#glossary)

</details>

![-](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)

| | |
| - | - |
| Author(s) | Grégory PAGNOUX (Technical Leader) |
| Reviewer(s) | Victor LEROY (Project Manager) |
| Created on | 05/15/2024 |
| Last updated | 05/16/2024 |
|  |  |

![-](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)

### I. Introduction of the project

#### A. Client

[We Are Evolution](https://www.we-are-evolution.com) is a company specialized in the management and business advices since 2019. They help companies to recruit with original tools to meet the challenges of Human Resources.

#### B. Goal of the project

Adopte Un Candidat is a « Tinder style » recruitment application that matches companies with jobseekers in a different way.
The concept is to promote fair recruitment by anonymizing candidates and companies, promoting soft skills[^1], emphasizing the human aspect of the process and facilitating connections between candidates and companies via a dedicated application.

### II. Solution

#### A. Descritpion

The key points of the Adopte un Candidat concept are as follows:

- To avoid discrimination in hiring, candidates and companies are anonymized on the platform. This allows us to focus on candidates' skills and potential, rather than their origin, gender, age, etc.
- Instead of focusing only on diplomas and professional experience, the concept emphasizes  soft  skills,  i.e.  the  behavioral  and  relational  skills  of  candidates.  This  makes it possible  to  recognize  and  evaluate skills such as communication, teamwork, creativity, problem-solving[^2], etc.
- The concept emphasizes the human aspect of recruitment, recognizing that each candidate has unique talents and skills to offer. It seeks to give each individual the opportunity to showcase his or her skills, regardless of background or academic credentials.
- The "matching" process enables candidates and companies to connect and find an ideal match. Candidates can express their preferences in terms of companies and positions, and companies can search for candidates who match their cultural and organizational needs.
- The entire recruitment process takes place on a dedicated application. This facilitates interaction between candidates and companies, offering features such as messaging, personalized profiles, etc.
- In our approach, we don't have tests, quizzes, or games. Instead, candidates will have the opportunity to select their soft skills from a provided list, while recruiters will choose the desired skills from the same list. The "match" will occur when there is a 50% overlap of soft skills between the candidate and the company. Our concept is inspired by the functionality of the "Tinder" application for recruitment. There is no document or defined skills matrix.

#### B. Operating environment

The application is developed on Windows and Macintosh and it must be compatible with Android, iOS, Windows, Macintosh, tablet, etc.
The development language used is [Flutter](https://docs.flutter.dev)[^3].

#### C. Features

##### 1. 

. <!-- TODO -->

#### D. Contraints

. <!-- TODO -->

#### E. Risks and assumptions

. <!-- TODO -->

### III. Technical Specifications

#### A. Graphic convention

. <!-- TODO -->

#### B. Writing convention

The Flutter language has certain conventions that must be respected, which are detailed below:

| NOTATION NAME | DESCRIPTION | USAGE | EXAMPLE |
| :-: | :-: | :-: | - |
| Pascal Casing | we attach each word and capitalize each first letter of words to know where the next word starts | naming Classes | PascalCase |
|  |  | naming Widgets |  |
|  |  | naming Types |  |
|  |  | naming Extensions |  |
| Camel Casing | we attach each word and capitalize each first letter of words except the first one to know where the next word starts | naming Functions | camelCase |
|  |  | naming Variables |  |
|  |  | naming Arguments |  |
| Snake Casing | use the underscore between words written in lower case | naming folders and files | snake_case |
|  |  | naming imports |  |
| Comments | start each line with two slashes and an uppercase letter and finish the comment by a period. | give more information of the code | <pre>```// The following declaration creates a query. It does not run the query.```</pre> |

*sources: [Dart](https://dart.dev/effective-dart/style)*

#### C. File architecture

```md
- Documents
- src
   └──job_matching_app
        ├──android
            └──...
        ├──ios
            └──...
        ├──lib
            ├──<!-- TODO -->
            └──
        ├──linux
            └──...
        ├──macos
            └──...
        ├──web
            └──...
        ├──windows
            └──...
        ├──.gitignore
        ├──.metadata
        ├──README.md
        ├─analysis_options.yaml
        └──pubspec.yaml
```

#### D. Implementation

**1. main.dart file**

*description* <!-- TODO -->

```dart

```

![-](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/solar.png)



### IV Program architecture diagram

![Program Architecture Diagram](img/)

### V. Further considerations

#### A. Cost estimation

. <!-- TODO -->

#### B. Performance

. <!-- TODO -->

#### C. Safety

. <!-- TODO -->

#### D. Security

. <!-- TODO -->

#### E. Accessibility

. <!-- TODO -->

### VI. Success evaluation

. <!-- TODO -->

![-](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)

### Project role distribution

|  | PERSON | ROLE | MAIL | GITHUB |
| :-: | :-: | :-: | :-: | :-: |
| ![Victor LEROY](https://ca.slack-edge.com/T0732GL230A-U072N05JEP9-gf6c08fa64b0-50) | Victor LEROY | Project Manager | [victor.leroy@algosup.com](mailto:victor.leroy@algosup.com) | [Victor's GitHub](https://github.com/Victor-Leroy) |
| ![Mathis KAKAL](https://ca.slack-edge.com/T019N8PRR7W-U0434UXA63Y-g9ecd879a69a-50) | Mathis KAKAL | Program Manager | [mathis.kakal@algosup.com](mailto:mathis.kakal@algosup.com) | [Mathis's GitHub](https://github.com/mathiskakal) |
| ![Grégory PAGNOUX](https://ca.slack-edge.com/T0732GL230A-U072PJ16B7H-cf66694d1906-50) | Grégory PAGNOUX | Technical Leader | [gregory.pagnoux@algosup.com](mailto:gregory.pagnoux@algosup.com) | [Grégory's GitHub](https://github.com/Gregory-Pagnoux) |
| ![Benoît DE KEYN](https://ca.slack-edge.com/T0732GL230A-U072PJ1DK0X-g1c2a6de3de3-50) | Benoît DE KEYN | Technical Writer | [benoit.dekeyn@algosup.com](mailto:benoit.dekeyn@algosup.com) | [Benoît's GitHub](https://github.com/benoitdekeyn-algosup) |
| ![Laurent BOUQUIN](https://ca.slack-edge.com/T0732GL230A-U072XFVNQMC-ge6ea4153c87-50) | Laurent BOUQUIN | Software Engineer | [laurent.bouquin@algosup.com](mailto:laurent.bouquin@algosup.com) | [Laurent's GitHub](https://github.com/laurentbouquin) |
| ![Aurélien FERNANDEZ](https://ca.slack-edge.com/T0732GL230A-U07341NVA6P-g4a7908c1162-50) | Aurélien FERNANDEZ | Quality Assurance | [aurelien.fernandez@algosup.com](mailto:aurelien.fernandez@algosup.com) | [Aurélien's GitHub](https://github.com/aurelienfernandez) |

![-](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)

### Glossary

[^1]: Soft skills
Soft skills are character traits and interpersonal skills that characterize a person's ability to interact effectively with others. In the workplace, soft skills are considered to be a complement to hard skills, which refer to a person's knowledge and occupational skills.
*source: [Investopedia](https://www.investopedia.com/terms/s/soft-skills.asp)*

[^2]: Problem-solving
Problem solving is the act of defining a problem; determining the cause of the problem; identifying, prioritizing, and selecting alternatives for a solution; and implementing a solution.
*source: [ASQ](https://asq.org/quality-resources/problem-solving)*

[^3]: Flutter
Flutter is an open source software development kit launched in May 2017 by Google. It is used to develop applications for Android, iOS, Linux, MacOS, Windows, Google Fuchsia and the web. The latest stable version is 3.19.6.
*source: [AMAZON](https://aws.amazon.com/fr/what-is/flutter/) / [Wikipedia](https://fr.wikipedia.org/wiki/Flutter_(logiciel))*
