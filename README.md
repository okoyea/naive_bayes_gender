## Naive Bayes Gender Classifier

This app uses the Naive Bayes classifier to predict what gender a sample is given the height and weight.

##Setup and Run

You'll need the latest ruby, which is version `2.1.1`

```
cd location_for_repo
git clone https://github.com/okoyea/naive_bayes_gender.git
cd naive_bayes_gender
bundle
rake db:create
rake db:migrate
```

Enter `rails s` to start the server and navigate to localhost:3000

##Tests

Tests can be run from the root foler with `rspec`