module Nakajima
  module BetterEditInPlace
    # If you need to modify the message, change also string in src/editable.js
    DEFAULT_TEXT = '[clique para preencher]'

    def edit_in_place(resource, field, options={})
      # Get record to be edited. If resource is an array, pull it out.
      record = resource.is_a?(Array) ? resource.last : resource

      options[:id]  ||= "#{dom_id(record)}_#{field}"
      options[:tag] ||= :span
      options[:url] ||= url_for(resource)

      opts = {:url => options[:url], :type => options[:type] || :input}
      options[:rel] ||= h(opts.to_json.to_s)
      options.delete(:url)

      classes = options[:class].split(' ') rescue []
      classes << 'editable' if classes.empty?
      options[:class] = classes.uniq.join(' ')

      text = record.send(field)
      if !text || text.is_a?(String) && text.empty?
        text = DEFAULT_TEXT
      end

      content_tag(options.delete(:tag), text, options)
    end
  end
end

ActionView::Base.send :include, Nakajima::BetterEditInPlace
