# Narwhal Project

## For Luke and Sheehan

This has the proper migrations all you need to do is clone this repo

    $ git clone git@github.com:austinbv/Narwhal.git
    
### Update!!!

I changed the `config/database.yml` and the `config/initializers/secret_token.rb`
to `config/example_database.yml` and `config/initializers/example_secret_token.rb`
inorder to use the rails application you need to create two new files and copy and
paste the example contents into the files. To do this in terminal run

    # Make sure you are at the base of the rails app
    $ cp config/example_database.yml config/database.yml && cp config/initializers/example_secret_token.rb config/initializers/secret_token.rb
   
Now you need to edit the two non example files. Database.yml should use your sql setting and secret token can really but anything

The .gitignore also includes these file so they will not add to the repo!

### end of update

Next in the directory that you clone down to run

    $ gem install bundler
    $ bundle

This should give you all the gems.  Now you need juggernaut

    $ rake db:create

Now migrate all the info into your new databases

    $ rake db:migrate

This should give you all the gems and a correct database.  

## Now you need juggernaut.

To install juggernaut you need to follow the guides

Sheehan your guide is here

    https://github.com/maccman/juggernaut/blob/master/README.md
    
Luke you need to install on ubuntu, I do not know what version of ubuntu but if you have 10.10 its
really simple and a guide can be found here. 

    http://www.giantflyingsaucer.com/blog/?p=2284
    
You will also need to compile redis from source

    http://redis.io/download
    
The guide is at the bottom of that page and compiled really easily on the dantzig.