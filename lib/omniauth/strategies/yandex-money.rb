require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class YandexMoney < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = "account-info"

      option :name, 'yandex_money'

      option :client_options, {:site => 'https://sp-money.yandex.ru'}


      option :authorize_options, [:scope, :response_type]

      uid { @parsed_uid ||= raw_info['account'] } #4100123456789
    
      info do
        prune!({
                   'name' => raw_info['account']
               })
      end

      extra do
        prune!({
                   'account' => raw_info['account'],
                   'balance' => raw_info['balance'],
                   'currency' => raw_info['currency'],
                   'identified' => raw_info['identified'],
                   'account_type' => raw_info['account_type']
               })
      end

      def raw_info
        @raw_info ||= load_identity()
      end

      def authorize_params
        super.tap do |params|
          params[:scope] ||= DEFAULT_SCOPE
          params[:response_type] ||= 'code'
        end
      end

      private
        def load_identity
          access_token.get('https://money.yandex.ru/api/account-info').parsed || {}
        end

        def prune!(hash)
          hash.delete_if do |_, value|
            prune!(value) if value.is_a?(Hash)
            value.nil? || (value.respond_to?(:empty?) && value.empty?)
          end
        end

    end
  end
end

OmniAuth.config.add_camelization 'yandex_money', 'YandexMoney'