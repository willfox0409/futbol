# **Mod1 Final Project: Futbol**

### ***Team “FC Binding Pryers”, 2410*** 

## **About**

Using fictional data from a soccer league, we will analyze team and coach performances for specific seasons and across multiple seasons. We set up methods for Game Statistics, League Statistics, and Season Statistics by transferring the data stored as csv files into hashes and nested hashes that we call across classes. Code created for all classes relied heavily on enumerables and class methods. 

Within Game Statistics, we look at the lowest and highest total scores for each game played, the percentage of games that a home team has won, a visitor has won, and the percentage of tied games. We also create methods for the count of games for each season, the average goals scored in a game across all seasons, and the average goals scored in a game for each season. 

Within League (or “Game Team”) Statistics, we include methods that count the number of all teams in the data, the team with the highest and lowest average of goals scored across all seasons, the highest and lowest scoring away and home team across all seasons. 

Within Season Statistics, we look at the Coach with the best and worst win percentage for a given season. Given a specific season, we also can look at the team with the best and worst ratio of shots-to-goals and the team with the most and fewest tackles. 

In this program, we include passing tests with return values that include integers, floats, hashes, and strings. 

## **Built With**

This project was built using Ruby v.3.2.2 and RSpec v.3.13. 

Tools we used in order to run team retros and manage team communication and collaboration included Google Calendar, Google Docs, Trello, Slack, and Easy Retro.

This ReadMe has been formatted using the [Mod1 ReadMe prompt](https://curriculum.turing.edu/module1/lessons/writing_a_readme) from the Turing School of Software & Design. 

## **Getting Started**

To [clone this program](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) from GitHub:

1. Navigate to the [Futbol project page on GitHub](https://github.com/willfox0409/futbol.git)  
2. Click the `<> Code` drop down menu  
3. Copy the SSH link `<git@github.com:willfox0409/futbol.git>`  
4. Open Terminal  
5. Enter `git clone git@github.com:willfox0409/futbol.git` 

## **Testing**

There are several ways in which you can run tests for our program. In order to run a comprehensive test, you can run `rspec` from the project directory file. If you have access to this project’s associated spec harness, you can run `bundle exec rspec` from that directory. If you are interested in testing specific class methods, you can run `rspec spec/file_name` from the project directory file. 

We have our project divided into four spec files associated with corresponding class files. A fifth spec file is our \`spec\_helper\` file, where we have code written to set up Simple Cov. Our tests consist of a mix of unit and integration tests. These tests help us understand the functionality and accuracy of the code we have written, and that the return values of methods are as expected. Throughout the coding process, the tests have helped us detect errors in isolation to their method block, which was helpful to troubleshoot smaller pieces of our code without affecting the entire project. 

## **Challenges & Wins**

After spending the first day of the project setting up an outline, schedule, and working to define the working relationship by explicitly stating communication expectations and scheduling challenges, our first hurdle was setting up our `stat_tracker` file. After a full day of wrestling with the code required to pull information from the CSV files in order to properly set up classes and method blocks, we reached out to our support network. With the help of our network, we were able to get our runner file functional with a solid foundation to build the remainder of the project. 

We split into smaller groups in order to work through the Game and League Statistics classes, and then came together as a larger group in order to merge changes. We worked through the Season Statistics as a larger group, which presented another large technical challenge for us. 

A major strength of our team was clear and consistent communication. At the beginning of the project, we had set up regular check-in times at the start and end of every day, which created a strong foundation for our teamwork. We frequently communicated in our Slack channel to update on workflow progress and to share what parts of the project we needed assistance with. While all members of the group are still becoming comfortable with Git Workflow, all members contributed via commits and pull requests on merging feature branches. Merge requests were completed together as a group, which enabled all members to access the most updated program file as soon as it was created. 

Another strength was our team’s ability to work with one another. While members had differing technical abilities and confidence levels with the code, the whole group’s patience and open-mindedness was an asset to ensure that all members understood how the project methods functioned and related to one another. 

As a result of the strong teamwork and communication, our team was able to easily meet project deadlines and were able to spend a significant portion of our work time refactoring to increase the program’s efficiency and the code’s readability. 

## **Team Retrospective (“Retro”) Notes**

The initial meeting involved spending time defining our relationship and creating a document that we referenced at a follow up meeting halfway through the project. We conducted a team retrospective after our Game, League, and Season Statistics methods were written, but before we started to refactor our code. 

Tools used to manage our team retrospectives included Easy Retro (link to team board [here](https://easyretro.io/publicboard/hCf9IiepzkNRy7VkFIEZS282NqQ2/f03a04a6-4688-4b03-b827-6e723dfc9255) ) and Turing School’s “Defining the Relationship” document (linked [here](https://docs.google.com/document/d/1kuO7e6JDr8070d7C92KM60az6aF8HfFHGWNsn1\_NJQY/edit?tab=t.0) ). 

***Top three things that went well:***

1. Team communication  
2. Work ethic and drive  
3. Teamwork

***Top three things that we look forward to improving:***

1. Increasing our technical confidence, including in Git Workflow  
2. Using pseudocode to draft out a project first  
3. Taking breaks more often during long periods of work

## **Authors**

Jono Sommers

- [GitHub](https://github.com/jonosommers)  
- [LinkedIn](https://www.linkedin.com/in/jono-sommers-943812331/)  
   
Will Fox  
-	[GitHub](https://github.com/willfox0409)  
-	[LinkedIn](http://www.linkedin.com/in/williammacdonaldfox)

Patrick Shim  
-	[GitHub](https://github.com/pshim17)  
-	[LinkedIn](https://www.linkedin.com/in/patrickshim7/)

Coral Ruschak  
-	[GitHub](https://github.com/Coralruschak)  
-	[LinkedIn](https://www.linkedin.com/in/coral-ruschak-682898170/)  
 

Jillian Bleggi  
-	[GitHub](https://github.com/jbleggi)  
-	[LinkedIn](https://www.linkedin.com/in/jillian-bleggi-b12ab8287/)


![Team_FC_Binding_Pryers](files://C:/Users/jillian/fc_binding_pryers.png)