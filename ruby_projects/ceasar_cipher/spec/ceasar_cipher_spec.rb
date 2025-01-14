require './main.rb'

describe Cipher do
  describe "#code" do

    it "shifts by the input number" do
      cipher = Cipher.new
      expect(cipher.code("mama", 2)).to eql("ococ")
    end

    it "accepts a mix of upper and lower case letters" do
      cipher = Cipher.new
      expect(cipher.code("TaTa", 3)).to eql("wdwd")
    end

    it "loops through the alphabet" do
      cipher = Cipher.new
      expect(cipher.code("ZOrro", 1)).to eql("apssp")
    end

    it "defaults to no shift when shift value is not provided" do
      cipher = Cipher.new
      expect(cipher.code("POmPEi")).to eql("pompei")
    end
  end
end
  