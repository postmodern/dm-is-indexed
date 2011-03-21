require 'dm-core'
require 'dm-types'
require 'dm-is-indexed'

class Atom

  include DataMapper::Resource

  is :indexed

  property :id, Serial

  property :symbol, String, :unique => true

  property :name, String, :unique => true

  property :atomic_weight, Float, :index => true

  property :url, URI, :index => true

end
