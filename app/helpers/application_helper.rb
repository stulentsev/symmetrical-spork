# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def calendar_for(field_id)
    include_calendar_headers_tags
    image_tag("calendar.png", {:id => "#{field_id}_trigger",:class => "calendar-trigger"}) +
      javascript_tag("Calendar.setup({inputField : '#{field_id}', ifFormat : '%Y-%m-%d', button : '#{field_id}_trigger' });")
  end

  def include_calendar_headers_tags
    unless @calendar_headers_tags_included
      @calendar_headers_tags_included = true
      content_for :header_tags do
        javascript_include_tag('calendar/calendar') +
          javascript_include_tag("calendar/lang/calendar-#{current_language}.js") +
          javascript_include_tag('calendar/calendar-setup') +
          stylesheet_link_tag('calendar')
      end
    end
  end

  def fast_navigation
    zero_mark = [
    'Período',
    'Descritivos',
    'Perfil Geral dos Jovens',
    'Equipe do Projeto',
    'Planejamento',
    'Parceiros Envolvidos',
    'Observações Finais' ]

    language_choice = [
    'Semana da Acolhida',
    'Período de Rodízio',
    'Perfil dos Jovens',
    'Observações Finais' ]

    if params[:action] == 'edit'
      navigation = zero_mark
    else
       navigation = language_choice
    end

    navigation.inject("") do |memo, item|
      memo << content_tag(:li, content_tag(:a, item, :href => '#'), :class => 'em-branco') + " \n"
    end

  end
end
