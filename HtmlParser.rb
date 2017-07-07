# encoding: utf-8

require 'open-uri'
require 'nokogiri'

# url = 'https://perapera.co/category/fundraising'
# charset = nil
# html = open(url) do |f|
#   charset = f.charset # 文字種別を取得
#   f.read # htmlを読み込んで変数htmlに渡す
# end
# # htmlをパース(解析)してオブジェクトを生成
# doc = Nokogiri::HTML.parse(html, nil, charset)
# # タイトルを表示
# p doc.title


# スクレイピング先のURL
url = 'https://perapera.co/category/fundraising'

charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end

# htmlをパース(解析)してオブジェクトを生成
doc = Nokogiri::HTML.parse(html, nil, charset)

doc.xpath('//div[@class="eventNewsBox"]').each do |node|
	# タイトルを表示
	p node.css('h3').inner_text
	p node.css('img').attribute('src').value
	p node.css('a').attribute('href').value
end
