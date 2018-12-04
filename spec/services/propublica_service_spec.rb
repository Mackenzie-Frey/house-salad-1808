require 'rails_helper'

describe PropublicaService do
  it "exists" do
    service = PropublicaService.new({state: "CO"})

    expect(service).to be_a(PropublicaService)
  end

  context "instance methods" do
    context "#members_of_house" do
      it "returns a hash" do
        VCR.use_cassette("propublica_service_spec") do
          service = PropublicaService.new({state: "CO"})

          expect(service.members_of_house).to be_a(Hash)
          expect(service.members_of_house).to have_key(:results)
          expect(service.members_of_house[:results]).to be_a(Array)
          expect(service.members_of_house[:results].first).to have_key(:name)
          expect(service.members_of_house[:results].first).to have_key(:party)
          expect(service.members_of_house[:results].first).to have_key(:district)
          expect(service.members_of_house[:results].first).to have_key(:role)
        end
      end
    end
  end
end
