# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Installing Rails

    Before you install Rails, you should check to make sure that your system has the proper prerequisites installed. These include:

    Ruby

    SQLite3

* Installing Ruby

    Open up a command line prompt. On macOS open Terminal.app; on Windows choose "Run" from your Start menu and type cmd.exe. Any commands prefaced with     a dollar sign $ should be run in the command line. Verify that you have a current version of Ruby installed:

    please use link to install RVM (https://rvm.io/rvm/install)

    $ rvm install 3.0.2
 
    $ ruby --version

    Rails requires Ruby version 2.7.0 or later. It is preferred to use latest Ruby version. If the version number returned is less than that number (such     as 2.3.7, or 1.8.7), you'll need to install a fresh copy of Ruby.

    To install Rails on Windows, you'll first need to install Ruby Installer.

    For more installation methods for most Operating Systems take a look at ruby-lang.org.

* Installing SQLite3

    You will also need an installation of the SQLite3 database. Many popular UNIX-like OSes ship with an acceptable version of SQLite3. Others can find     installation instructions at the SQLite3 website.

    Verify that it is correctly installed and in your load PATH:

    $ sqlite3 --version (The program should report its version.)

* Installing Rails

    To install Rails, use the gem install command provided by RubyGems:

    $ gem install rails

    To verify that you have everything installed correctly, you should be able to run the following in a new terminal:

    $ rails --version

* Clone repository in your local machine

    git clone https://github.com/madhavanror/EkanekUpload.git

    $cd EkanekUpload

* Starting up the Web Server

    $rails server

    If you are using Windows, you have to pass the scripts under the bin folder directly to the Ruby interpreter e.g. ruby bin\rails server.

    JavaScript asset compression requires you have a JavaScript runtime available on your system, in the absence of a runtime you will see an execjs error during asset compression. Usually macOS and Windows come with a JavaScript runtime installed. therubyrhino is the recommended runtime for JRuby users and is added by default to the Gemfile in apps generated under JRuby. You can investigate all the supported runtimes at ExecJS.

    This will start up Puma, a web server distributed with Rails by default. To see your application in action, open a browser window and navigate to http://localhost:3000. You should see the Ekanek Login page:

    Pages:(Screenshot attached in github)
    
     1 - Login Page
     ![](https://raw.githubusercontent.com/madhavanror/EkanekUpload/main/app/assets/images/Login-form.png)
     2 - Signup page
     ![](https://raw.githubusercontent.com/madhavanror/EkanekUpload/main/app/assets/images/create-new-account.png)
     3 - Documents Page
     ![](https://raw.githubusercontent.com/madhavanror/EkanekUpload/main/app/assets/images/dashboard.png)
     4 - New Document Page
     ![](https://raw.githubusercontent.com/madhavanror/EkanekUpload/main/app/assets/images/create-new-document.png)

* The Rails Test Runner

    We can run all of our tests at once by using the following command.

    $rails test

    Or we can run a single test file by passing the bin/rails test command the filename containing the test cases.

    $ rails test test/models/document_test.rb

    Running 4 tests in a single process (parallelization threshold is 50)
    Run options: --seed 20089

    # Running:

    ....

    Finished in 0.594222s, 6.7315 runs/s, 11.7801 assertions/s.
    4 runs, 7 assertions, 0 failures, 0 errors, 0 skips
