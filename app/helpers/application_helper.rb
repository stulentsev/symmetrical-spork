# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def calendar_for(field_id)
    include_calendar_headers_tags
    image_tag("calendar.png", {:id => "#{field_id}_trigger", :class => "calendar-trigger"}) +
            javascript_tag("Calendar.setup({inputField : '#{field_id}',
                                      ifFormat : '%Y-%m-%d',
                                      button : '#{field_id}_trigger' });")
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
            'Período da Turma',
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

    coordinator_trimestrial_report = [
            'Conteúdos desenvolvidos',
            'Atividades interdisciplinares',
            'Desempenho da equipe' ]

    educator_trimestrial_report = [
            'Conteúdo desenvolvido',
            'Desempenho de educandos',
            'Observações' ]

    professional_profile = [
            'Dados pessoais',
            'Contatos',
            'Trabalhos',
            'Recado']


    navigation = case params[:controller]
    when 'courses'
      case params[:action]
      when 'edit'
        zero_mark
      when 'language_choice'
        language_choice
      else
        []
      end
    when 'coordinator_trimestrial_reports', 'educator_reports'
      trimestrial_report_navigation
    when 'student_reports'
      semestrial_report_navigation
    when 'student_professional_profiles'
      professional_profile
    else
      []
    end

    return navigation if !navigation.is_a?(Array)

    navigation.inject("") do |memo, item|
      anchor_id = item.downcase.gsub(' ', '-')
      memo << content_tag(:li, content_tag(:a,
                                           item,
                                           :href => 'javascript:void(0)',
                                           :onclick => "$('#{anchor_id}').scrollTo(); // bring element to viewport;
                                                        window.scrollBy(0, -130); // move it from under header;"),
                          :class => 'em-branco') + " \n"
    end

  end

  def should_show_fast_navigation
    ['edit', 'language_choice'].member?(params[:action])
  end
end
