module GestorHelper
  def get_school_row_id name
    "school-#{name}"
  end

  def generate_bar_table values
    result = '<table cellpadding=0 cellspacing=0">'
    values.each do |name, value|
      result += "<tr><td>#{name}</td><td class='value' style='width: #{value}px'>&nbsp;</td>
                    <td class='empty' style='width: #{100 - value.to_i}px'>&nbsp;</td>
                    <td>#{value}%</tr>"
    end
    result += '</table>'
  end

  def generate_single_value value, suffix = ''
    "<table><tr><td>
        #{value} #{suffix}
    </td></tr></table>"
  end
end
