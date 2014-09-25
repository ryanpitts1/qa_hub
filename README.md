# QA Hub

### Purpose of This Application
I worked in a quality assurance department for Dealertrack, a major web development company in the automotive industry. The development teams excelled in their development processes.  When I came on board the quality assurance team I was the second member on the team (there was one single QA member running the department before I came aboard).  I notied very quickly that we did not have the correct processes (or any real processes) in place to keep up with the pace of development and maintain a high level of quality work.  Knowing this, I decided to build an application to help the quality assurance department stay consistent in their testing processes and ensure that only the highest quality code was getting to production. As the team grew (sitting around 20 the day i left the company) I saw how the QA Hub really was a powerful and essential tool in our release cycles. It allowed everyone on the team to stay up-to-date with how a release was going, what was left to be done, and what important things to be mindful of. As of 09/24/2014 I have verified that this application is still in use by the quality assurance team at Dealertrack.

*NOTE: The code in this repository is not the MOST current version of the application I built. I was unable to keep a copy of the code after a certain date because the company I was working for (ClickMotive) got acquired (by Dealertrack) and I lost rights to the application in the process.  Features listed below as "after acquisition" were implemented after the acquisition and thus, not in this repository. I have also had to remove a lot of the data that was in the application and have aonly added some example  data in the `seeds.rb` file to seed some of the data tables.

### Features
+ Authentication (using Devise).
+ Ability to create and manage releases.
  + Ability to assign primary and backup contacts to a release.
  + Ability to setup release dates and code cutoff dates for a release.
  + Ability to keep track of when a release was created and last updated.
  + Ability to archive releases and view them later.
+ Each release had a checklist attached to it.
  + Each release had a three-part checlist; development, stage, and production.
  + Each release checklist also had a section at the top denoting what products with the platform would be affected by the release.
  + With each checklist you can keep track of what items have been completed and have yet to be completed for a given release.
  + Each checklist item had the ability to be toggled as "not applicable" if it did not apply for a given release.
+ Each release had the ability to attach release items to it.
  + These items would be similar copies of the stories that we would use in our project management tool.
  + They were important because we could specify the imporant things to note about a story (designs and browsers affected, risk level, comfort level, etc)
  + Each release item was added to a bucket in which it belonged to based on the type of item it was.
+ Comments
  + Ability to add and update comments for any checklist item or release item.
  + Checklist items had the ability to have multiple comments on them so that a conversation could be held surrounding a checklist item.
+ Projects
  + Projects were tracked separately within the release checklists.  They had their own section so that we could be sure they were accounted for as they would include major code changes.
+ Download to CSV (after acquisition)
  + Ability to download all of the release items in a formatted CSV file for a given release.
  + This helped the project manager get a good understanding of what was going to be released in a given cycle.
  + This CSV was also used to send out to account executives to review their clients sites in the staging environment to verify their issues were resolved.
+ Sending emails through the application (after acquisition)
  + Ability to send two emails from within the application.
    + The first email would be sent out at the code cutoff date to all parties invested in the release cycle.
    + The second email would be sent out after the release was pushed to production and would indicate if any issues arose or things had to be rolled back during the deployment to production.
+ Release Notes with Versioning (after acquisition)
  + Ability to keep track of any notes related to a given release.
  + Versioning was used as a historical archive to search through if any issues arose during a release.
+ Rspec Testing (after acquisition)
  + The majority of the Rspec tests were created after the acquisition and thus, are not in this repository.
  + The testing was created using Rspec, Capybara, and Factory Girl.

### Setup Instructions

1. Clone Repo
2. Run 'bundle install'
6. Run 'rails generate devise:install'
3. Change DB settings
4. Run 'rake db:migrate'
5. Run 'rake db:seed'
6. Run 'rails s'
7. View Site