# Book-Bridge📘


## Table of Contents
* [Description](#Description)
* [Demo Image](#Demo-Image)
* [Downloading and installing steps](#Downloading-and-installing-steps)
* [Features](#Features)

## Description
If you use this app, you can post and share reviews of your favorite books.
<br>
You can look for one's favorite books from various sources including authors and genres.
<br>
If you have any books you like, I can put them on for reference when I purchase them

##Demo Image
![Image](https://github.com/Nishimurasyota/Book-Bridge/blob/master/app/assets/images/new_book.jpg)
![Image](https://github.com/Nishimurasyota/Book-Bridge/blob/master/app/assets/images/book_show.jpg)
![Image](https://github.com/Nishimurasyota/Book-Bridge/blob/master/app/assets/images/book_index.jpg)

## Downloading and installing steps

1. Clone this repository
```bash
$ git clone https://github.com/Nishimurasyota/Book-Bridge.git
```

2. Go into the repository
```bash
$ cd Book-Bridge
```

3. Gem install
```bash
$ bundle install
```

4. Initial devise configuration
```bash
$ rails g devise:install
```

5. Prepare a table for tags
```bash
$ rake acts_as_taggable_on_engine:install:migrations
```

6. Create table
```bash
$ bin/rails db:migrate
```

7. Run the app
```bash
$ bin/rails s
```

## Features
* Keyword search function
* Tag retrieval function
* Mylist function