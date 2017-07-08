require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "validations" do
    before do
      @link = Link.create(url: "www.google.com")
    end

    it "is valid with valid attributes" do
      expect(@link).to be_valid
    end

    it "is invalid if the url is not unique" do
      new_record = Link.create(url: "www.google.com")
      expect(new_record).to_not be_valid
      expect(new_record.errors.full_messages).to include("Url has already been taken")
    end

    it "is invalid if the unique_id is not unique" do
      allow(RandomString).to receive(:generate).with(7).and_return(@link.unique_id)

      new_record = Link.new(url: "www.facebook.com")
      expect { new_record.save!(validate: false) }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end

end
