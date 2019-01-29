# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database - It has db and uses ActiveRecord
- [x] Include more than one model class (e.g. User, Post, Category) - App has 4 models
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - App has has_many and has_many_through
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Cabinet class has belongs_to
- [x] Include user accounts with unique login attribute (username or email) - true
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Cabinet class is CRUD'd up
- [x] Ensure that users can't modify content created by other users - other users can't modify users cabinets. Strains can't be modified once created.
- [ ] Include user input validations
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
