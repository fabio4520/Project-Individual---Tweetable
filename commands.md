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
```
rails g scaffold Tweet body:text comments_count:integer user:references
```
# Comment
```
rails g scaffold Comment user:references tweet:references body:text
```
