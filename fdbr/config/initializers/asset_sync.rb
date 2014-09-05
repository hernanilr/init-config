if defined?(AssetSync)
# Recomendacao Running a high volume Rails app on Heroku for free encontrada em:
# collectiveidea.com/blog/archives/2012/11/26/setup-a-high-volume-site-on-heroku-for-free/
AssetSync.configure do |config|
  config.aws_access_key_id = ENV['FDAWS_KEY']
  config.aws_secret_access_key = ENV['FDAWS_SECRET']
  # To use AWS reduced redundancy storage (mais barata)
  config.aws_reduced_redundancy = true

  config.fog_provider = ENV['FOG_PROVIDER']
  config.fog_directory = ENV['FOG_DIRECTORY']
  # Increase upload performance by configuring your region
  config.fog_region = ENV['FOG_REGION']
  #
  # Don't delete files from the store
  config.existing_remote_files = "delete"
  # Automatically replace files with their equivalent gzip compressed version
  config.gzip_compression = true

  # Invalidate a file on a cdn after uploading files
  # config.cdn_distribution_id = "12345"
  # config.invalidate = ['file1.js']
  #
  # Use the Rails generated 'manifest.yml' file to produce the list of files to
  # upload instead of searching the assets directory.
  config.manifest = true
  #
  # Fail silently.  Useful for environments such as Heroku
  config.fail_silently = true
end
end