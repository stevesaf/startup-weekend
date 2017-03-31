require('rspec')
require('member')
require('startup_weekend')


describe(Member) do
  before() do
    Member.clear
  end

  describe('.find') do
    it("finds the id of the member") do
      test_member = Member.new("Michael Jackson")
      test_member.save()
      test_member2 = Member.new("Michael Jordon")
      test_member2.save()
      expect(Member.find(test_member.id())).to(eq(test_member))
    end
  end

  describe ('.all') do
    it("is where we will store our members") do
      expect(Member.all()).to(eq([]))
    end
  end

  describe ('.clear') do
    it("clears out the teams array before putting something new in") do
      Member.new("Jackie Chan").save()
      Member.clear()
      expect(Member.all()).to(eq([]))
      end
    end

    describe ('#save') do
      it("saves our members to the array") do
        test_member = Member.new("Michael-Davidson Wallace")
        test_member.save()
        expect(Member.all()).to(eq([test_member]))
      end
    end

  describe('#member_name') do
    it("returns the name of the member") do
      test_member = Member.new("Peter Crocker-Jacobs")
      expect(test_member.member_name()).to(eq("Peter Crocker-Jacobs"))
    end
  end

end
