# frozen_string_literal: true

require 'omniauth-oauth2'
require "base64"

module OmniAuth
  module Strategies
    class Zalo2 < OmniAuth::Strategies::OAuth2
      option :name, 'zalo2'
      option :pkce, true

      option :client_options, {
        site: 'https://oauth.zaloapp.com',
        authorize_url: '/v4/permission',
        token_url: '/v4/access_token'
      }

      # ref https://developers.zalo.me/docs/api/social-api-4
      def raw_info
        @raw_info ||= access_token.get(
          "https://graph.zalo.me/v2.0/me?access_token=#{access_token.token}&fields=id,name,picture,phone"
        ).parsed || {}
      end

      uid { raw_info['id'].to_s }

      info do
        {
          'name'    => raw_info['name'],
          'picture' => raw_info['picture']['data']['url']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def authorize_params
        super.tap do |params|
          params[:app_id] = options[:client_id]
        end
      end

      def callback_url
        options[:callback_url] || (full_host + script_name + callback_path)
      end

      def build_access_token
        # ref https://gitlab.com/oauth-xx/oauth2/-/blob/main/lib/oauth2/client.rb#L118
        response = client.request(
          client.options[:token_method],
          client.token_url,
          {
            headers: { "secret_key" => "#{options[:client_secret]}"},
            body: get_tokens_params,
            parse: :json
          }
        ).parsed

        # ref https://gitlab.com/oauth-xx/oauth2/-/blob/main/lib/oauth2/access_token.rb#L19
        ::OAuth2::AccessToken.from_hash(client, response)
      end

      def get_tokens_params
        {}.tap do |params|
          params[:code]          = request.params['code']
          params[:app_id]        = options[:client_id]
          params[:grant_type]    = 'authorization_code'
          params[:code_verifier] = pkce_token_params[:code_verifier]
        end
      end
    end
  end
end
