#!/usr/bin/env ruby

require 'json'
require 'rest-client'

URL=ENV['URL'] || "http://httpbin.org/post"

$stdin.each_line do |line|
  RestClient.post URL, line, content_type: "application/json"
end
