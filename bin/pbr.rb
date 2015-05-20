#!/usr/bin/ruby
# PushBullet Relay (aka - PBR)
# Push notification to your device using pushbullet's api.
# relies on the washbullet gem. 
# (gem install --user-install washbullet)

require 'washbullet'
require 'optparse'
require 'safe_yaml'
SafeYAML::OPTIONS[:default_mode] = :safe

configfile = File.expand_path("~/.pushbullet")

options = Hash.new('')

OptionParser.new do |opts|
  opts.on("-f", "--file FILE", "Config file containing API key") do |f|
    configfile = File.expand_path(f)
  end

  opts.on("-t", "--title TITLE", "Title for the push.") do |t|
    options[:title] = t
  end

  opts.on("-b", "--body BODY", "Push body.") do |b|
    options[:body] = b
  end
end.parse!

config = YAML.load_file(configfile)

#TODO:
# * device picker/ all devices
# * pull push content from flags.

c = Washbullet::Client.new(config['api_key'])
deviceid = nil
c.devices.on_complete do |r|
  if r.success?
    # arbitrarily pick the first one.
    #puts r.body['devices']
    deviceid = r.body['devices'][0]
  end
end

resp = c.push_note(deviceid, options[:title], options[:body])

unless resp.success?
  puts "Error pushing note:"
  puts resp.body
end
