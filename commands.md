# Migrations

# Active storage
```
rails active_storage:install
```

# User
```console
rails g scaffold User username name
```
# Tweet
```console
rails g scaffold Tweet body:text comments_count:integer user:references
```
# Comment
```console
rails g scaffold Comment user:references tweet:references body:text
```

# Devise
```
rails generate devise:install
```
```
rails generate devise:views
```
```
rails generate devise User
```
