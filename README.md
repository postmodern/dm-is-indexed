# dm-is-indexed

* [Homepage](http://github.com/postmodern/dm-is-indexed#readme)
* [Issues](http://github.com/postmodern/dm-is-indexed/issues)
* [Documentation](http://rubydoc.info/gems/dm-is-indexed/frames)

## Description

TODO: Description

## Features

## Examples

    require 'dm-is-indexed'

    class User

      include DataMapper::Resource

      property :id, Serial

      property :name, String, :unique => true

    end

    User[10]
    # => #<User: @id=10 @name="alice">

    User["eve"]
    # => #<User: @id=20 @name="eve">

## Requirements

* [dm-core](http://github.com/datamapper/dm-core#readme) ~> 1.0

## Install

    $ gem install dm-is-indexed

## Copyright

Copyright (c) 2011 Hal Brodigan

See {file:LICENSE.txt} for details.
