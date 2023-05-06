# Omniauth::Zalo2

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/omniauth/zalo2`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-zalo2'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install omniauth-zalo2

## Before you begin

Access to [zalo-developer](https://developers.zalo.me/apps) and create new one if you don't have any app, then take note your `client-id(App Ung dung)` and `client-secret(Khoa bi mat Ung dung)`, set Callback-url.

## Usage
OmniAuth::Strategies::Zalo2 is simply a Rack middleware.
Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

- Without `devise`

```ruby
# config/initializers/omniauth.rb
    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, ENV['ZALO_APP_ID'], ENV['ZALO_APP_SECRET'], scope: 'id,name,picture', callback_url: ENV['ZALO_CALLBACK']
    end
```

- With `devise`
```ruby
# config/initializers/devise.rb
    config.omniauth :zalo, ENV["ZALO_APP_ID"], ENV["ZALO_APP_SECRET"], scope: 'id,name,picture', callback_url: ENV['ZALO_CALLBACK']
```

## Configuring

- Ref: https://developers.zalo.me/docs/api/social-api/tai-lieu/thong-tin-ten-anh-dai-dien-post-28
- By default zalo only allowed get `id,name,picture`, if you need more infos like `phone_number` you need to register with them.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/trungle1612/omniauth-zalo2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/omniauth-zalo2/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omniauth::Zalo2 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/trungle1612/omniauth-zalo2/blob/master/CODE_OF_CONDUCT.md).
