# Example: Using JWTs to protect a rails based API

This project is a Rails6 application that illustrates how to protect an API with a JWT. The JWT can be generated using a JWT library, as in this case, or by an OAuth server such as [FusionAuth](https://fusionauth.io/)

`/messages` is the only API endpoint. It returns a list of messages.

## Prerequisites
You will need the following things properly installed on your computer.

* [Git](http://git-scm.com/): Presumably you already have this on your machine if you are looking at this project locally; if not, use your platform's package manager to install git, and `git clone` this repo.
* [Ruby](https://www.ruby-lang.org/): Ruby can usually be installed using your platform's package manager, or by visiting the Ruby website and downloading an installer.

## Installation
* `git clone https://github.com/FusionAuth/fusionauth-example-rails-api`
* `cd fusionauth-example-rails-api`
* `bundle install`

## Running / Development

* In a terminal window, run `export HMAC_SECRET=this_really_should_be_a_long_random_alphanumeric_value_but_this_still_works`. This is the shared secret used to sign the JWT. You can also replace it with a string of your choosing.
* In a separate terminal window, run `export HMAC_SECRET=this_really_should_be_a_long_random_alphanumeric_value_but_this_still_works` again. (If you change it in one window, change it in another.
* Run `bin/rails server -p 4000` in one terminal window. This will start the server.

Now, test out a couple of different JWTs.

First run `bundle e rake generate_valid_jwt`. This will generate a curl command requesting the API and including a valid JWT. If you run the curl script, you should see the protected messages:

```
{"messages":["Hello"]}
```

First run `bundle e rake generate_invalid_jwt`. This will generate a curl command requesting the API, but the JWT generated will be expired. If you run the curl script, you will see a 403 message:

```
...
HTTP/1.1 403 Forbidden
...
```

You can also try running the curl script against the localhost:4000 endpoint without an `Authorization` header; your request will also be denied.

## Additional Resources

This blog post illustrates how to build this API in more detail: https://fusionauth.io/blog/2020/06/11/building-protected-api-with-rails-and-jwt
