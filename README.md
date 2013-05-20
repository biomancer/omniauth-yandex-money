# OmniAuth Yandex.Money

This gem contains the Yandex.Money strategy for OmniAuth.

## Info

Actually Yandex has separate oauth login feature, which is implemented [here](https://github.com/evrone/omniauth-yandex) and which provides name, email, etc.

This gem is designed mainly to receive user's Yandex.Money account id in oauth way, without asking him to enter it manually. That provides better user experience and verifies that specified account id belongs to this specific user.

To get account id

    /api/account-info

call is used: [API reference](http://api.yandex.com/money/doc/dg/reference/account-info.xml)

The info returned is:

    info['name'] #account_id

    extra['account']
    extra['balance']
    extra['currency']
    extra['identified']
    extra['account_type']

The only requested scope is :

    account-info

For details see [this section](http://api.yandex.com/money/doc/dg/concepts/protocol-rights.xml).


Usage
-----

Add it to your Gemfile:

    gem 'omniauth-yandex-money`

In a Rails app, add `config/initializers/omniauth.rb`:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :yandex_money, "CLIENT_ID", "CLIENT_SECRET"
    end

To get client id and secret, register your Yandex.Money application as described [here] (http://api.yandex.com/money/doc/dg/tasks/register-client.xml).
CLIENT_SECRET is optional and its requirement is defined when you register Yandex.Money application.

## Known issues

No tests written currently.

## License

Copyright (c) 2013 by biomancer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.