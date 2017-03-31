require 'pry'

class Team
  @@teams = []

  define_method(:initialize) do |name|
    @name = name
    @id = @@teams.length().+(1)
    @members = []

  end

  define_singleton_method(:find) do |identification|
    found_team = nil
    @@teams.each() do |team|
      if team.id().eql?(identification.to_i())
        found_team = team
      end
    end
  found_team
  end


  define_singleton_method(:all) do
    @@teams
  end

  define_singleton_method(:clear) do
    @@teams = []
  end

  define_method(:save) do
    @@teams.push(self)
  end

  define_method(:name) do
    @name
  end

  define_method(:members) do
    @members
  end

  define_method(:add_member) do |member|
    @members.push(member)
  end

  define_method(:id) do
    @id
  end

end
