# 
# Copyright (c) 2012 by Lifted Studios.  All Rights Reserved.
# 

require File.expand_path(File.join(File.dirname(__FILE__), "helper"))

context "Path" do
  setup do
    @wiki = Gollum::Wiki.new(testpath('examples/lotr.git'))
    @path = @wiki.path_class.new(@wiki)
  end

  test 'can get path class from wiki' do
    assert_equal Gollum::Path, @wiki.path_class
    assert_equal Gollum::Path, @wiki.class.path_class
  end

  test 'can override the path class' do
    wiki = Gollum::Wiki.new(testpath('examples/lotr.git'), :path_class => Object)

    assert_equal Object, wiki.path_class
    assert_equal Gollum::Path, wiki.class.path_class
  end

  test "filename to name" do
    assert_equal 'Filename', Gollum::Path.to_name("Filename.md")
  end

  test "filename with spaces to name" do
    assert_equal 'Filename With Spaces', Gollum::Path.to_name("Filename_With_Spaces.md")
  end

  test "path to name" do
    assert_equal 'Filename', Gollum::Path.to_name("path/to/file/Filename.md")
  end

  test "path with spaces to name" do
    assert_equal 'Filename With Spaces', Gollum::Path.to_name("path/to/file/Filename_With_Spaces.md")
  end

  test "filename with url encoded spaces to name" do
    assert_equal 'Filename With Spaces', Gollum::Path.to_name("Filename+With+Spaces.md")
  end

  test "filename with url encoded underscores to name" do
    assert_equal 'Filename With Special Characters', Gollum::Path.to_name("Filename%5FWith%5FSpecial%5FCharacters.md")
  end

  test 'name to path' do
    path = @path.to_path('Filename')

    assert_equal '/Filename.md', path
  end
end