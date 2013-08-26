# Bootswatch Rails gem

[![Build Status](https://www.travis-ci.org/scottvrosenthal/twitter-bootswatch-rails.png?branch=master)](https://www.travis-ci.org/scottvrosenthal/twitter-bootswatch-rails)

  - Integrates Bootstrap 3.0+ into the Rails Asset Pipeline
  - Easy optimization and control over which javascript and less modules are loaded 
    * *Not every app needs a carousel*
    * *easily optimize to just what your template needs*
  - Simple default less files for custom application themes 
    * `[theme_name]/variables.less`
    * `[theme_name]/bootswatch.css.less`
  - Apply different custom themes or bootswatches from a site like [bootswatch.com](http://bootswatch.com/)
  - Create several themed swatches for your project with theme_names
    * e.g. an admin *(backend)* theme and a storefront *(frontend)* theme
  - Quickly build custom Bootstrap templates using live refresh to see your changes

## Includes Bootstrap for Rails Asset Pipeline
[Bootstrap](http://getbootstrap.com/) is a toolkit designed to kickstart development of webapps and sites. It includes base CSS and HTML for typography, forms, buttons, tables, grids, navigation, and more.

## Demo

The [demo](https://github.com/scottvrosenthal/twitter-bootswatch-rails-demo) will show you how this gem can be used with the rails asset pipeline.

![Demo Screen Shot](https://github.com/scottvrosenthal/twitter-bootswatch-rails-demo/raw/master/demo.png)

## Install

Include the [Bootswatch Rails gem](http://rubygems.org/gems/twitter-bootswatch-rails) in Gemfile to install it from [RubyGems.org](https://rubygems.org):

```ruby

# twitter bootstrap css & javascript toolkit
gem 'twitter-bootswatch-rails'

```

or you can install from latest build;

```ruby
gem 'twitter-bootswatch-rails', :git => 'git://github.com/scottvrosenthal/twitter-bootswatch-rails.git'
```

Run bundle from command line

    bundle


## Installing to App (using Generators)

You can run the following generators to get started with Bootstrap.


If you don't provide a [theme_name] the value defaults to **bootswatch** and adds directives to your application.css and application.js files.


Usage:


    rails g bootswatch:install [theme_name]

Example:


    rails g bootswatch:install admin
    rails g bootswatch:install storefront

***

Layout (generates a basic Bootstrap compatible layout)

  - [haml-rails](https://github.com/indirect/haml-rails) gem supported
  - [slim-rails](https://github.com/slim-template/slim-rails) gem supported

Usage:


    rails g bootswatch:layout [theme_name]


Example:


    rails g bootswatch:layout admin
    rails g bootswatch:layout storefront

***

Themed (generates Bootstrap compatible scaffold views.)

  - [simple_form](https://github.com/plataformatec/simple_form) gem supported
  - [haml-rails](https://github.com/indirect/haml-rails) gem supported
  - [slim-rails](https://github.com/slim-template/slim-rails) gem supported


Usage (model and table must already exist):


    rails g bootswatch:themed [RESOURCE_NAME]


Example:


    rails g scaffold Post title:string description:text
    rake db:migrate
    rails g bootswatch:themed Posts

## Import a free [bootswatch.com](http://bootswatch.com/) theme

### Just follow these three steps in the following order :)

    rails g bootswatch:install cyborg
    rails g bootswatch:import cyborg
    rails g bootswatch:layout cyborg

The above creates a namespaced theme under assets/javascript/cyborg assets/stylesheets/cyborg and a new layout file.

The import generator pulls directly from the [bootswatch.com](http://bootswatch.com/) git repo [cyborg](https://github.com/thomaspark/bootswatch/tree/gh-pages/cyborg/) directory.

* bootswatch.less
* variables.less

In your rails controllers just tell it to use the cyborg layout.


```ruby
class ApplicationController < ActionController::Base
  # ...
  layout 'cyborg'
end
```

You can also create an admin namespaced theme and import the cyborg `bootswatch.less` and `variable.less` files:

    rails g bootswatch:install admin
    rails g bootswatch:import admin/cyborg
    rails g bootswatch:layout admin

*`bootswatch.less` is renamed to `bootswatch.css.less` by the import generator*

Need more examples? Check out the [demo](https://github.com/scottvrosenthal/twitter-bootswatch-rails-demo)

## Using stylesheets with the [less-rails](https://github.com/metaskills/less-rails/) gem

You have to require `[theme_name]/loader.css.less` in your application.css

```css
/*
 *= require_self
 *= require [theme_name]/loader
 *= require [theme_name]/bootswatch
*/
```

`[theme_name]/loader.css.less` allows you to easily comment out less modules you don't need in your application.

`[theme_name]/variables.less` customize Bootstrap `variables.less` defaults in this file.

`[theme_name]/bootswatch.css.less` customize the style of Bootstrap base css and component style here.

Check out some of the swatches at [bootswatch.com](http://bootswatch.com/)

Read up on the [less-rails](https://github.com/metaskills/less-rails/) gem.

***

#### base.less

When importing a custom `[theme_name]/bootswatch.css.less` file manually you'll need to include the following import directive at the top of the file:

```css
@import "[theme_name]/base";
```

The above less directive allows the current less file to access and override inherited less variables.

Example:

```css
@import "cyborg/base";
// Cyborg
// bootswatch.css.less
```

## Using Javascripts

You have to require the javascript script file `[theme_name]/loader.js` & `[theme_name]/bootswatch.js` in your application.js:

```javascript
//= require jquery
//= require jquery_ujs
//= require [theme_name]/loader
//= require [theme_name]/bootswatch
```

`[theme_name]/loader.js` allows you to easily comment out modules you don't need in your application:

```js
// [theme_name]/loader.js

//= require twitter/bootstrap/transition
//= require twitter/bootstrap/alert
//= require twitter/bootstrap/button
//= require twitter/bootstrap/carousel
//= require twitter/bootstrap/collapse
//= require twitter/bootstrap/dropdown
//= require twitter/bootstrap/modal
//= require twitter/bootstrap/tooltip
//= require twitter/bootstrap/popover
//= require twitter/bootstrap/scrollspy
//= require twitter/bootstrap/tab
//= require twitter/bootstrap/affix

```

`[theme_name]/bootswatch.js` allows you to add more customization & overrides to bootstrap javascript components.

***

## Misc

### Local rails development assets not updating?

```sh
RAILS_ENV=development rake assets:clean
```

***

### Less files are not found or loading errors for new rails application

*(Remove the default require_tree directive line from both the application.js & application.css files)*

```ruby
// remove the following line from application.js
//= require_tree .
```

```ruby
* remove the following line from application.css
*= require_tree .
```
***

### Adding custom assets to the asset pipeline when deploying

In config/application.rb add the [theme_name] files, e.g., `admin.js` & `admin.css` to config.assets.precompile:

```ruby
# Precompile additional assets
config.assets.precompile += %w(admin.js admin.css cyborg.js cyborg.css)
```

***

### Default generators to use less-rails gem

In config/application.rb add the following line:

```ruby
# less-rails gem (default all generators)
config.app_generators.stylesheet_engine :less
```

***

### List of Bootstrap plugins

  - [the-big-badass-list-of-twitter-bootstrap-resources](http://bootstraphero.com/the-big-badass-list-of-twitter-bootstrap-resources)

***

### Upgrading Bootstrap from 2.x to 3.0

- [migration](http://getbootstrap.com/getting-started/#migration)

***

## Versioning
Bootstrap [claims](https://github.com/twbs/bootstrap#versioning) to use SemVer, although this is for values of public API that don't seem to include selectively requiring all components (see breaking change 3.0.0 -> 3.1.0). Since many people using twitter-bootswatch-rails *do* selectively require CSS components and I consider it part of the public API we can't really follow SemVer without becoming wildly out of sync with the Bootstrap version number, which is confusing for everyone involved. Further releases to twitter-bootswatch-rails will therefore have version numbers of the form `3.x.x.y`, where `3.x.x` is the release of Bootstrap we should be compatible with, and `y` is the patch version.

## Changelog
  - v3.0.0.0
    * Updated to bootstrap 3.0.0
