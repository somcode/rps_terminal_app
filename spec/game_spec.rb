require "game"

describe Game do

  subject { Game.new(stdout_mock, stdin_mock)}
  let(:stdout_mock) { double() }
  let(:stdin_mock) { double() }


  context "#prompt" do
    it "It prompts the user to select a weapon" do
      # arrange/assert
      allow(stdout_mock).to receive(:write) { "Choose your weapon: r/p/s\n" }
      # act
      subject.prompt
    end
  end

  context "#select" do
    it "It takes input from the user" do
      # arrange
      allow(stdin_mock).to receive(:read).and_return "r"
      # act
      expect(subject.select).to eq("r")
    end
  end

  context "#computer_move" do
    it "It selects a random weapom for the computer" do
      # arrange
      srand(0)
      # act/assert
      expect(subject.computer_move).to eq("r")
    end
  end


  context "#result" do
    it "choose the winner" do
      allow(stdin_mock).to receive(:read).and_return "p"
      subject.select
      srand(0)
      subject.computer_move
      expect(subject.result).to eq "You won"
    end
  end


end
