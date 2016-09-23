# README

### It Takes a Village | Ruby on Rails Independent Project

#### By Sky Rousse

## Description

_A social web app that helps neighbors support each other. In order to find and receive help/support users can create an account and setup a profile. Once logged in users can create their own posts and view all of their neighbors posts._

### Schematic
* Find file named schematic in root directory of this project, copy all xml code
* visit: http://ondras.zarovi.cz/sql/demo/
* click Save/Load in upper right of page
* under box with heading 'client' click Load XML and past in code



| Requirements  | Complete  |
| ------------- | ----:|
| Does your code meet general coding standards (commits, spacing, naming, etc)? | -- |
| Is there thorough test coverage - unit and integration? | -- |
| Do your routes follow proper convention including a root route?
 | -- |
| Is your application logic in the models (not the controller)?
 | -- |
| Did you use success and error flash messages?
 | -- |
| Are form and route helpers present and functioning?
 | -- |
| Does the app use the asset pipeline for Bootstrap/CSS?
 | -- |
| Does the application work?
 | -- |


### Configuration

#### Development Gems
* divise
* bootstrap
* paperclip
* letter_opener
*

#### Testing Gems
* shoulda-matchers
* rspec-rails
* pry
* capybara
* launchy
* simplecov
* factory_girl_rails
* letter_opener

1. Clone the repository from GitHub
```
$ https://github.com/SkyRousse/it_takes_a_village_rails.git
```
2. bundle
```
$ bundle install
```
3. Set up the Database
* Database initialization
```
$ postgres
```
* Database creation and pre-population
```
$ rake db:create
```
```
$ rake db:migrate db:test:prepare
```
```
$ rake db:seed
```
* Launch the Rails server
```
$ rails server
```

## Known Bugs

* _No known bugs_

## Devise resources

_Devise README_
http://devise.plataformatec.com.br/

_Devise How Tos_
https://github.com/plataformatec/devise/wiki/How-Tos

_How to test with Capybara_
https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara

## Support and contact details

_If you run into any issues or have questions, ideas, or concerns, please feel free to contact Noah:_

* _Sky Rousse: <a href="mailto:skyrousse@gmail.com">skyrousse@gmail.com</a>_

### License

*MIT License*

The MIT License (MIT)
Copyright (c) 2016, Sky Rousse
https://opensource.org/licenses/MIT
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
