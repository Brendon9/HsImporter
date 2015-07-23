$:.push File.dirname(__FILE__)

require 'rubygems'
require 'csv'
require 'json'
require 'dante'
require 'logger'
require 'eventmachine'
require 'eventmachine-tail'
require 'em-http-request'
require 'active_support'
require 'active_support/core_ext'
require 'hs_importer/version'

module Importer
  module ClassMethods
    def logger
      if !@logger
        @logger = Logger.new(STDOUT)
      else
        @logger
      end
    end
  end

  extend ClassMethods
end


module HsImporter

  @path = ARGV[0]
  @pipeline = []

  # EM.epoll
  #
  # EM.run do
  # 	trap('TERM') { EM.stop }
  # 	trap('INT') { EM.stop }
  #
  # 	# EventMachine::PeriodicTimer.new(1) do
  # 	# 	self.post_data(@pipeline.pop(@pipeline.length)) unless @pipeline.empty?
  # 	# end
  #
  # 	EventMachine::file_tail(@path) do |filetail, line|
  # 		# @pipeline << {:index => {:_index => @index, :_type => @type}}
  # 		# @pipeline << build_log_hash(line)
  # 		puts line
  # 	end
  #
  # 	EM.error_handler { |e| puts "ERROR: #{e.inspect}" }
  # end

  def string_to_hash(string)
  	return unless string.include?('TRANSITIONING')

  	inside = string[/\[(.*?)\]/].gsub(/[\[\]]/, '').split(/(\w+=)/).reject(&:empty?)
  	hash = Hash[*inside].inject({}) { |h, (k, v)| h[k.delete('=')] = v.strip; h }

  	puts hashie = Hashie::Mash.new(hash)
  	hashie
  end

  File.open(@path).each do |line|
  	if line.include?('[Zone]')
  		hash = string_to_hash(line.split(' - ')[1])
  	end
  end

end
