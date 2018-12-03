require 'rails_helper'

describe Member do
  it "exists" do
    attributes = {}
    member = Member.new(attributes)

    expect(member).to be_a(Member)
  end

  it "has attributes" do
    attributes = { name: "Alice",
                   party: "I",
                   role: "Benevolent Dictator For Life",
                   district: 42
    }

    member = Member.new(attributes)

    expect(member.name).to eq("Alice")
    expect(member.party).to eq("I")
    expect(member.role).to eq("Benevolent Dictator For Life")
    expect(member.district).to eq(42)
  end
end
