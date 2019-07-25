require 'bundler/setup'
Bundler.require
require_rel '../app'

class Cult
    attr_accessor :name, :location, :slogan, :followers
    attr_reader :founding_year
    @@all = []
    def initialize (name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @followers = []
        @@all << self
    end
    def recruit_follower(follower)
        new_bloodoath = BloodOath.new(self, follower)
        unless @followers.include? follower
        @followers << follower
        end
    end

    def cult_population
        self.followers.count
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find do |cult|
            cult.name == name
        end
    end
end

cult1 = Cult.new("John's cult", "Raleigh", 1991, "Raleigh is great!")
cult2 = Cult.new("Raza's cult", "Atl", 2019, "Atlanta is great!")

class Follower
    attr_accessor :name, :age, :life_motto, :cults
    @@all = []
    def initialize (name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @cults = []
        @@all << self
    end

    def join_cult (cult)
        new_bloodoath = BloodOath.new(cult, self)
        unless @cults.include? cult
            @cults << cult
        end
    end

    def self.all
        @@all
    end
end

maddie = Follower.new("Maddie", 25, "Life is great!")
shivang = Follower.new("Shivang", 22, "I love the dough!")

class BloodOath
    attr_accessor :date, :cult, :follower
    @@all = []

    def initialize (cult, follower, date = "_2019-07-25_")
        @cult = cult
        @follower = follower
        @date = date
        @@all << self
    end

    def initiation_date
        @date
    end

    def self.all
        @@all
    end
end



binding.pry