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

    it "is invalid if the url is not a valid URL" do
      new_record = Link.new(url: "lkasjdfkjl")
      expect(new_record.valid?).to eq(false)
      expect(new_record.errors.messages[:url]).to include("This doesn't seem like a valid URL.")
    end

    it "is invalid without a url at all" do
      new_record = Link.new
      expect(new_record.valid?).to eq(false)
      expect(new_record.errors.messages[:url]).to include("It seems you didn't enter a URL.")
    end
  end

  describe "creating a URL" do
    it "should add the protocol if there is no protocol" do
      new_record = Link.create(url: "www.google.com")
      expect(new_record.url).to eq("http://www.google.com")
    end

    it "shouldn't do anything if there is already a HTTP or HTTPS protocol added" do
      new_record = Link.create(url: "https://www.google.com")
      expect(new_record.url).to eq("https://www.google.com")

      new_record = Link.create(url: "http://www.google.com")
      expect(new_record.url).to eq("http://www.google.com")
    end
  end

end
