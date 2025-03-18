require 'feedjira'
require 'open-uri'
require 'rss'
require 'yaml'
require 'nokogiri'

module Jekyll
  class RSSGenerator < Generator
    safe true
    priority :low

    def generate(site)
      # 定义 RSS 来源
      feeds = {
        "Reddit Entrepreneur" => "https://www.reddit.com/r/Entrepreneur/.rss",
        "Investing" => "https://www.investing.com/rss/news.rss",
        "Hacker News" => "https://news.ycombinator.com/rss",
        "Startup Stories" => "https://feeds.feedburner.com/Mixergy-main-podcast",
        "BitCoin News" => "https://cointelegraph.com/rss/tag/bitcoin",
        "Eth News" => "https://cointelegraph.com/rss/tag/ethereum",
        "Crypto Market" => "https://cointelegraph.com/rss/category/market-analysis",
        "Crypto Weekly Overview" => "https://cointelegraph.com/rss/category/weekly-overview"
      }

      # 确保 _data 目录存在
      data_dir = File.join(site.source, "_data")
      Dir.mkdir(data_dir) unless Dir.exist?(data_dir)

      feeds.each do |name, url|
        begin
          # 抓取 RSS 数据
          feed = fetch_rss_feed(url)
          file_path = File.join(data_dir, "#{name.downcase.gsub(' ', '_')}.yml")

          # 将数据写入 YAML 文件
          save_to_yaml(feed, file_path)
          puts "Successfully fetched #{name} RSS to #{file_path}"
        rescue StandardError => e
          puts "Error fetching #{name}: #{e.message}"
        end
      end
    end
  end
end

def fetch_rss_feed(url)
  URI.open(url) do |rss|
    feed = RSS::Parser.parse(rss)
    feed.items.map do |item|
      {
        "title" => item.title,
        "url" => item.link,
        "summary" => format_summary(item),
        "published" => item.pubDate
      }
    end
  end
end

def format_summary(item)
  summary = if item.respond_to?(:description) && item.description
              item.description
            elsif item.respond_to?(:content) && item.content
              item.content
            elsif item.respond_to?(:summary) && item.summary
              item.summary
            else
              "No summary available"
            end

  # Check if the summary contains HTML tags
  if summary =~ /<\/?[a-z][\s\S]*>/i
    # Parse and clean the HTML content
    Nokogiri::HTML(summary).text
  else
    summary
  end
end

def save_to_yaml(data, filename)
  File.open(filename, 'w') do |file|
    file.write(data.to_yaml)
  end
end
