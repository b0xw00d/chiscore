chiscore
============

Scoring app for Chiditarod 2013 (and possibly beyond)

You need redis.

`brew install redis` and follow those instructions

You need bundle, and it needs to install some gems!

`gem install bundler && bundle `

You need node.js for compilation and running of JavaScript specs

`brew install node` if you don't has it,
then `npm install -g grunt-cli` -- the grunt-cli may require sudo.

Then, from the root `chiscore` directory, `npm install`

## Setup and Server
Run configuration tasks:
    `rake project_setup`

Start a local server:
    `unicorn` (or `rackup` if you're into that)

Start the Redis server(in a new tab or window):
    `redis-server`

Run ruby and js test suites:
    `rake spec_all`

## Other Stuff
Run the Ruby spec suite only:
    `rake spec`

Run the JavaScript spec suite only:
    `grunt spec`

Compile coffee and EJS templates:
    `grunt build`

Watch and compile coffee and EJS templates:
    `grunt watch`

Remove compiled JS targets:
    `grunt clean`

Logging in: dev environment
- use test-checkpoint / secret
- use a number between 1 and 160 to check in a team
