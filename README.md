# Resourceable

Resourceable is a reusable module in Ruby on Rails that provides common CRUD (Create, Read, Update, Delete) actions for handling resources (models) in a Rails application. It allows you to quickly set up resourceful actions for your models, following Rails conventions.

## How to Use

To use the Resourceable module in your Rails application, follow these steps:

1. Copy the `resourceable.rb` file containing the module code into your `app/controllers/concerns` directory.

2. Include the Resourceable module in your controller class by using the `include` keyword:

```ruby
class UsersController < ApplicationController
  include Resourceable

  # Your controller code specific to the Users resource
end
```

1. Ensure that your controller follows Rails conventions for resourceful routing and model naming. The module will automatically handle common CRUD actions for your resource.

2. Customize the views and routes as per your application's requirements.

## Features
Resourceable provides the following features:

**Index Action**: Retrieves all instances of the resource's class and responds to HTML and JSON formats.

**Show Action**: Retrieves and shows a single resource.

**Edit Action**: Renders a form to edit the resource.

**Update Action**: Updates the resource based on the submitted form data.

**New Action**: Renders a form to create a new resource.

**Create Action**: Creates a new resource based on the submitted form data.

**Destroy Action**: Deletes a resource from the database.

**Strong Parameters**: Utilizes Rails' strong parameters to permit attributes for mass assignment, ensuring security.


##  Example
Let's assume you have a `User` model in your Rails application. By including the `Resourceable` module in your controller, you automatically get the CRUD actions for your User resource:
``` ruby
class UsersController < ApplicationController
  include Resourceable

  # Other controller code specific to the Users resource
end
```

With the above code, the UsersController now has the index, show, edit, update, new, create, and destroy actions for the User model. You can access these actions as follows:

- **GET** `/users:` Index action
- **GET** `/users/1:` Show action
- **GET** `/users/1/edit:` Edit action
- **PATCH** `/users/1` or **PUT** `/users/1:` Update action
- **GET** `/users/new:` New action
- **POST** `/users:` Create action
- **DELETE** `/users/1:` Destroy action
Remember to define the User model in your application to avoid errors.
