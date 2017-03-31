require 'pry'

class Member
  @@members = []

  define_method(:initialize) do |member_name|
    @member_name = member_name
    @id = @@members.length().+(1)
  end

    define_singleton_method(:find) do |identification|
      found_member = nil
      @@members.each() do |member|
        if member.id().eql?(identification.to_i())
          found_member = member
        end
      end
    found_member
    end

    define_singleton_method(:all) do
      @@members
    end

    define_singleton_method(:clear) do
      @@members = []
    end

    define_method(:save) do
      @@members.push(self)
    end

    define_method(:member_name) do
      @member_name
    end

    define_method(:id) do
      @id
    end

end
