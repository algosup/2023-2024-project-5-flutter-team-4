
<h1 align="center"> Test plan </h1>

<p align="center"> 
Created by: Aurélien FERNANDEZ <br> Creation Date: 21/05/2024 <br> Last update: 05/02/2024
</p>

___

<details>

<summary>Table of content</summary>

- [1. Product analysis](#1-product-analysis)
  - [1.1 Overview](#11-overview)
- [2 Strategy](#2-strategy)
  - [2.1 Scopes](#21-scopes)
    - [2.1.1 In scope](#211-in-scope)
    - [2.1.1 Out of scope](#211-out-of-scope)
  - [2.2 Unit Tests](#22-unit-tests)
  - [2.3 Testing structure](#23-testing-structure)
  - [2.4 Test list](#24-test-list)
    - [2.4.1 Must features](#241-must-features)
    - [2.4.2 Should features](#242-should-features)
  - [2.5 Test sessions](#25-test-sessions)
    - [2.5.1 Smoke testing](#251-smoke-testing)
    - [2.5.2 Beta testing](#252-beta-testing)
  - [2.6 Tools](#26-tools)
    - [2.6.1 Github issues](#261-github-issues)
    - [2.6.2 Google sheet](#262-google-sheet)


</details>

## 1. Product analysis

### 1.1 Overview


This project, given by Wevolution, aims to create a job dating platform inspired by popular apps similar to Tinder to permit people searching for a job to get a job interview in a short time with low effort. 

To avoid any form of discrimination, all candidates shall remain anonymous. Candidate profiles will only include soft skills and additional information provided by the candidates, encouraging recruiters to focus on these aspects. Hard skills will not be displayed, as the app is designed for temporary or low-requirement jobs.

## 2 Strategy

For this project, the main strategy regarding testing will be manual testing, as this project is mainly graphical. 

The first tests will include Unit testing to make sure crucial functions such as the multiple parsers, graphs or more. 

### 2.1 Scopes 

The tests performed during this project will be focused on the graphical interface and the multiple functions needed for the app to function properly. However, features such as a working backend are not going to be heavily tested as it isn't a scope of the project.

#### 2.1.1 In scope

- Program
  - No major bug impacting the user experience
  - Features requested by the client are present
  - A user interface accepted by the client
- Documents
  - The documents should not contain any typographical or grammatical errors
  - The documents should be accurate according to the current project

#### 2.1.1 Out of scope

- Features not requested by the client
- Backend

### 2.2 Unit Tests

Unit tests are one of the most important types of tests. They are created preferably before their related functions or at the same time. 

The multiple unit tests are written in flutter similarly to the rest of the project.

The aim of these unit tests is to:
 - Ensure code quality: To create an environment where maintainability and readability are not a problem for future developers
 - Code effectiveness: To make sure that each function is working as expected

### 2.3 Testing structure
Each test contains multiple components presented as these:

| Test ID | Name                 | Expected result                   | passed or failed                                |
| ------- | -------------------- | --------------------------------- | ----------------------------------------------- |
| 00      | The name of the test | A description of what is expected | 🟢 if the test succeeds <br> 🔴 if the test fails |

### 2.4 Test list

Multiple features are desired for the accomplishment of this project. The following features are considered as the features to be tested at the highest priority after each modification of the application.

#### 2.4.1 Must features

| Function                           | Expected result                                                                                                        |
| ---------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| Open the app                       | The app must open when tapping on the icon                                                                             |
| Create an account                  | A user must be able to create an account and configure it.<br>Either as a candidate or a recruiter                     |
| Authenticate                       | A user must be able to authenticate.<br>Either as a candidate or a recruiter                                           |
| Notifications                      | Candidates and recruiters must be able to receive notifications from new job offers or matches                         |
| Modify settings                    | A user must be able to modify the app's settings and keep the changes after closing the app                            |
| Filtering                          | A recruiter/candidate must be able to filter candidates/companies.<br>Either by locations, name, etc                   |
| Match                              | A recruiter/candidate must be able to match with a candidate/company by swiping to the right                           |
| Refuse                             | A recruiter/candidate must be able to  match refuse a candidate/job offer by swiping to the left                       |
| See details                        | A recruiter/candidate must be able to see a candidate's/recruiter's details                                            |
| Company/candidate insights         | A recruiter or candidate must be able to create their own personalised description to attract new candidates/companies |
| Professional development resources | Courses can be watched by candidate to improve their score                                                             |
| Video stories                      | A candidate must be able to explain who they are in a short audio for recruiters to listen to                          |
| Anonymous                          | All candidates must remain anonymous.                                                                                  |

#### 2.4.2 Should features
| Function                         | Expected result                                                                                                                                       |
| -------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| Candidate Persona Development    | A candidate may be able to add their evolution in their professional life (e.g: started as a customer service employee to developer with given dates) |
| AI-powered description generator | An AI may be usable by users  to generate their description                                                                                           |

### 2.5 Test sessions

Due to the project's goal to create a mockup application, automated tests are not suited for this project. Therefore manual tests are the most suited tests. Moreover, to ensure a high-quality and user-friendly product, both [smoke testing](#251-smoke-testing) and [beta testing](#251-beta-testing) will be performed.

Apart from unit tests, which will be created alongside the code, and documentation review, tests will be performed after each push into the main or release.

#### 2.5.1 Smoke testing

A session of smoke testing will be composed of a tester, who is in most cases the QA of the team, a computer, either a MacOS or a Lenovo computer provided by ALGOSUP and at least one mobile phone, either Android or IOS.

<h5>Scopes</h5>

The scopes of smoke testing are the following:

- **App launch**: Ensure the app can launch without critical errors or crashes.
- **Login**: Ensure the user can log in either as a candidate or recruiter and redirect to the corresponding pages.
- **Interactions**: Ensure the user can interact with the app, by navigating through the different pages or modifying content, visual or audio feedback is expected for each interaction.
- **Matching system**: Ensure the matching system is correctly working and allows the candidate and the recruiter to chat/set up a date for an interview.
- **Account management**: Ensure users can manage their account: create, edit, log in/out, delete or even ask for logs.

<h5>Procedure</h5>

The smoke testing sessions will follow these precise steps:

- **Download**: Download the latest release or main version.
- **Test**: Test cases defined in the "[Test cases]()" document. Tests that have already been tested shall be tested again to ensure no errors break the previously working part of the code.
- **Report**: Report the results of the multiple tests in this [Google sheet]() and create an issue for each bug found during the tests.

#### 2.5.2 Beta testing

A session of beta testing will be composed of a user, picked either from or outside of ALGOSUP, and the QA of the team. The device used for testing the project will be chosen by the user, regardless of the team members' devices used until this moment.

<h5>Scopes</h5>

Along with the previous scopes mentioned in [smoke testing](), the scopes of the beta testing are the following:

- **User interface**: Ensure the interface is simple enough to be understood without external help.
- **Feedback**: Retrieve feedback from end users.

<h5>Procedure</h5>

The beta testing sessions will follow these precise steps:

- **User**: Find a user, either picked randomly on the spot or selected previously, with their consent. The project must be explained to the user as to: what is the project, its goal and in what circumstance the app is planned to be used.
- **Choose a device**: Ask the user which device they would prefer using, it can be a mobile phone (Android or IOS) or a computer.
- **Download**: Download the application either from Github, the Apple App Store or Google Play, depending on the chosen device and the current availability of the application.
- **Test**: Let the user create an account or log in to a test account and use the app. The user should use the app without advice or instructions given by the QA.
- **Report**: Report the multiple data that can be retrieved from the test in this [Google sheet]():
  - The duration of the test,
  - The user journey,
  - The multiple feedback throughout the whole test.
- **Issue reports**: If necessary create an issue about a bug encountered during the test.

As previously mentioned, user consent is of utmost importance during this test. Users may decline to participate or withdraw at any time if they choose to do so.

### 2.6 Tools

#### 2.6.1 Github issues

As we are using GitHub to work on the current project we can use it to archive the multiple bug reports and access them freely to read or update them at any given point. 

One of the features we can use with the GitHub issues is the use of templates. This feature allows us to standardise the flow of information. Finally, each issue is assigned to the person responsible for fixing the issue.

Here are the two different templates for this project:

A template when bugs are found:

![bug template](../img/bug_template.png)

A template if a document has a typographical error, or cannot be understood correctly:

![document template](../img/document_template.png)


<h3>Examples</h3>

<h4>Bugs issues's template</h4>

<h5>Expected behavior</h5>

  ``` 
  When the icon of the application is tapped, it should open the application.
  ```
<h5>Current behavior</h5>

  ``` 
  When the icon of the application is tapped, only a white screen appears and the application closes itself approximatively 5 seconds after the start.
  ```
<h5>Steps to reproduce</h5>

  ``` 
  - Download the application on an Android phone.
  - When installed, try opening the app by tapping on the icon.
  - Wait a few seconds
  ```
<h5>Screenshot</h5>

  *To add an image, just drag & drop the image on the input field*
  ``` 
  None
  ```
<h5>Test environment</h5>

  ``` 
  Android phone v14.0
  ```
<h5>Additional context/description</h5>

  ``` 
  None
  ```
<h5>Possible implementation</h5>

  ``` 
  None
  ```

<h4>Documents issues' template</h4>


Documents' issues have to be written in this specific way:

  <h5>Typographical mistakes</h5>

  ``` 
  - line 00: there is a typographical **mistak**
  ```

  <h5>Corrections</h5>

  ``` 
  -[] line 00: there is a typographical **mistake**
  ```
  <h5>Suggestions</h5>

  ```
  - line 10: the sentence is strangely worded
  ```

Here is an example of how document templates should be written:

![document example](../img/document_template_example.png)

Here is a preview of the example:

![document preview](../img/document_template_preview.png)

<h3>Tags</h3>

The issues also come with tags, tags are used to sort and quickly identify in what category a bug is contained, we currently have two major tags:

- Documents
- Bugs

The bugs contain a second set of tags which determine the priority:
- High
- Medium
- Low

#### 2.6.2 Google sheet
 
The [test cases]() and [test report]() are pages of a Google sheet allowing the QA of the team to archive every test case performed in previous sessions.

<h4>test cases</h4>

**Structure**

- ID: A unique number starting from 00.
- Name: The name of each test case.
- Description: A short description of the test case.
- Steps to proceed: Steps to proceed with the test.
- Expected behavior: The behavior expected.
- Test result: The resulting behavior.
- Status: The current status of the test is either Not tested, Failed or Success.