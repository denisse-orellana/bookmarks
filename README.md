# Bookmarks app

This project present a Bookmark app done from scratch implementing AJAX (Asynchronous JavaScript and XML) and graphics to display the data information.

## Ruby & Rails Version

* ruby '2.6.1'
* gem 'rails', '~> 5.2.6'

## Ruby Gems

```ruby
gem "bootstrap", "~> 5.1"
gem "jquery-rails", "~> 4.4"
gem "faker", "~> 2.19"
gem "chartkick", "~> 4.1"
gem "groupdate", "~> 5.2"
gem "font-awesome-rails", "~> 4.7"
``` 

## 1. Model diagram 

<p align="center"><img width="100%" src="app/assets/images/bookmark_diagram.drawio.png"></p>

The image shows that Category and Type share a has many association with Bookmarks. At the same time, Category works as reflexive association that will contain new categories inside itself, called subcategories.

### 1.1. Defining the model

The models are implemented as it is describe next:

```console
rails g model Type name
rails g model Category name visibility:boolean category:references
rails g model Bookmark title url type:references category:references
```

The controllers are also implemented as:

```console
rails g controller Types index
rails g controller Categories index
rails g controller Bookmarks index
```

## 2. Bookmark CRUD

