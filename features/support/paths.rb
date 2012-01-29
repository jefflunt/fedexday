module NavigationHelpers
  def path_to(page_name)
    case page_name
    when /the Ideas index page/
      ideas_path
    when /the Idea page for "([^\"]*)"/
      idea = Idea.find_by_title($1)
      idea_path(idea)
    when /the edit Idea page for "([^\"]*)"/
      idea = Idea.find_by_title($1)
      edit_idea_path(idea)
    # new_portals_path
    #
    # when /administrations page/
    # administrations_path
    #
    # when /the portal page for code "([^\"]*)"/
    # "/portals/#{$1}"
    #
    # when /the participant page for email "([^\"]*)"/
    # part = Participant.find_by_email($1)
    # "/participants/#{part.id}"
 
    # Add more mappings here.
    # Here is a more fancy example:
    #
    # when /^(.*)'s profile page$/i
    # user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
