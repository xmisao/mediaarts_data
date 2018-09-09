#!/usr/bin/env ruby

require 'mediaarts_scraper'
require 'parallel'
require 'logger'

def scrape!(ans_id)
  series_page = MediaartsScraper::Page::AnimeSeriesPage.from_ans_id(ans_id)

  {
    anime_series: series_page.data.to_hash_without_copyrighted,
    packages: series_page.packages_pages.map{|packages_page| packages_page.data.to_hash_without_copyrighted},
    episodes: scrape_episodes_page(series_page.episodes_page)
  }
end

def scrape_episodes_page(episodes_page, memo = [])
  return [] unless episodes_page

  memo << episodes_page.data.to_hash_without_copyrighted[:episodes]

  scrape_episodes_page(episodes_page.next_page, memo)

  memo
end

def perform!(ans_id)
  data_file = "data/#{ans_id}.json"

  if FileTest.exist?(data_file)
    Log.warn(flag: 'already exist', ans_id: ans_id, worker_number: Parallel.worker_number)

    return false
  end

  data = scrape!(ans_id)

  open(data_file, 'w') do |f|
    f.puts JSON.pretty_generate(data)
  end

  true
rescue => e
  Log.error(error_class: e.class, message: e.message, backtrace: e.backtrace, ans_id: ans_id, worker_number: Parallel.worker_number)
end

ANS_MIN = 1
ANS_MAX = 22000
SLEEP_BASE = 1
SLEEP_RAND = 3
Log = Logger.new('internal.log')
summary = Logger.new('scrape.log')

summary.info('Begin')

summary.info(ans_min: ANS_MIN, ans_max: ANS_MAX)

ans_ids = (ANS_MIN..ANS_MAX)

Parallel.each(ans_ids) do |ans_id|
  Log.info(flag: 'start', ans_id: ans_id, worker_number: Parallel.worker_number)

  ret = perform!(ans_id)

  Log.info(flag: 'end', ans_id: ans_id, worker_number: Parallel.worker_number)

  sleep(rand(SLEEP_RAND) + SLEEP_BASE) if ret
end

summary.info('End')
