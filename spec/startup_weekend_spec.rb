require('rspec')
require('member')
require('startup_weekend')


describe(Team) do
  before() do
    Team.clear
  end

  describe('.find') do
    it("finds the id of the team") do
      test_team = Team.new("We Have Gud Idea")
      test_team.save()
      test_team2 = Team.new("Plz listen to us pitch")
      test_team2.save()
      expect(Team.find(test_team.id())).to(eq(test_team))
    end
  end

  describe ('.all') do
    it("is where we will store our teams") do
      expect(Team.all()).to(eq([]))
    end
  end

  describe ('.clear') do
    it("clears out the teams array before putting something new in") do
      Team.new("BootStrapprs").save()
      Team.clear()
      expect(Team.all()).to(eq([]))
      end
    end

    describe ('#save') do
      it("saves our teams to the array") do
        test_team = Team.new("FundUS")
        test_team.save()
        expect(Team.all()).to(eq([test_team]))
      end
    end

    describe('#members') do
      it("initially returns an empty array of members for the team") do
        test_team = Team.new("Joe")
        expect(test_team.members()).to(eq([]))
      end
    end

  describe('#name') do
    it("returns the name of the team") do
      test_team = Team.new("Dizrupt")
      expect(test_team.name()).to(eq("Dizrupt"))
    end
  end

end
