# 
# Copyright (c) 2012 by Lifted Studios.  All Rights Reserved.
# 

require File.expand_path(File.join(File.dirname(__FILE__), "helper"))

context "Path" do
  test "filename to name" do
    assert_match %r{^Filename$}, Gollum::Path.to_name("Filename.md")
  end

  test "filename with spaces to name" do
    assert_match %r{^Filename With Spaces$}, Gollum::Path.to_name("Filename_With_Spaces.md")
  end

  test "path to name" do
    assert_match %r{^Filename$}, Gollum::Path.to_name("path/to/file/Filename.md")
  end

  test "path with spaces to name" do
    assert_match %r{^Filename With Spaces$}, Gollum::Path.to_name("path/to/file/Filename_With_Spaces.md")
  end

  test "filename with url encoded spaces to name" do
    assert_match %r{^Filename With Spaces$}, Gollum::Path.to_name("Filename+With+Spaces.md")
  end

  test "filename with url encoded underscores to name" do
    assert_match %r{^Filename With Special Characters$}, Gollum::Path.to_name("Filename%5FWith%5FSpecial%5FCharacters.md")
  end
end