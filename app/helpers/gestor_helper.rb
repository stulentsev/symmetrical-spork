module GestorHelper
  def get_school_row_id name
    "school-#{name}"
  end

  def generate_bar_table values
    result = '<table>'
    values.each do |name, value|
      result += "<tr><td>#{name}</td>
                     <td><table cellpadding=0 cellspacing=0 style='margin-left: 0px'>
                        <td class='value' style='width: #{value}px'></td>
                    <td class='empty' style='width: #{100 - value.to_i}px'></td>
                    <td>#{value}#{'%' if value.to_i > 0}</tr></table></td>"
    end
    result += '</table>'
  end

  def generate_single_value value, suffix = ''
    "<table><tr><td>
        #{value} #{suffix}
    </td></tr></table>"
  end
end
