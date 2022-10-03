# frozen_string_literal: true
# 単数の時はObjectで複数の時はエンベロープする
module EnvelopeRenderer
  extend ActiveSupport::Concern

  included do
    def render(*args)
      options = args.extract_options!
      options[:adapter] = :json if options[:json].is_a?(Enumerable)
      args << options

      super(*args)
    end
  end
end
