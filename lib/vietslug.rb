require "vietslug/version"

module Vietslug
  module ClassMethods
    def to_slug(str)
      str = str.to_s.strip.downcase
      accents = {
          %w[à á ạ ả ã â ầ ấ ậ ẩ ẫ ă ằ ắ ặ ẳ ẵ] => 'a',
          %w[è é ẹ ẻ ẽ ê ề ế ệ ể ễ] => 'e',
          %w[ì í ị ỉ ĩ] => 'i',
          %w[ò ó ọ ỏ õ ô ồ ố ộ ổ ỗ ơ ờ ớ ợ ở ỡ] => 'o',
          %w[ù ú ụ ủ ũ ư ừ ứ ự ử ữ] => 'u',
          %w[ỳ ý ỵ ỷ ỹ] => 'y',
          %w[đ] => 'd'
      }

      accents.each do |ac, rep|
        ac.each do |s|
          str = str.tr(s, rep)
        end
      end

      str = str.gsub(/[^a-zA-Z0-9 ]/, '')
      str = str.gsub(/[ ]+/, ' ')
      str.tr(' ', '-')
    end
  end

  extend ClassMethods
end
