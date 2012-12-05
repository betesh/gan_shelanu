module MainHelper
  def active_dd condition, &block
    args = {}
    args[:class] = :active if condition
    content_tag :dd, args do
      yield
    end
  end
  def centered_title text
    (content_tag :h2, :class => 'four columns centered' do; text; end).html_safe
  end
  def eight_columns_centered &block
    (content_tag :div, :class => 'row' do
      content_tag :div, :class => 'eight columns centered' do
        yield
      end
    end).html_safe
  end
  def partial_in_tab id, active=nil
    li_with_options id, active do
      render :partial => 'content', :locals => { :tab => id }
    end
  end
  def split_as_paragraphs text
    simple_format(text.gsub(/\n/,"\n\n")).html_safe
  end
  def li_with_options id, active, &block
    options = { :id => "#{id}Tab" }
    options.merge!({ :class => :active }) if active && :active == active.to_sym
    (content_tag :li, options do
      yield
    end).html_safe
  end
  def tab_for id
    (content_tag :a, :href => "##{id}" do; title_for(id); end).html_safe
  end
  def title_for id
    t(".#{id.to_s.underscore}_title").html_safe
  end
  def additional_tabs &block
    return if GanShelanu.config.additional_tabs.nil?
    GanShelanu.config.additional_tabs.each { |id|
      yield id
    }
  end
end
