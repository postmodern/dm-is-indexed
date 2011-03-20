require 'spec_helper'
require 'integration/models/atom'

describe DataMapper::Is::Indexed do
  before(:all) do
    Atom.auto_migrate!

    Atom.create(
      :symbol => 'He',
      :name => 'Helium',
      :atomic_weight => 4.002602
    )

    Atom.create(
      :symbol => 'Ne',
      :name => 'Neon',
      :atomic_weight => 20.1797
    )

    Atom.create(
      :symbol => 'Ar',
      :name => 'Argon',
      :atomic_weight => 39.948
    )

    Atom.create(
      :symbol => 'Kr',
      :name => 'Krypton',
      :atomic_weight => 83.798
    )

    Atom.create(
      :symbol => 'Xe',
      :name => 'Xeon',
      :atomic_weight => 131.293
    )

    Atom.create(
      :symbol => 'Rn',
      :name => 'Radon',
      :atomic_weight => 222.0
    )

    Atom.create(
      :symbol => 'Uuo',
      :name => 'Ununoctium',
      :atomic_weight => 294.0
    )
  end

  describe "Model.[]" do
    subject { Atom }

    it "should still allow selecting the nth resource" do
      subject[0].symbol.should == 'He'
    end

    it "should still allowing selecting ranges of resources" do
      resources = subject[0,1]

      resources[0].symbol.should == 'He'
      resources[1].symbol.should == 'Ne'
    end

    it "should allow querying properties with unique indexes" do
      subject['Ne'].name.should == 'Neon'
    end

    it "should query every property with an index" do
      subject['Neon'].symbol.should == 'Ne'
    end

    it "should query properties with a non-unique index" do
      subject[83.798].symbol.should == 'Kr'
    end

    it "should select the properties to query based on the key type" do
      subject[83.798].symbol.should == 'Kr'
    end
  end
end
