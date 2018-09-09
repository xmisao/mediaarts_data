desc 'Scrape all data. WARNING: This task take several hours. Total download size is upper 1GB.'
task :scrape do
  sh 'scripts/scrape.rb'
end

desc 'Package scraped data to release.'
task :package do
  sh 'scripts/package.sh'
end

desc 'Copy some data from data directory to samples directory.'
task :sample do
  sh 'scripts/sample.sh'
end
