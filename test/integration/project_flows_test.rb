require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "the index page lists all our projects" do
  	#Create a bunch of projects (3) in the DB (using FG)
  	p1 = FactoryGirl.create(:project)
  	p2 = FactoryGirl.create(:project, title: "Waterproof Whiteboard")
  	p3 = FactoryGirl.create(:project, title: "Something else?")

  	visit '/projects'
  	assert page.has_content?('Listing projects')

  	assert page.has_content?("Wifi-enabled Shoes")
  	assert page.has_content?("Waterproof Whiteboard")
  	assert page.has_content?("Something else?")

    click_link 'Waterproof Whiteboard'
    assert_equal project_path(p2),current_path
    assert find('h1:first').has_content? p2.title
  end

  	#assert that the page has projects listed
  	test "navigation" do
        visit "/"
        assert_equal root_path, current_path
        # The home nav element should be active
        assert_equal "Home", find('.navbar ul li.active a').text

        find('.navbar ul').click_link('Projects') # more specific: 
        assert_equal projects_path, current_path

        # The projects nav element should be active
        assert_equal "Projects", find('.navbar ul li.active a').text
    end

    # test "navigation" do
    #   visit "/"
    #   assert_equal root_path, current_path
    #   assert_equal "Home", find("ul.nav li.active a").text
    
    # visit "/projects"
    # assert_equal projects_url, current_path
    # assert_equal "Projects", find("ul.nav.li.active a").text
    # end
  	
  
end
