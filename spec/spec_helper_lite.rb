ENV['RAILS_ENV'] ||= 'test'

require "bundler/setup"
require 'minitest/autorun'
require 'ostruct'
require 'active_record'
module SpecHelpers
  def setup_nulldb
    schema_path = File.expand_path('../db/schema.rb',
                                   File.dirname(__FILE__))
    ActiveRecord::Base.establish_connection :adapter => :nulldb,
                                            :schema  => schema_path
  end

  def teardown_nulldb
    NullDB.restore
  end
end
