You have been tasked with creating an Object-Oriented system to keep track of the happenings at a certain educational institution. Based on a product planning session, you have determined that these are the classes you will need:

* `Student`
* `SystemCheck`
* `SystemCheckSubmission`
* `Cohort`

To get started:

```
$ et get cohort-stats
$ bundle install
$ rspec spec
```

Let the tests guide your development.

## Requirements for Meeting Expectations

* Write the code to make the test suite pass.

## Tips

* Focus on one failing test at a time:
  - Add the line `--fail-fast` to the `.rspec` file.
  - Run one spec file at a time with the following command: `rspec spec/lib/student_spec.rb`
* Create the classes in the order listed above.
* RSpec will tell you exactly what to do. Use the following workflow:
  - Run the test suite
  - Read the error message
  - Correct the error
  - Repeat
* **DO NOT** start the requirements for exceeding expectations before you have completed the requirements necessary for meeting expectations.

## Requirements for Exceeding Expectations

Write a `Lesson` class that the `SystemCheck` class will inherit from. Other classes that will inherit from `Lesson` are: `Article`, `Challenge`, and `Video`. Write those classes as well.

* The `Lesson` class should have `name` and `body` instance variables, which should be readable and writeable.
* The `Lesson` class should have a `#submittable?` method that returns `false`.
* However, the `Challenge` and `SystemCheck` classes are submittable. Ensure that calling `#submittable?` on these objects returns `true`.
* A `SystemCheck` is the only class that should have a grade.
* A `Video` class has a `url` instance variable that is readable, but not writeable.
* Write RSpec tests for these functionalities.

__Note__: Make sure to refactor the `SystemCheck` class and RSpec test so that `Lesson`s have the appropriate functionality.
