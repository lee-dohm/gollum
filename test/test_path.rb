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

  test 'nil returned for invalid path' do
    assert_nil Gollum::Path.to_name('Filename.foo')
  end

  test 'name to path' do
    path = @path.to_path('Filename')

    assert_equal '/Filename.md', path
  end

  test 'name to path with subdirectory' do
    path = @path.to_path('Filename', 'sub/dir')

    assert_equal '/sub/dir/Filename.md', path
  end

  test 'name with spaces' do
    path = @path.to_path('Filename with spaces')

    assert_equal '/Filename_with_spaces.md', path
  end

  test 'name with multiple contiguous spaces' do
    path = @path.to_path('Filename   with    multiple    contiguous   spaces')

    assert_equal '/Filename_with_multiple_contiguous_spaces.md', path
  end

  test 'name with tab characters' do
    path = @path.to_path("Filename\twith\ttab\tcharacters")

    assert_equal '/Filename_with_tab_characters.md', path
  end

  test 'name with alternate wiki language' do
    path = @path.to_path('Filename', '', :mediawiki)

    assert_equal '/Filename.mediawiki', path
  end

  test 'name with spaces at the beginning and end' do
    path = @path.to_path('    Filename    ')

    assert_equal '/Filename.md', path
  end
end