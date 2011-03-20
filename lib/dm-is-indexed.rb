require 'dm-core'
require 'dm-is-indexed/is/indexed'

DataMapper::Model.append_extensions DataMapper::Is::Indexed
