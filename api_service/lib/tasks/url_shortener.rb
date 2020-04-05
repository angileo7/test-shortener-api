# frozen_string_literal: true

require 'base64'

class UrlShortener

  def self.shorten(original_url)
    validated_url = handle_prefix(original_url)
    encode(validated_url)
  end

  def self.handle_prefix(link)
    if link[0..6] != 'http://' && link[0..7] != 'https://'
      return 'http://' + link
    end

    link
  end

  def self.encode(link)
    Base64.encode64(link)[0..5]
  end
end