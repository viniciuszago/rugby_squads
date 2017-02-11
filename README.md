Rugby Squads
===================

This is a sample project of create a Rugby Squad from a Json file.

- This program will output an entirely Rugby Squad of 15 athletes using the following criteria:
  - No players in the team should be injured
  - The team should be a valid Rugby Union team - (2 props, 1 hooker, 2 locks, 2 flankers, 1 Number Eight, 1 Scrum Half, 1 Out Half, 2 Centres, 2 Wingers, 1 Full Back)

The program output contains the following - squad name, squad ID and a list of the players with their position, eg 'prop - Colm Doyle'

##**Technical Specifications**
-------------

###**Dependencies:**

 * `ruby version 2.3.3`
 * `bundle`

### **To install gem dependencies:**
`bundle install`

### **To run test stack:**
`bundle exec rake test`

It will run everything inside `spec` folder, as described in `Rakefile`.

### **To run the program:**
`ruby app.rb`
