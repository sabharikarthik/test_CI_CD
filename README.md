# README

This Rails application automates the execution of test cases using GitHub Actions, when a push/pull_request event occurs on the master branch. This application uses Ruby 2.6.3 and postgresql 10.10. Rspec and simplecov are used for defining test cases and to test their code coverage percent.

I ran the test cases on in-built ubuntu-latest VM provided by GitHub and reused
    - actions/checkout@master for cloning the master branch from the repository to a pre-configured sub-directory in the VM.
    - actions/setup-ruby@v1 to install ruby-2.6.x
    
Since I faced some issues while connecting to the postgres service exposed by GitHub, I have installed postgres manually in the VM and created a superuser which will be used for creation of database and executing queries on that.

GitHub secrets are used for storing the db_username, db_password, db_host and db_port variables.
