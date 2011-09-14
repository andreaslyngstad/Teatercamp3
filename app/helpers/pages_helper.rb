module PagesHelper
  def padded_page_name(page,repeat = 2,padder = "&nbsp;")
    string = ""
      (page.ancestors.length*repeat).times { string << padder }
      string << page.name
  end

  
  def nested_set_list_for(pages)
    unless pages.empty?
    content_tag(:ul) do
    pages.each do |page|
      concat(content_tag(:li) do
        concat(link_to page.name, view_page_path(page.name) )
        concat(link_to ' | Opp', move_higher_page_path(page), :method => :get)
        concat(link_to ' ned', move_lower_page_path(page), :method => :get )
        concat(link_to ' oppdater', edit_page_path(page))
        concat(link_to ' slett', page, :confirm => "Vil du slette denne siden og alle sidene under den?", :method => :delete)
      end
      )
      concat(nested_set_list_for(page.children)) unless page.children.empty?
   end 
    end
    end
  end 
end
