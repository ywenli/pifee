module UserAuth
  module Tokeni
    def self.included(base)
      # Userクラスで Tokenizable を include したときに 'base.extend ClassMethods' が実行される
      base.extend ClassMethods
    end

    ## class method
    module ClassMethods
      # 渡されたトークンからユーザーを検索する
      # @param [String] token トークン
      # @return [String] トークンと合致するユーザー
      def from_token(token)
        auth_token = AuthToken.new(token: token)
        from_token_payload(auth_token.payload)
      end

      private

        def from_token_payload(payload)
          find(payload['sub'])
        end
    end

    end
  end
end
