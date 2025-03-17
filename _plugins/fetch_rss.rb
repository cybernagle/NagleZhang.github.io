require 'feedjira'
require 'open-uri'

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
          feed = Feedjira.parse(URI.open(url).read)
          file_path = File.join(data_dir, "#{name.downcase.gsub(' ', '_')}.yml")

          # 将数据写入 YAML 文件
          File.write(file_path, feed.entries.map { |entry| {
            "title" => entry.title,
            "url" => entry.url,
            "summary" => entry.summary || "No summary available",
            "published" => entry.published&.to_s || Time.now.to_s
          } }.to_yaml)
          puts "Successfully fetched #{name} RSS to #{file_path}"
        rescue StandardError => e
          puts "Error fetching #{name}: #{e.message}"
        end
      end
    end
  end
end
        # "Product Hunt" => "https://www.producthunt.com/feed",
