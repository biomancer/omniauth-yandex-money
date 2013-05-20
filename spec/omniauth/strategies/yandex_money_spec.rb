require 'spec_helper'
require 'omniauth-yandex-money'

describe OmniAuth::Strategies::YandexMoney do
  subject do
    OmniAuth::Strategies::YandexMoney.new(nil, @options || {})
  end

  it_should_behave_like 'an oauth2 strategy'

end