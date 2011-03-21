# dm-is-indexed

* [Homepage](http://github.com/postmodern/dm-is-indexed#readme)
* [Issues](http://github.com/postmodern/dm-is-indexed/issues)
* [Documentation](http://rubydoc.info/gems/dm-is-indexed/frames)

## Description

dm-is-indexed overloads the `Model[]` method, and allows querying Resources
using their indexed properties.

## Examples

    require 'dm-is-indexed'

    class Atom

      include DataMapper::Resource

      is :indexed

      property :id, Serial

      property :symbol, String, :unique => true

      property :name, String, :unique => true

      property :atomic_weight, Float, :index => true

    end

Traditional Array style access is preserved:

    Atom[0]
    # => #<Atom: @id=1 @symbol="He" @name="Helium" @atomic_weight=4.002602>

    Atom[0,1]
    # => [#<Atom: @id=1 @symbol="He" @name="Helium" @atomic_weight=4.002602>,
          #<Atom: @id=2 @symbol="Ne" @name="Neon" @atomic_weight=20.1797>]

Query resources based on their unique indexed properties:

    Atom["Kr"]
    # => #<Atom: @id=4 @symbol="Kr" @name="Krpton" @atomic_weight=83.798>

    Atom["Krpton"]
    # => #<Atom: @id=4 @symbol="Kr" @name="Krpton" @atomic_weight=83.798>

    Atom[83.798]
    # => #<Atom: @id=4 @symbol="Kr" @name="Krpton" @atomic_weight=83.798>

## Requirements

* [dm-core](http://github.com/datamapper/dm-core#readme) ~> 1.0

## Install

    $ gem install dm-is-indexed

## Copyright

Copyright (c) 2011 Hal Brodigan

See {file:LICENSE.txt} for details.
