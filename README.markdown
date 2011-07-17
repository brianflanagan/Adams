# Adams

...implements MetaWeblog in a simple Sinatra app. It uses Haml and DataMapper and is all set to be deployed on Heroku. I built it to power a blog which I'll write one day.

## Run!

    git clone git@github.com:brianflanagan/Adams.git
    cd Adams
    bundle

Shotgun it:

    bundle exec shotgun config.ru

or start Thin:

    bundle exec thin start

Now in MarsEdit, or the MetaWeblog-enabled _blogging application_ of your choice, point the API endpoint to 0.0.0.0:9393 (or 3000 if you're running via Thin). Publish a post in MarsEdit, and, in your browser, head to 0.0.0.0:9393 (or 3000 if you're running via Thin). See your post?

That's kablamo.

## Develop!

What you should is this:

    git remote rm origin
    git remote add origin git@github.com:MyName/MyBlogApp.git
    git push origin master

Go nuts. The app as-is does very little. Add pagination? Show the most recent posts on the index page? Maybe categories or tags? This is all gold; write this down.

The front-end app is called "Clover" and it lives in the "apps" folder.

## Test!

You can run the cukes thusly:

    bundle exec cucumber

Are there any specs? No, there are not. Should you write some to test the MetaWeblog API endpoint? Yep.

## Deploy!

Deploy it where you like. But why not Heroku?

    heroku create myblogapp
    git push heroku master

Awesome.