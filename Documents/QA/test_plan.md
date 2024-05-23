
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
  - [4.1 Hardware](#41-hardware)
  - [4.2 Software](#42-software)
- [5. Test cases](#5-test-cases)
- [6. Test reports](#6-test-reports)


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

Each test contains multiple components:

| Test ID | Name                 | Expected result                   | passed or failed                                |
| ------- | -------------------- | --------------------------------- | ----------------------------------------------- |
| 00      | The name of the test | A description of what is expected | 🟢 if the test succeeds <br> 🔴 if the test fails |

### 4.1 Hardware

### 4.2 Software

## 5. Test cases

## 6. Test reports


