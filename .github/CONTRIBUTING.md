# Contributing to Luda

First off, thank you for considering contributing to Luda! :smiley:

Your kindly help will makes Luda a great tool keeps being improved.
Please take a few minutes to review this document to get you started.

## Communication Channels

Before starting your contributing journey,
please get familliar with Luda through [the offical site](https://oatw.github.io/luda).

[The gitter chatroom of Luda](https://gitter.im/oatw/luda)
is a good place to communicate with other contributers.

[Stackoverflow](https://stackoverflow.com/questions/tagged/luda)
is the recommanded way for submitting usage questions.
__It's highly appreciated if anybody who has enough Stackoverflow reputations
can help to create a _luda_ tag.__ :kiss:

## Using the Issue Tracker

The [issue tracker](https://github.com/oatw/luda/issues)
is the preferred channel for [bug reports](#bug-reports),
[features requests](#feature-requests) and [submitting pull requests](#pull-requests).

Please don't use the issue tracker for personal support requests,
the [communication channels](#communication-channels) are better ways to get help.

## Documentation

The documentation of Luda is written in Markdown, the Markdown files are in the
[`site/markdown`](https://github.com/oatw/luda/tree/develop/site/markdown)
directory of this repository.

I'm not a native English speaker,
I'm afraid there may be some
grammar mistakes and unclear expressions in the documents.
__It's a big thing to Luda if anyone can help
to improve the documentation.__ :collision: 

## Bug Reports

Good bug reports are extremely helpful!
Please fill the issue template as detail as possible when you report bugs.
Thanks a lot!

:warning: __For security bugs, don't use the issue tracker!__
Please send your reports to [oatwoatw@gmail.com](mailto:oatwoatw@gmail.com) instead.

## Feature Requests

Your suggestion is important to Luda.
If you find yourself wishing for a feature that doesn't exist in Luda,
you are probably not alone.
Open an issue on the issues list
which describes the feature you would like to see, why you need it, and how it should work.

## Pull Requests

:thought_balloon: __Please describe your ideas before contributing your code to Luda__.
Are you going to add a new feature or fix a bug? How would you implement it?
You'd better start coding after getting a confirmation reply,
since unconfirmed pull requests may not be merged.

Luda follows the [Forking workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow).
You need fork this repository before embarking pull requests.
Only pull requests to the [`develop`](https://github.com/oatw/luda/tree/develop) branch will be merged.
So a new branch based on the `develop` branch is needed
when you're going to fix a bug or add a new feature.

## Development Setup

You will need install [Node.js](https://nodejs.org) version 8+,
[Yarn](https://yarnpkg.com) version 1.10+, [Ruby](https://www.ruby-lang.org) version 2.5+
and [Bundler](https://bundler.io/) version 2+.

Then, under the root of your local repo, run:

``` bash
# Check if necessary commands are able to be executed and install all dependencies.
$ npm run doctor
```

## Source Files

[`src/sass`](https://github.com/oatw/luda/tree/develop/src/sass):
constains the sass source files,
the sass files will be compiled to theme css files before every release.

[`src/coffee`](https://github.com/oatw/luda/tree/develop/src/coffee):
constains the coffeescript source files,
the coffeescript files will be compiled to js files before every release.

[`src/html`](https://github.com/oatw/luda/tree/develop/src/html):
contains the html files for defining component structures.

## Commonly Used NPM Scripts

``` bash
# Start a local server for development.
# The default port is 3333, you can change the default port by
# adding a space and --luda:port=your_port_number at the end of this command.
$ npm run luda

# Start a local server for writting documentation and previewing the site.
# The default port is 3334, you can change the default port by
# adding a space and --luda:sitePort=your_port_number at the end of this command.
$ npm run site
```

## License

By contributing your code,
you agree to license your contribution under the
[MIT license](https://github.com/oatw/luda/blob/master/LICENSE).
