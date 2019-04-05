require "./spec_helper"

describe DotPrison::Lexer do
  describe "#new" do
    it "created from String" do
      lex = DotPrison::Lexer.new("BEGIN test END")
      lex.class.should eq DotPrison::Lexer::StringBased
    end

    it "created from IO" do
      lex = DotPrison::Lexer.new(IO::Memory.new("BEGIN test END"))
      lex.class.should eq DotPrison::Lexer::IOBased
    end
  end

  describe "#next_token" do
    it "reads a String token from String" do
      lex = DotPrison::Lexer.new("TestKey TestValue")
      lex.next_token.value.should eq "TestKey"
      lex.next_token.value.should eq "TestValue"
      lex.next_token.type.should eq :EOF
    end

    it "reads a String token from IO" do
      lex = DotPrison::Lexer.new(IO::Memory.new("TestKey TestValue"))
      lex.next_token.value.should eq "TestKey"
      lex.next_token.value.should eq "TestValue"
      lex.next_token.type.should eq :EOF
    end

    it "reads quoted String" do
      lex = DotPrison::Lexer.new("\"42 23\"")
      lex.next_token.value.should eq "42 23"
      lex.next_token.type.should eq :EOF
    end
  end
end
